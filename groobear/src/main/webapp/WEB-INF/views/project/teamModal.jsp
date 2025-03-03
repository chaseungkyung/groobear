<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

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
    $('#team-cancelBtn').click(function() {
        $('#teamModal').hide();
    });
    
    $('.team-close').click(function(){
    	$('#teamModal').hide();
    });

	// AJAX - 프로젝트 팀 목록 조회
	const fetchProjTeamList = function () {
        const url = '${pageContext.request.contextPath}/project/fetchProjectTeams';
        let params = { projIdx };

        const fn = function (data) {
            let projTeamList = data.projTeamList;
			projTeamList.forEach(team => {createNewTeam(team)});
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
            				$(this).closest('.team-add-area').find('.team-box').append(memberHtml);
            				$(this).closest('.team-add-area').find('.team-box').append(memberHtml);
            				$(this).closest('.team-add-area').find('.team-box').append(memberHtml);
            				$(this).closest('.team-add-area').find('.team-box').append(memberHtml);
            				$(this).closest('.team-add-area').find('.team-box').append(memberHtml);
        				}
    				});
				} else {
					$('.project-member-list').append(memberHtml);
				}
			});
		};
		ajaxRequest(url, 'GET', params, 'json', fn);
	}

	// 팀 생성 함수
	const createNewTeam = function(team) {
		// 함수에 인자가 있으면, parameter에 해당하는 팀을 생성
		// 함수에 인자가 없으면, 비어있는 팀 생성
		// team = { projTeamIdx, projTeamName, projIdx }
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

		if(team.projTeamName) {
			$('#teamContainer .team-add-area:last .projTeam-input').val(team.projTeamName);
			$('#teamContainer .team-add-area:last .projTeam-input')
    			.attr('data-projteamidx', team.projTeamIdx)
    			.data('projteamidx', team.projTeamIdx);
		}
	}

	// 최초 로딩
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
        $(this).closest(".team-add-area").remove();  // 해당 팀 삭제
    });
    
    $(document).on("click", ".remove-member", function() {
        $(this).closest(".team-member").remove();  // 해당 멤버 삭제
    });

	// 초기화 버튼 클릭 시 모달 초기화
	$('.team-reset').click(function() {
		resetModal();
	});
    
});
</script>