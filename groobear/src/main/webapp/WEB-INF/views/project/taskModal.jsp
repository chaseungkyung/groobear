<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<div id="taskModal" class="task-modal">
    <div class="task-modal-content">
        <div class="task-modal-header">
            <h2>업무 작성</h2>
            <span class="task-modal-close">&times;</span>
        </div>

        <div class="task-modal-body">
            <input class="task-modal-title" type="text" placeholder="제목을 입력하세요.">
            
            <div class="task-status-btns">
                <button class="modal-status request active">요청</button>
                <button class="modal-status progress">진행</button>
                <button class="modal-status complete">완료</button>
                <button class="modal-status hold">보류</button>
            </div>

            <div class="task-form">
                
				<div class="task-date-container">
				    <div class="task-date-group">
				        <label for="start-date" class="task-label">시작일</label>
				        <input type="date" id="start-date" class="task-date-input">
				    </div>
				    <div class="task-date-group">
				        <label for="end-date" class="task-label">종료일</label>
				        <input type="date" id="end-date" class="task-date-input">
				    </div>
				</div>

                <textarea placeholder="내용을 입력하세요."></textarea>
            </div>
        
        </div>

        <div class="task-modal-footer">
            <button id="task-cancelBtn" class="task-cancel-button">취소</button>
            <button id="taskBtn" class="task-add-button">등록</button>
        </div>
    </div>
</div>

<script>
$(function() {
    // 모달 창 열기
    $('#taskAddBtn').click(function() {
        $('#taskModal').show();
    });

    // 모달 창 닫기
    $('.task-modal-close, #task-cancelBtn').click(function() {
        $('#taskModal').hide();
    });

    // 상태 버튼 선택
    $('.task-status-btns button').click(function() {
        $('.task-status-btns button').removeClass('active');
        $(this).addClass('active');
    });
});
</script>