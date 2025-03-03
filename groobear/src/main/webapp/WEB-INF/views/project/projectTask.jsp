<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/layout/project/headerResources.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/project/projectTask.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/project/stageModal.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/project/taskModal.css" type="text/css">

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

</head>
<body>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/layout/project/projectHeader2.jsp" />
<jsp:include page="/WEB-INF/views/project/stageModal.jsp" />
<jsp:include page="/WEB-INF/views/project/taskModal.jsp" />

<main>
	<div class="mainInner">
		
	    <div class="container"> 
			<div class="stage-header" data-projidx="${dto.projIdx}">
			    <span class="projectName">${dto.projName}</span>
			    <div class="stage-btn-area">
			        <button id="addStageBtn" class="addStageBtn">단계 추가</button>
			    </div>
			</div>
	        <table class="task-table">
	            <thead>
	                <tr>
	                    <th style="width: 45%">업무명</th>
	                    <th style="width: 10%;">상태</th>
	                    <th style="width: 10%">프로젝트 팀</th>
	                    <th style="width: 10%">시작일</th>
	                    <th style="width: 10%">마감일</th>
	                    <th style="width: 10%">등록일</th>
	                </tr>
	            </thead>
	            
	            <tbody>	            
					<c:forEach var="stageDto" items="${stageList}">
					    <tr>
					        <td class="stage-title" data-stageidx="${stageDto.stageIdx}" data-projidx="${stageDto.projIdx}">
					           <span>${stageDto.stageName} (${taskCountMap[stageDto.stageIdx]})</span>
					            <c:if test="${sessionScope.member.deptIdx == 'F' && sessionScope.member.empIdx == dto.pmEmpIdx}">	
					                <div class="right-group">
					                    <button id="addTaskBtn" class="addTaskBtn" data-stageidx="${stageDto.stageIdx}">업무 추가</button>	                    	
					                    <img class="stage-edit-btn" data-stageidx="${stageIdx}" src="${pageContext.request.contextPath}/dist/images/project/pencil.png">		                    	                 
					                    <img class="stage-delete-btn" src="${pageContext.request.contextPath}/dist/images/project/delete.png">
					                </div>
					            </c:if>	                   
					        </td>
					        <td class="stage-status">
					        	<span class="status" data-status="${stageDto.status}">
					        		<c:choose>
						        		<c:when test="${stageDto.status == 1}">요청</c:when>				
						        		<c:when test="${stageDto.status == 2}">진행</c:when>				
						        		<c:when test="${stageDto.status == 3}">완료</c:when>				
						        		<c:when test="${stageDto.status == 4}">보류</c:when>
					        		</c:choose>			
					        	</span>
					        </td>
					        <td class="stage-team">${stageDto.projTeamName}</td>
					        <td class="stage-start">${stageDto.startDate}</td>
					        <td class="stage-end">${stageDto.endDate}</td>
					        <td class="stage-regdate">${stageDto.createdAt}</td>
					    </tr>		      
					
						<!-- 해당 Stage에 속하는 Task 출력 -->
					    <c:forEach var="taskDto" items="${taskList}">
					        <c:if test="${taskDto.stageIdx == stageDto.stageIdx}">
					            <tr>
					                <td class="task-title"  data-taskidx="${taskDto.taskIdx}" data-stageidx="${taskDto.stageIdx}">
					                    <div>
					                        <img class="arrow-img" src="${pageContext.request.contextPath}/dist/images/project/skyarrow.png">
					                        <span>${taskDto.taskName}</span>
					                    </div>
					                    <c:if test="${sessionScope.member.deptIdx == 'F' && sessionScope.member.empIdx == dto.pmEmpIdx}">
					                        <div class="right-group">						 	                    	
					                            <img alt="" src="${pageContext.request.contextPath}/dist/images/project/pencil.png" class="task-edit-btn">
					                            <img alt="" src="${pageContext.request.contextPath}/dist/images/project/delete.png" class="task-delete-btn">
					                        </div>
					                    </c:if>
					                </td>
					                <td class="task-status">
					                	<span class="status" data-status="${taskDto.status}">
					                		<c:choose>
					                			<c:when test="${taskDto.status == 1}">요청</c:when>
					                			<c:when test="${taskDto.status == 2}">진행</c:when>
					                			<c:when test="${taskDto.status == 3}">완료</c:when>
					                			<c:when test="${taskDto.status == 4}">보류</c:when>
					                		</c:choose>
					                	</span>
					                </td>
					                <td class="stage-team">${stageDto.projTeamName}</td>
					                <td class="task-start">${taskDto.startDate}</td>
					                <td class="task-end">${taskDto.endDate}</td>
					                <td class="task-regdate">${taskDto.createdAt}</td>
					            </tr>
					        </c:if>
					    </c:forEach>
					</c:forEach>	                
	            </tbody>
	        </table>

	    </div>
    
	</div>

</main>

<script type="text/javascript">
$(function() {
	
	$('.task-delete-btn').on('click', function(){
		const taskIdx = $(this).closest('td.task-title').data('taskidx');
		const taskRow = $(this).closest('tr');
		
		if(confirm("업무를 삭제하시겠습니까?")) {
			deleteProjectTask(taskIdx, taskRow);
		}
	});
	
	// 단계 삭제 버튼 이벤트
	$('.stage-delete-btn').on('click', function(){
		const stageRow = $(this).closest('tr');
		const stageIdx = stageRow.find('.stage-title').data('stageidx');

		if(confirm("해당 단계를 삭제하면 포함된 모든 업무도 삭제됩니다. 계속하시겠습니까?")) {
			deleteProjectStage(stageIdx, stageRow);
		}
	});
	
	// AJAX 요청 - 업무 삭제
	const deleteProjectTask = function(taskIdx, taskRow) {
		const url = '${pageContext.request.contextPath}/project/deleteProjectTask/' + taskIdx;
		const fn = function(data) {
			if(data.state === 'true') {
				alert('업무가 삭제되었습니다.');
				taskRow.remove();
			} else{
				alert('업무 삭제에 실패했습니다.')
			}
		};
		
		ajaxRequest(url, 'get', null, 'json', fn);
	};
	
	
	// AJAX 요청 - 단계 삭제 (하위 업무 포함)
	const deleteProjectStage = function(stageIdx, stageRow) {
		const url = '${pageContext.request.contextPath}/project/deleteProjectStage/' + stageIdx;
		const fn = function(data) {
			if(data.state === 'true') {
				alert('단계 및 포함된 모든 업무가 삭제되었습니다.');
				
				// 해당 단계와 그 아래 모든 업무 삭제
				const taskRows = stageRow.nextUntil('tr:has(.stage-title)');
				stageRow.remove();
				taskRows.remove();
			} else {
				alert('단계 삭제에 실패했습니다.');
			}
		};
		ajaxRequest(url, 'get', null, 'json', fn);
	};
	
});



</script>

</body>
</html>