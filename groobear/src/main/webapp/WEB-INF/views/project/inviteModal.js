// selectedUsers : 선택된 사용자 목록 -> user 객체를 담는 배열
// user : { empIdx = "", projIdx = "", projTeamIdx = "" }
// selectedUsers를 AJAX로 컨트롤러에 전송할 것. 요청 주소는 '/project/inviteUser'
// status = true 시 성공 메시지 출력하고 확인 누르면 새로고침
// status = false 시 실패 메시지 출력


let selectedUsers = [];

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
            let searchValue = $(this).val().trim();

            if (searchValue) {
                let url = '${pageContext.request.contextPath}/project/fetchEmpList';
                let params = { empSearch: searchValue };

                const fn = function (data) {
                    let empList = data.empList;
                    let userList = $('#userList');
                    userList.empty();

                    if (empList) {
                        empList.forEach(emp => {
                            let firstChar = emp.empName.charAt(0);
                            let listItem = '';

                            listItem += '<li class="invite-user-item">';
                            listItem += '  <input type="checkbox" class="invite-select-user" data-empidx="' + emp.empIdx + '"';

                            // 기존에 선택된 사용자라면 체크 유지
                            if (selectedUsers[emp.empIdx]) {
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
    const fetchProjTeamList = function () {
        let url = '${pageContext.request.contextPath}/project/fetchProjectTeams';
        let params = { projIdx: '${projIdx}' };

        const fn = function (data) {
            let projTeamList = data.projTeamList;
            let selectOptions = '';

            if (projTeamList) {
                projTeamList.forEach(team => {
                    selectOptions += '<option value="' + team.projTeamIdx + '">' + team.projTeamName + '</option>';
                });
            }

            $(".select-projTeam").html(selectOptions);
        };
        ajaxRequest(url, 'GET', params, 'json', fn);
    };

    // 참여자 객체를 목록에 추가하는 함수
    function addSelectedUser(user) {
        let selectedUserHtml = "";
        let selectedCount = $(".select-count").text().split("건")[0] * 1 + 1;

        selectedUsers.push(user);

        selectedUserHtml += '<div class="selected-user" data-empidx="' + user.empIdx + '">';
        selectedUserHtml += '    <div class="user-info-container">';
        selectedUserHtml += '        <span class="selected-user-name">' + user.empName + '</span>';
        selectedUserHtml += '        <select class="select-projTeam">';
        selectedUserHtml += '            <option value="">팀 선택</option>';
        selectedUserHtml += '        </select>';
        selectedUserHtml += '        <button class="remove-user">✖</button>';
        selectedUserHtml += '    </div>';
        selectedUserHtml += '</div>';

        // 선택된 참여자 목록 업데이트
        if (selectedCount > 0) {
            $(".default-text").hide();
            $(".selected-users").show();
            $("#selectedUserList").html(selectedUserHtml);
            $(".select-count").text(selectedCount + "건 선택");
        } else {
            $(".default-text").show();
            $(".selected-users").hide();
        }
    };

    // 체크박스 선택 시 참여자 추가 진행
    $(document).on("change", ".invite-select-user", function () {
        const empIdx = $(this).data("empidx");
        const userItem = $(this).closest(".invite-user-item");
        const empName = userItem.find(".user-name").text();
        addSelectedUser({ empIdx, empName });
    });

    // 전체 삭제 버튼 클릭 시
    $(".remove-all").click(function () {
        // 체크 해제
        $(".invite-select-user").prop("checked", false);
        // 선택된 참여자 삭제
        $(".selected-user").remove();
        // 선택한 참여자 수 업데이트
        countSelectedUsers();
    });

    // 선택된 참여자 삭제
    $(document).on("click", ".remove-user", function () {
        const userEl = $(this).closest(".selected-user");
        const empIdx = selectedUser.data("empidx");

        // 참여자를 목록에서 삭제
        userEl.remove();

        // 체크박스에서 해당 참여자 체크 해제
        $(".invite-user-item").each(function () {
            if ($(this).find(".invite-select-user").data("empidx") === empIdx) {
                $(this).find(".invite-select-user").prop("checked", false);
            }
        });

        // 선택한 참여자 수 업데이트
        countSelectedUsers();
    });

    // 선택한 참여자 수 계산 및 업데이트
    // selected-user div의 개수를 계산
    function countSelectedUsers() {
        const selectedCount = $(".selected-user").length;
        $(".select-count").text(selectedCount + "건 선택");

        if (selectedCount > 0) {
            $(".default-text").hide();
            $(".selected-users").show();
        } else {
            $(".default-text").show();
            $(".selected-users").hide();
        }
    };
});