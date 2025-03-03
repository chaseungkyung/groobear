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
            <button id="InsertTaskBtn" class="task-insert-button">등록</button>
        </div>
    </div>
</div>

<script>

$(function() {

    // 모달 창 열기 (addTaskBtn)
    $('.addTaskBtn').click(function() {
        // class가 stage-title인 td 를 찾아서 data-stageidx 값을 가져옴
        const stageIdx = $(this).closest('td.stage-title').data('stageidx');
    	resetTaskModal(stageIdx);
        $('#taskModal').show();
    });

    // 모달 창 열기 (task-edit-btn)
    $('.task-edit-btn').click(function() {
        const stageIdx = $(this).closest('td.task-title').data('stageidx');
        const taskIdx = $(this).closest('td.task-title').data('taskidx');
        fillTaskModal(stageIdx, taskIdx);
        $('#taskModal').show();
    });

    // 모달 창 닫기
    $('.task-modal-close, #task-cancelBtn').click(function() {
        $('#taskModal').hide();
    });

    // AJAX 요청 - Task 조회
    const fetchProjectTask = function(taskIdx) {
        const url = '${pageContext.request.contextPath}/project/fetchProjectTask?taskIdx=' + taskIdx;

        const fn = function(data) {
            const task = data.projTask;
            $('#taskModal input[type="text"]').val(task.taskName);
            $('#taskModal textarea').val(task.content);
            $('#taskModal #start-date').val(task.startDate);
            $('#taskModal #end-date').val(task.endDate);
            $('.task-status-btns button').removeClass('active');
            $('.task-status-btns button').eq(task.status - 1).addClass('active');
        };

        const settings = {
            type: 'GET',
            success: fn
        };

        $.ajax(url, settings);
    };
	
    // 입력 값 확인
    const validateTaskInputs = function() {
        const title = $('#taskModal input.task-modal-title').val().trim();
        const startDate = $('#taskModal #start-date').val();
        const endDate = $('#taskModal #end-date').val();
        const activeStatusButton = $('.task-status-btns button.active');

        // 제목 검증
        if (!title) {
            alert('제목을 입력하세요.');
            $('#taskModal input.task-modal-title').focus();
            return false;
        }

        // 상태 버튼 검증
        if (activeStatusButton.length === 0) {
            alert('업무 상태를 선택하세요.');
            $('.task-status-btns').focus();
            return false;
        }

        // 시작일 검증
        if (!startDate) {
            alert('시작일을 입력하세요.');
            $('#taskModal #start-date').focus();
            return false;
        }

        // 종료일 검증
        if (!endDate) {
            alert('종료일을 입력하세요.');
            $('#taskModal #end-date').focus();
            return false;
        }

        return true; // 모든 검증 통과
    };
    
    // AJAX 요청 - Task 등록
    const sendProjectTask = function() {
    	
    	if (!validateTaskInputs()) return;
    	
        const mode = $('#InsertTaskBtn').data('mode');    
        const taskIdx = $('#InsertTaskBtn').data('taskidx');
        const stageIdx = $('#InsertTaskBtn').data('stageidx');

        const url = '${pageContext.request.contextPath}/project/sendProjectTask?mode=' + mode;

        const title = $('#taskModal input[type="text"]').val();
        const content = $('#taskModal textarea').val();
        const startDate = $('#taskModal #start-date').val();
        const endDate = $('#taskModal #end-date').val();

        const statusText = $('.task-status-btns button.active').text().trim();
        const statusValue = {'요청': 1, '진행': 2, '완료': 3, '보류': 4}[statusText] || 1;

        const taskData = {
            stageIdx : stageIdx,
            taskName: title,
            status: statusValue,
            startDate: startDate,
            endDate: endDate,
            content: content
        };
        if (mode === 'update') taskData.taskIdx = taskIdx;

        const fn = function(data) {
            if (data.state === 'true') {
                if (mode === 'insert') alert('업무가 등록되었습니다.');
                else alert('업무가 수정되었습니다.');
                location.reload();
            } else {
                alert('업무 등록에 실패했습니다.');
            }
        };

        const settings = {
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(taskData),
            success: fn
        };

        $.ajax(url, settings);
    };

    // 상태 버튼 선택 기능
    $('.task-status-btns button').click(function() {
        $('.task-status-btns button').removeClass('active');
        $(this).addClass('active');
    });

    // 모달 초기화 (등록 모드)
    const resetTaskModal = function(stageIdx) {
        $('#taskModal input[type="text"]').val('');  // 제목 초기화
        $('#taskModal textarea').val('');  // 내용 초기화
        $('#taskModal input[type="date"]').val('');  // 날짜 초기화
        $('.task-status-btns button').removeClass('active'); // 상태 버튼 초기화
        $('.modal-status.request').addClass('active'); // 기본 선택값 설정

        $('#InsertTaskBtn').data('stageidx', stageIdx);
        $('#InsertTaskBtn').data('mode', 'insert');
        $('#InsertTaskBtn').text('등록');
    };

    // 모달 초기화 (수정 모드)
    const fillTaskModal = function(stageIdx, taskIdx) {
        fetchProjectTask(taskIdx);

        $('#InsertTaskBtn').data('taskidx', taskIdx);
        $('#InsertTaskBtn').data('stageidx', stageIdx);
        $('#InsertTaskBtn').data('mode', 'update');
        $('#InsertTaskBtn').text('수정');
    };
    
    $('#InsertTaskBtn').click(function() {
        sendProjectTask();
    });
    
});
</script>

<script>


</script>