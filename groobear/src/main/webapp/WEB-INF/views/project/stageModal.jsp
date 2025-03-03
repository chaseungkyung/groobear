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
                <select name="projTeamSelect" id="projTeamSelect">
                	<option value="">팀 선택하기</option>
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
            <button id="InsertStageBtn" class="stage-insert-button">등록</button>
        </div>
    </div>
</div>

<script>
const projIdx = ${projIdx};

$(function() {
    // 모달 창 열기(addStageBtn)
    $('.addStageBtn').click(function() {
    	const projIdx = $(this).closest('.stage-header').data('projidx');
    	resetStageModal(projIdx);
        $('#stageModal').show();
    });
    
    // 모달 창 열기 (stage-edit-btn)
    $('.stage-edit-btn').click(function() {
        const projIdx = $(this).closest('.stage-title').data('projidx');
    	const stageIdx = $(this).closest('.stage-title').data('stageidx');
       	fillStageModal(projIdx, stageIdx);
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
    
    
    // AJAX 프로젝트 팀 목록 조회
    const fetchProjTeamList = function (selectProjTeam) {
    	const url = '${pageContext.request.contextPath}/project/fetchProjectTeams';
    	let params = {projIdx};
    	
    	const fn = function(data) {
    		let projTeamList = data.projTeamList;

            let selectOptions = '<option value="">팀 미정</option>';
    		if (projTeamList.length > 0) {
                projTeamList.forEach(team => {
                    selectOptions += '<option value="' + team.projTeamIdx + '">' + team.projTeamName + '</option>';
                });
            }
            selectProjTeam.html(selectOptions);
    	};
    	ajaxRequest(url, 'GET', params, 'json', fn);
    };

    $("#projTeamSelect").on("mousedown", function () {
            fetchProjTeamList($(this));
    });
 
    
    // 입력 값 확인
    const validateStageInputs = function() {
        const title = $('#stageModal input.stage-modal-title').val().trim();
        const startDate = $('#stageModal #start-date').val();
        const endDate = $('#stageModal #end-date').val();
        const activeStatusButton = $('.stage-status-btns button.active');
        
        // 프로젝트 팀 선택 값 가져오기
        const projTeamSelect = $('#projTeamSelect');
	    const projTeamIdx = projTeamSelect.val();
	    const selectedTeamName = projTeamSelect.find('option:selected').text().trim();

        // 제목 검증
        if (!title) {
        	alert('단계 제목을 입력하세요.');
            $('#stageModal input.stage-modal-title').focus();
            return false;
        }

        // 상태 버튼 검증
        if (activeStatusButton.length === 0) {
        	alert('단계 상태를 선택하세요.');
            $('.stage-status-btns').focus();
            return false;
        }

        // 시작일 검증
        if (!startDate) {
        	alert('시작일을 입력하세요.');
            $('#stageModal #start-date').focus();
            return false;
        }

        // 종료일 검증
        if (!endDate) {
        	alert('종료일을 입력하세요.');
            $('#stageModal #end-date').focus();
            return false;
        }
        
        // 프로젝트 팀 선택 검증 (팀 선택하기만 막기)
        if (selectedTeamName === "팀 선택하기") {
            alert('프로젝트 팀을 선택하세요.');
            $('#projTeamSelect').focus();
            return false;
        }

        return true;
    };
    
    
    // AJAX - JSON Stage 등록
    const sendProjectStage = function() {
    	if (!validateStageInputs()) return;   	
    	
    	const mode = $('#InsertStageBtn').data('mode');  	  	
    	const projIdx = $('#InsertStageBtn').data('projidx');
    	const stageIdx = $('#InsertStageBtn').data('stageidx');  	
    	const title = $('.stage-modal-title').val();
    	const startDate = $('#start-date').val();
    	const endDate = $('#end-date').val();
    	const content = $('textarea').val().trim() || null;
    	
    	const projTeamIdx = $('#projTeamSelect').val() || null;  	
    	const selectedTeamName = $('#projTeamSelect option:selected').text().trim(); 
    	const projTeamName = selectedTeamName === "팀 미정" ? null : selectedTeamName;
    	
    	let statusText = $('.stage-status-btns .active').text().trim();
        let statusValue = 1; // 기본값: 요청 (1)

        // 상태 값 매핑
        if (statusText === '요청') {
            statusValue = 1;
        } else if (statusText === '진행') {
            statusValue = 2;
        } else if (statusText === '완료') {
            statusValue = 3;
        } else if (statusText === '보류') {
            statusValue = 4;
        }
        
        const url = '${pageContext.request.contextPath}/project/sendProjectStage?mode=' + mode;
        
        const stageData = {
        	projIdx: projIdx,
        	stageName: title,
        	status: statusValue,
        	startDate: startDate,
        	endDate: endDate,
        	content: content,
        	projTeamIdx: projTeamIdx,
        	projTeamName: projTeamName
        };
        
        if(mode === 'update') stageData.stageIdx = stageIdx;
        
        const fn = function(data) {
        	if(data.state === 'true') {
        		if(mode === 'insert') alert('단계가 등록되었습니다.');
        		else alert('단계가 수정되었습니다.');
        		location.reload();
        		
        	} else {
        		alert('단계 등록에 실패했습니다.')
        	}
        };
        
        const settings = {
			type: 'POST',
 			contentType: 'application/json',
 			data: JSON.stringify(stageData),
 			success: fn
		};
    	
        $.ajax(url, settings);
    };
    
    $('#InsertStageBtn').click(function() {
        sendProjectStage();
    });
    
      
    // AJAX 요청 - Stage 조회
    const fetchProjectStage = function(stageIdx) {
    	const url = '${pageContext.request.contextPath}/project/fetchProjectStage?stageIdx=' + stageIdx;
    
    	const fn = function(data) {
    		const stage = data.projStage;
    		$('#stageModal input[type="text"]').val(stage.stageName);
            $('.stage-status-btns button').removeClass('active');
            $('.stage-status-btns button').eq(stage.status - 1).addClass('active');
            $('#stageModal #start-date').val(stage.startDate);
            $('#stageModal #end-date').val(stage.endDate);
          	
            $('#projTeamSelect').val(stage.projTeamIdx || '');
            if (stage.projTeamName && stage.projTeamName.length > 0) {
                $('#projTeamSelect option').each(function() {
                    if ($(this).text().trim() === stage.projTeamName) {
                        $(this).prop('selected', true);
                    }
                });
            }

            $('#stageModal textarea').val(stage.content);
    	};
    	
    	const settings = {
                type: 'GET',
                success: fn
            };

            $.ajax(url, settings);
    };
    
    // 모달 초기화
    const resetStageModal = function(projIdx) {
	    $('#stageModal input.stage-modal-title').val('');  // 제목 초기화
	    $('#stageModal textarea').val('');  // 내용 초기화
	    $('#stageModal input[type="date"]').val('');  // 날짜 초기화
	    $('.stage-status-btns button').removeClass('active'); // 상태 버튼 초기화
	    $('.modal-status.request').addClass('active'); // 기본 선택값 설정
	
	    // 프로젝트 팀 선택 초기화
	    $('#projTeamSelect').val('');
	    setTimeout(() => {
	        $('#projTeamSelect').prepend('<option value="" selected>팀 선택하기</option>'); 
	    }, 100);
	
	    // `InsertStageBtn` 버튼에 프로젝트 ID 저장
	    $('#InsertStageBtn').data('projidx', projIdx);
	    $('#InsertStageBtn').data('mode', 'insert');
	    $('#InsertStageBtn').text('단계 등록');
	
	};

    
    // 모달 수정 모드
    const fillStageModal = function(projIdx, stageIdx) {
    	fetchProjectStage(stageIdx);
    	
    	$('#InsertStageBtn').data('projidx', projIdx);
    	$('#InsertStageBtn').data('stageidx', stageIdx);
    	$('#InsertStageBtn').data('mode', 'update');
    	$('#InsertStageBtn').text('수정');
    };
    


    
    
    
});
</script>