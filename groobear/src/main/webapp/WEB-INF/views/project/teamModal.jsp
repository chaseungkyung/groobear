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
            projTeamList.forEach(team => { createNewTeam(team); });
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
                memberHtml += '<div class="project-member-info" data-empIdx="' + member.empIdx + '">';
                memberHtml += '  <div class="project-member-img">';
                memberHtml += '    <img alt="" src="https://cdn-icons-png.flaticon.com/128/847/847969.png">';
                memberHtml += '  </div>';
                memberHtml += '  <div class="project-member-name">' + member.empName + '</div>';
                memberHtml += '</div>';

                if(member.projTeamIdx) {
                    $('#teamContainer .projTeam-input').each(function() {
                        if ($(this).data('projteamidx') == member.projTeamIdx) {
                            // 기존 코드에서는 memberHtml을 여러 번 추가하는 부분이 있으나,
                            // 보통 한 번만 추가하면 되므로 필요에 따라 수정하실 수 있습니다.
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

    // 팀 생성 함수
    const createNewTeam = function(team) {
        let teamHtml = '';
        teamHtml += '<div class="team-add-area">';
        teamHtml += '  <div class="team-header">';
        teamHtml += '    <input type="text" class="projTeam-input" placeholder="팀 이름 입력">';
        teamHtml += '    <button class="delete-team-btn">X</button>';
        teamHtml += '  </div>';
        teamHtml += '  <div class="team-box">';
        teamHtml += '  </div>';
        teamHtml += '</div>';

        $('#teamContainer').append(teamHtml);

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
    const resetModal = function(){
        $('.project-member-list').empty();
        $('#teamContainer').empty();
        fetchProjTeamList();
        fetchProjMemberList();
    };

    // 팀 추가 버튼 클릭 이벤트
    $('#addTeamBtn').click(function() {
        createNewTeam();
    });

    // 동적으로 생성된 삭제 버튼 이벤트 핸들러
    $(document).on("click", ".delete-team-btn", function() {
        $(this).closest(".team-add-area").remove();
    });
    
    $(document).on("click", ".remove-member", function() {
        $(this).closest(".team-member").remove();
    });

    // 초기화 버튼 클릭 시 모달 초기화
    $('.team-reset').click(function() {
        resetModal();
    });
});
</script>