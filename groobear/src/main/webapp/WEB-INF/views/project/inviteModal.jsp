<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!-- 모달 -->
<div id="inviteModal" class="invite-modal">
    <div class="invite-modal-content">
        <div class="invite-modal-header">
            <h2>참여자 초대</h2>
            <span class="invite-close">&times;</span>
        </div>

        <!-- 컨텐츠 영역 -->
        <div class="invite-modal-body">
            <!-- 왼쪽 영역 (검색 + 리스트) -->
            <div class="invite-left-section">
                <!-- 검색 영역 -->
                <div class="invite-search-box">
                    <input type="text" id="searchInput" placeholder="이름, 소속, 전화번호 검색">
                    <button id="invite-searchBtn"><i class="bi bi-search"></i></button>
                </div>

                <!-- 검색한 직원 리스트 -->
                <div class="invite-user-list">
                    <ul id="userList">

                    </ul>
                </div>
                
            </div>

            <!-- 오른쪽 영역 (대상 선택 정보) -->
            <div class="right-section">
                <p class="default-text">대상을 선택해주세요.</p>
                <div class="selected-users" style="display: none;">
                    <div class="header">
                        <span class="select-count">0건 선택</span>
                        <button class="remove-all">전체 삭제</button>
                    </div>
                    <div id="selectedUserList"></div>
                </div>
            </div>
        </div>

        <!-- 버튼 영역 -->
        <div class="invite-modal-footer">
            <button id="invite-cancelBtn" class="invite-cancel-button">취소</button>
            <button type="button" id="inviteBtn" class="modal-invite-button">초대하기</button>
        </div>
    </div>
</div>

<script>
let selectedUsers = [];
const projIdx = ${projIdx};

$(document).ready(function () {
    // 모달 열기
    $("#inviteModalBtn").click(function () {
        $("#inviteModal").show();
    });

    // 모달 닫기
    $(".invite-close, #invite-cancelBtn").click(function () {
        $("#inviteModal").hide();
    });

    // AJAX - 사원 검색
    $('#searchInput').on('keydown', function (evt) {
        let key = evt.key || evt.keyCode;

        if (key === 'Enter' || key === 13) {
            evt.preventDefault();
            let searchKwd = $(this).val().trim();

            if (searchKwd) {
                const url = '${pageContext.request.contextPath}/project/fetchEmpList';
                
                let params = { searchKwd: searchKwd, projIdx: projIdx};

                const fn = function (data) {
                    let empList = data.empList;
                    let userList = $('#userList');
                    userList.empty();
                    console.log(empList);

                    if (empList.length !== 0) {
                        empList.forEach(emp => {
                            let firstChar = emp.empName.charAt(0);
                            let listItem = '';

                            listItem += '<li class="invite-user-item">';
                            listItem += '  <input type="checkbox" class="invite-select-user" data-empidx="' + emp.empIdx + '"';

                            // 기존에 선택된 사용자라면 체크 유지
                            if (selectedUsers.find(user => user.empIdx === emp.empIdx)) {
                                listItem += ' checked';
                            }
                            listItem += '>';

                            listItem += '  <span class="invite-user-avatar">' + firstChar + '</span>';
                            listItem += '  <div class="user-info">';
                            listItem += '    <p class="user-name">' + emp.empName + '</p>';
                            listItem += '    <p class="user-role">' + emp.orgUnitName + '</p>';
                            listItem += '  </div>';
                            listItem += '</li>';

                            userList.append(listItem);
                        });
                    } else {
                        userList.append('<li>검색된 직원이 없습니다.</li>');
                    }
                };
                ajaxRequest(url, 'GET', params, 'json', fn);
            }
        }
    });

    // AJAX - 프로젝트 팀 목록 조회
    const fetchProjTeamList = function (selectedUserEL) {
        const url = '${pageContext.request.contextPath}/project/fetchProjectTeams';
        let params = { projIdx };

        const fn = function (data) {
            let projTeamList = data.projTeamList;
            let selectOptions = '';

            if (projTeamList) {
                projTeamList.forEach(team => {
                    selectOptions += '<option value="' + team.projTeamIdx + '">' + team.projTeamName + '</option>';
                });
            }

            selectedUserEL.html(selectOptions);
        };
        ajaxRequest(url, 'GET', params, 'json', fn);
    };

    // AJAX - selectedUsers 배열을 JSON으로 서버에 전송
    const sendSelectedUsers = function () {
        const url = '${pageContext.request.contextPath}/project/sendProjectMemberList?projIdx=' + projIdx;

        const fn = function (data) {
            if (data.state === 'true') {
                alert('초대가 완료되었습니다.');
                location.reload();
            } else {
                alert('초대에 실패했습니다.');
            }
        };

        const settings = {
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(selectedUsers),
            success: fn
        };

        $.ajax(url, settings);
    };

    // 참여자 객체를 목록에 추가하는 함수
    function addSelectedUser(user) {
        selectedUsers.push(user);

        let selectedUserHtml = "";
        selectedUserHtml += '<div class="selected-user" data-empidx="' + user.empIdx + '">';
        selectedUserHtml += '    <div class="user-info-container">';
        selectedUserHtml += '        <span class="selected-user-name">' + user.empName + '</span>';
        selectedUserHtml += '        <select class="select-projTeam">';
        selectedUserHtml += '            <option value="">팀 선택하기</option>';
        selectedUserHtml += '        </select>';
        selectedUserHtml += '        <button class="remove-user">✖</button>';
        selectedUserHtml += '    </div>';
        selectedUserHtml += '</div>';

        $("#selectedUserList").append(selectedUserHtml);

        // 팀 선택을 moudedown 시 프로젝트 팀 목록 조회하는 이벤트 핸들러 추가
        // 이벤트가 일어난 객체만 ajax요청을 갖다 오고 나머지 selected-user 객체들은 그대로 둔다.
        $(".select-projTeam").on("mousedown", function () {
            fetchProjTeamList($(this.closest(".selected-user")).find(".select-projTeam"));
        });

        // 선택된 참여자 목록 업데이트
        countSelectedUsers();
    };

    // 체크박스 toggle 시 참여자 추가 / 삭제
    $(document).on("change", ".invite-select-user", function () {
        const empIdx = $(this).data("empidx");
        const userItem = $(this).closest(".invite-user-item");
        const empName = userItem.find(".user-name").text();

        const user = { empIdx, empName };
        if ($(this).is(":checked")) {
            addSelectedUser(user);
        } else {
            removeSelectedUser(empIdx);
        }
    });

    // 오른쪽 목록에서 전체 삭제 버튼 클릭 시
    $(".remove-all").click(function () {
        // selectedUsers 배열 초기화
        selectedUsers = [];

        // 선택된 참여자 삭제
        $(".selected-user").remove();

        // 체크 해제
        $(".invite-select-user").prop("checked", false);
        
        // 선택한 참여자 수 업데이트
        countSelectedUsers();
    });

    // 오른쪽 목록에서 선택된 참여자 삭제
    $(document).on("click", ".remove-user", function () {
        const userEL = $(this).closest(".selected-user");
        const empIdx = userEL.data("empidx");
        /*
        // 참여자를 목록에서 삭제
        userEL.remove();

        // selectedUsers 배열에서 삭제
        selectedUsers = selectedUsers.filter(user => user.empIdx !== empIdx);

        // 선택한 참여자 수 업데이트
        countSelectedUsers();
        */
        removeSelectedUser(empIdx);
        // 왼쪽 체크박스에서 해당 참여자 체크 해제
        $(".invite-user-item").each(function () {
            if ($(this).find(".invite-select-user").data("empidx") === empIdx) {
                $(this).find(".invite-select-user").prop("checked", false);
            }
        });
    });

    // 참여자를 삭제하는 함수
    function removeSelectedUser(empIdx) {

        // selectedUsers 배열에서 삭제
        selectedUsers = selectedUsers.filter(user => user.empIdx !== empIdx);

        // 참여자를 오른쪽 목록에서 삭제
        $(".selected-user[data-empidx='" + empIdx + "']").remove();

        // 선택한 참여자 수 업데이트
        countSelectedUsers();
    };

    // 선택한 참여자 수 계산 및 업데이트
    // selected-user div의 개수를 계산
    function countSelectedUsers() {
        const selectedCount = selectedUsers.length;
        $(".select-count").text(selectedCount + "건 선택");

        if (selectedCount > 0) {
            $(".default-text").hide();
            $(".selected-users").show();
        } else {
            $(".default-text").show();
            $(".selected-users").hide();
        }
    };

    // 초대하기 버튼 클릭 시 이벤트
    // 1) selectedUsers 배열에 선택한 팀 정보를 추가
    // 2) sendSelectedUsers 함수를 호출하여 서버에 전송
    $("#inviteBtn").click(function () {
        $(".selected-user").each(function () {
            const empIdx = $(this).data("empidx");
            const projTeamIdx = $(this).find(".select-projTeam").val();

            const user = selectedUsers.find(user => user.empIdx === empIdx);
            user.projTeamIdx = projTeamIdx;
        });

        sendSelectedUsers();
    });
});

</script>



