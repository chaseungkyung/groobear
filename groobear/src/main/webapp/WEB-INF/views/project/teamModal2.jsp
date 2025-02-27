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
			<div class="project-member-info">
				<div class="project-member-img">
					<img alt="" src="https://cdn-icons-png.flaticon.com/128/847/847969.png">
				</div>
				<div class="project-member-name">박민기</div>
			</div>

			<div class="project-member-info">
				<div class="project-member-img">
					<img alt="" src="https://cdn-icons-png.flaticon.com/128/847/847969.png">
				</div>
				<div class="project-member-name">김대희</div>
			</div>				

			<div class="project-member-info">
				<div class="project-member-img">
					<img alt="" src="https://cdn-icons-png.flaticon.com/128/847/847969.png">
				</div>
				<div class="project-member-name">김재우</div>
			</div>				

			<div class="project-member-info">
				<div class="project-member-img">
					<img alt="" src="https://cdn-icons-png.flaticon.com/128/847/847969.png">
				</div>
				<div class="project-member-name">김지수</div>
			</div>

			<div class="project-member-info">
				<div class="project-member-img">
					<img alt="" src="https://cdn-icons-png.flaticon.com/128/847/847969.png">
				</div>
				<div class="project-member-name">박보람</div>
			</div>
			
			<div class="project-member-info">
				<div class="project-member-img">
					<img alt="" src="https://cdn-icons-png.flaticon.com/128/847/847969.png">
				</div>
				<div class="project-member-name">송이현</div>
			</div>

			<div class="project-member-info">
				<div class="project-member-img">
					<img alt="" src="https://cdn-icons-png.flaticon.com/128/847/847969.png">
				</div>
				<div class="project-member-name">장민준</div>
			</div>	
			
			<div class="project-member-info">
				<div class="project-member-img">
					<img alt="" src="https://cdn-icons-png.flaticon.com/128/847/847969.png">
				</div>
				<div class="project-member-name">이수정</div>
			</div>	
			
			<div class="project-member-info">
				<div class="project-member-img">
					<img alt="" src="https://cdn-icons-png.flaticon.com/128/847/847969.png">
				</div>
				<div class="project-member-name">김지현</div>
			</div>
			
			<div class="project-member-info">
				<div class="project-member-img">
					<img alt="" src="https://cdn-icons-png.flaticon.com/128/847/847969.png">
				</div>
				<div class="project-member-name">이성우</div>
			</div>
			
			<div class="project-member-info">
				<div class="project-member-img">
					<img alt="" src="https://cdn-icons-png.flaticon.com/128/847/847969.png">
				</div>
				<div class="project-member-name">김아름</div>
			</div>											
		</div>
		
		<div class="add-team-btn-area">
			<button class="add-team-btn" id="addTeamBtn">+ 팀 추가</button>			
		</div>
		
		<div class="team-modal-body" id="teamContainer"></div>
		
		<div class="team-modal-footer">
			<button class="close-modal" id="team-cancelBtn">닫기</button>
			<button class="team-create">팀 등록</button>
		</div>
		
	</div>
	
</div>

<script>
$(function () {
    // 모달 창 열기/닫기
    $('#teamModalBtn').click(function () {
        $('#teamModal').show();
    });
    $('#team-cancelBtn, .team-close').click(function () {
        $('#teamModal').hide();
    });

    // 팀 추가 버튼 클릭 시 새로운 팀 박스 생성
    $('#addTeamBtn').click(function () {
        let teamAdd = '';
        teamAdd += '<div class="team-add-area">';
        teamAdd += '  <div class="team-header">';
        teamAdd += '    <input type="text" class="team-input" placeholder="팀 이름 입력">';
        teamAdd += '    <button class="delete-team-btn">X</button>';
        teamAdd += '  </div>';
        teamAdd += '  <div class="team-box">';
        teamAdd += '  </div>';
        teamAdd += '</div>';

        $('#teamContainer').append(teamAdd);

        // 새로 추가된 팀 박스에도 droppable 기능 등록
        $('#teamContainer .team-add-area:last .team-box').droppable({
            accept: ".project-member-info",
            drop: function(event, ui) {
                ui.draggable.data("dropped", true);
                $(this).append(ui.draggable);
                ui.draggable.css({top: 0, left: 0});
            }
        });
    });

    // 팀 삭제 이벤트 (동적 요소 처리)
    $(document).on("click", ".delete-team-btn", function () {
        $(this).closest(".team-add-area").remove();
    });

    // 멤버 삭제 이벤트 (동적 요소 처리)
    $(document).on("click", ".remove-member", function () {
        $(this).closest(".team-member").remove();
    });

    // 드래그 가능하도록 설정 (실제 element가 이동하도록 구현)
    $(".project-member-info").draggable({
        revert: "invalid", // 유효한 droppable이 없으면 원래 위치로 복귀
        zIndex: 1001,
        start: function(event, ui) {
            // 원래 부모를 저장
            $(this).data("origParent", $(this).parent());
            // 드롭 여부 초기화
            $(this).data("dropped", false);
            // 부모 제약(overflow) 문제 해결을 위해 body에 임시 부착
            $("body").append($(this));
        },
        stop: function(event, ui) {
            // 드롭된 경우에는 이미 새 컨테이너에 append되었음
            if (!$(this).data("dropped")) {
                // 유효 droppable에 떨어지지 않은 경우 원래 부모로 복귀
                var origParent = $(this).data("origParent");
                origParent.append($(this));
                $(this).css({top: 0, left: 0});
            }
        }
    });

    // 팀 박스에 드롭 가능하도록 설정
    $(".team-box").droppable({
        accept: ".project-member-info",
        drop: function(event, ui) {
            ui.draggable.data("dropped", true);
            $(this).append(ui.draggable);
            ui.draggable.css({top: 0, left: 0});
        }
    });

    // 프로젝트 멤버 리스트에 다시 드롭 가능하도록 설정 (리스트로 복귀)
    $(".project-member-list").droppable({
        accept: ".project-member-info",
        drop: function(event, ui) {
            ui.draggable.data("dropped", true);
            $(this).append(ui.draggable);
            ui.draggable.css({top: 0, left: 0});
        }
    });
});
</script>
