<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 팀 편성 모달 -->
<div id="teamModal" class="team-modal">

	<div class="team-modal-content">
	
		<div class="team-modal-header">
			<h3>팀 편성</h3>
			<span class="team-close">x</span>
		</div>
		<div class="project-member-list">										
		</div>
		
		<div class="add-team-btn-area">
			<button class="add-team-btn" id="addTeamBtn">+ 팀 추가</button>			
		</div>
		
		<div class="team-modal-body" id="teamContainer"></div>
		
		<div class="team-modal-footer">
			<button class="button close-modal" id="team-cancelBtn">닫기</button>
			<button class="team-create">팀 등록완료</button>
			<button class="button team-reset">초기화</button>
		</div>
		
	</div>
	
</div>

<script>
let originalProjMembers = [];
let originalProjTeams = [];

let updatedProjMembers = [];
let updatedProjTeams = [];
let deletedProjTeams = [];

let newTeamCount = -1;

$(function() {
    // 모달 창 열기
    $('#teamModalBtn').click(function() {
        $('#teamModal').show();
        resetModal();
    });

    // 모달 창 닫기
    $('#team-cancelBtn, .team-close').click(function() {
        $('#teamModal').hide();
    });
    
    // AJAX - 프로젝트 팀 목록 조회
    const fetchProjTeamList = function () {
        const url = '${pageContext.request.contextPath}/project/fetchProjectTeams';
        let params = { projIdx };

        const fn = function (data) {
            let projTeamList = data.projTeamList;

            projTeamList.forEach(team => {
                createNewTeam(team);
                originalProjTeams.push(team);
            });
            // 팀이 추가된 후, 드롭 가능한 영역 초기화
            initDroppable();
        };
        ajaxRequest(url, 'GET', params, 'json', fn);
    };

    // AJAX - 팀 참여자 목록 조회
    const fetchProjMemberList = function() {
        const url = '${pageContext.request.contextPath}/project/fetchProjectMemberList';
        let params = { projIdx };
        const fn = function(data) {
            let projMemberList = data.projMemberList;

            projMemberList.forEach(member => {
                let memberHtml = '';
                memberHtml += '<div class="project-member-info" data-projmemberidx="' + member.projMemberIdx + '">';
                memberHtml += '  <div class="project-member-img">';
                memberHtml += '    <img alt="" src="https://cdn-icons-png.flaticon.com/128/847/847969.png">';
                memberHtml += '  </div>';
                memberHtml += '  <div class="project-member-name">' + member.empName + '</div>';
                memberHtml += '</div>';

                originalProjMembers.push(member);

                if(member.projTeamIdx) {
                    $('#teamContainer .projTeam-input').each(function() {
                        if ($(this).data('projteamidx') == member.projTeamIdx) {
                            $(this).closest('.team-add-area').find('.team-box').append(memberHtml);
                        }
                    });
                } else {
                    $('.project-member-list').append(memberHtml);
                }
            });
            // 멤버가 추가된 후 드래그/드롭 기능 초기화
            initDraggable();
            initDroppable();
        };
        ajaxRequest(url, 'GET', params, 'json', fn);
    };

	// AJAX - 팀과 참여자 변경사항 전송
	const sendProjTeamUpdates = function() {
		const url = '${pageContext.request.contextPath}/project/sendProjectTeamUpdates/' + projIdx;

        const fn = function(data) {
            if(data.state === 'true') {
                alert('팀 편성이 완료되었습니다.');
                // alert(updatedProjMembers.length + updatedProjTeams.length + deletedProjTeams.length + '개의 데이터가 변경되었습니다.');
                location.reload();
            } else {
                alert('팀 편성에 실패했습니다.');
            }
        };

        const settings = {
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({updatedProjMembers, updatedProjTeams, deletedProjTeams}),
            success: fn
        };

        $.ajax(url, settings);
	};
	
    // 팀 생성 함수
    const createNewTeam = function(team) {
        let teamHtml = '';
        teamHtml += '<div class="team-add-area">';
        teamHtml += '  <div class="team-header">';
        teamHtml += '    <input type="text" class="projTeam-input" placeholder="팀 이름 입력" data-projteamidx="' + newTeamCount-- + '">';
        teamHtml += '    <button class="delete-team-btn">X</button>';
        teamHtml += '  </div>';
        teamHtml += '  <div class="team-box">';
        teamHtml += '  </div>';
        teamHtml += '</div>';

        $('#teamContainer').append(teamHtml);

        // team이 있으면 팀 이름 입력란에 팀 이름 채워넣기
        if(team && team.projTeamName) {
            $('#teamContainer .team-add-area:last .projTeam-input').val(team.projTeamName);
            $('#teamContainer .team-add-area:last .projTeam-input')
                .attr('data-projteamidx', team.projTeamIdx)
                .data('projteamidx', team.projTeamIdx);
        }

        // 새로 생성된 팀 박스도 드롭 가능한 영역으로 초기화
        initDroppable();
    };

    // 드래그 가능하도록 초기화하는 함수
    const initDraggable = function() {
        $('.project-member-info').draggable({
            revert: "invalid",    // 올바른 드롭 영역에 놓이지 않으면 원위치
            helper: "clone",      // 드래그 시 복제본 표시
            cursor: "move",
            start: function(event, ui) {
                $(this).addClass("dragging");
            },
            stop: function(event, ui) {
                $(this).removeClass("dragging");
            }
        });
    };

    // 드롭 가능한 영역 초기화 함수
    const initDroppable = function() {
        // 팀 박스와 프로젝트 멤버 목록 모두 드롭 영역으로 설정
        $('.team-box, .project-member-list').droppable({
            accept: ".project-member-info",
            drop: function(event, ui) {
                var $dragged = ui.draggable;
                // 원본 요소를 새로운 영역으로 이동 (clone이 아닌 실제 요소 이동)
                $dragged.detach().css({top: 0, left: 0}).appendTo($(this));
            },
            over: function(event, ui) {
                $(this).addClass("droppable-hover");
            },
            out: function(event, ui) {
                $(this).removeClass("droppable-hover");
            }
        });
    };

    // 모달 초기화 함수
    const resetModal = async function(){
        $('.project-member-list').empty();
        $('#teamContainer').empty();

        originalProjMembers = [];
        originalProjTeams = [];

        await fetchProjTeamList();
        await fetchProjMemberList();

    };

    // 팀 추가 버튼 클릭 이벤트
    $('#addTeamBtn').click(function() {
        createNewTeam();
    });

    // 동적으로 생성된 삭제 버튼 이벤트 핸들러
    $(document).on("click", ".delete-team-btn", function() {
        $(this).closest('.team-add-area').find('.project-member-info').each(function() {
            $('.project-member-list').append($(this));
        });
        deletedProjTeams.push($(this).closest('.team-add-area').find('.projTeam-input').data('projteamidx'));
        $(this).closest('.team-add-area').remove();
    });
    
    $(document).on("click", ".remove-member", function() {
        $(this).closest(".team-member").remove();
    });

    // 초기화 버튼 클릭 시 모달 초기화
    $('.team-reset').click(function() {
        resetModal();
    });

    // 기존과 비교하여 변경된 팀원 정보를 반영하는 함수
    const checkProjMemberUpdates = function() {        
        $('.project-member-list .project-member-info').each(function() {
            const projMemberIdx = $(this).data('projmemberidx');
            const projTeamIdx = null;

            const originalMember = originalProjMembers.find(member => member.projMemberIdx == projMemberIdx);
            if (originalMember.projTeamIdx != projTeamIdx) {
                updatedProjMembers.push({ projMemberIdx, projTeamIdx });
            }
        });

        $('#teamContainer .team-add-area').each(function(index) {
            const projTeamIdx = $(this).find('.projTeam-input').data('projteamidx');

            $(this).find('.project-member-info').each(function() {
                const projMemberIdx = $(this).data('projmemberidx');

                if (projTeamIdx > 0) {
                    const originalMember = originalProjMembers.find(member => member.projMemberIdx == projMemberIdx);
                    if (originalMember.projTeamIdx != projTeamIdx) {
                        updatedProjMembers.push({ projIdx, projMemberIdx, projTeamIdx });
                    }
                } else {
                    updatedProjMembers.push({ projIdx, projMemberIdx, projTeamIdx });
                }
            });
        });

        console.log(updatedProjMembers);
    };

    // 기존과 비교하여 변경된 팀 정보를 반영하는 함수
    const checkProjTeamUpdates = function() {
        $('#teamContainer .team-add-area').each(function(index) {
            const projTeamIdx = $(this).find('.projTeam-input').data('projteamidx');
            const projTeamName = $(this).find('.projTeam-input').val();

            if (projTeamIdx > 0) {
                const originalTeam = originalProjTeams.find(team => team.projTeamIdx == projTeamIdx);
                if (originalTeam.projTeamName != projTeamName) {
                    updatedProjTeams.push({ projIdx, projTeamIdx, projTeamName });
                }
            } else {
                updatedProjTeams.push({ projIdx, projTeamIdx, projTeamName });
            }
        });

        console.log(updatedProjTeams);
    };

    // 유효성 검사
    const checkValidation = function() {
        let isValid = true;
        $('#teamContainer .team-add-area').each(function() {
            const teamName = $(this).find('.projTeam-input').val();
            if (teamName.trim() === '') {
                alert('팀 이름을 입력해주세요.');
                $(this).find('.projTeam-input').focus();
                isValid = false;
                return false;
            }
        });
        return isValid;
    };


    // 팀 등록완료 버튼 클릭 시 AJAX 요청
    $('.team-create').click(function() {
        if (!checkValidation()) return false;
        checkProjMemberUpdates();
        checkProjTeamUpdates();
        sendProjTeamUpdates();
    });

});
</script>
