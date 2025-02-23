<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<div id="stageModal" class="stage-modal">
    <div class="stage-modal-content">
        <div class="stage-modal-header">
            <h2>단계 작성</h2>
            <span class="stage-modal-close">&times;</span>
        </div>

        <div class="stage-modal-body">
            <input class="stage-modal-title" type="text" placeholder="제목을 입력하세요.">
            
            <div class="stage-status-btns">
                <button class="modal-status request active">요청</button>
                <button class="modal-status progress">진행</button>
                <button class="modal-status complete">완료</button>
                <button class="modal-status hold">보류</button>
            </div>

            <div class="stage-form">
            	<div class="team-select-title">프로젝트 팀 선택</div>
                <select name="" id="">
                	<option value="">미지정</option>
                	<option value="">디자인팀</option>
                	<option value="">erd팀</option>
                	<option value="">전체</option>
                </select>
                
				<div class="stage-date-container">
				    <div class="stage-date-group">
				        <label for="start-date" class="stage-label">시작일</label>
				        <input type="date" id="start-date" class="stage-date-input">
				    </div>
				    <div class="stage-date-group">
				        <label for="end-date" class="stage-label">종료일</label>
				        <input type="date" id="end-date" class="stage-date-input">
				    </div>
				</div>

                <textarea placeholder="내용을 입력하세요."></textarea>
            </div>
        
        </div>

        <div class="stage-modal-footer">
            <button id="stage-cancelBtn" class="stage-cancel-button">취소</button>
            <button id="stageBtn" class="stage-add-button">등록</button>
        </div>
    </div>
</div>

<script>
$(function() {
    // 모달 창 열기
    $('#stageAddBtn').click(function() {
        $('#stageModal').show();
    });

    // 모달 창 닫기
    $('.stage-modal-close, #stage-cancelBtn').click(function() {
        $('#stageModal').hide();
    });

    // 상태 버튼 선택
    $('.stage-status-btns button').click(function() {
        $('.stage-status-btns button').removeClass('active');
        $(this).addClass('active');
    });
});
</script>