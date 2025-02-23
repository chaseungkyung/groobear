<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/layout/project/headerResources.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/project/task.css" type="text/css">
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
<jsp:include page="/WEB-INF/views/layout/projectHeader2.jsp" />
<jsp:include page="/WEB-INF/views/project/stageModal.jsp" />
<jsp:include page="/WEB-INF/views/project/taskModal.jsp" />

<main>
	<div class="mainInner">
		
	    <div class="container"> 
			<div class="stage-header">
			    <span class="projectName">프로젝트 이름</span>
			    <div class="stage-btn-area">
			        <button id="stageAddBtn" class="stage-add-btn">단계 추가</button>
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
	                <tr>
	                    <td class="stage-title">
	                    	<span>1111</span>
	                    	<div class="right-group">
		                    <c:if test="${sessionScope.member.deptIdx == 'F' && sessionScope.member.positionCode == 5}">	
		                    	<button id="taskAddBtn" class="task-add-btn">업무 추가</button>	                    	
		                    	<img class="stage-update" src="${pageContext.request.contextPath}/dist/images/project/pencil.png">		                    	                 
		                    	<img class="stage-delete" src="${pageContext.request.contextPath}/dist/images/project/delete.png">
	                    	</c:if>	                   
	                    	</div>
	                    </td>
	                    <td class="stage-satus"><span class="status request">요청</span></td>
	                    <td class="stage-team">디자인팀</td>
	                    <td class="stage-start">2025-02-15</td>
	                    <td class="stage-end">2025-03-01</td>
	                    <td class="stage-regdate">2025-02-21</td>
	                </tr>
	                
	                <tr>
						<td class="task-title">
							<div>
								<img class="arrow-img" src="${pageContext.request.contextPath}/dist/images/project/curvedArrow.png">
						    	<span> 하위 1111</span>
							</div>
						    <div class="right-group">	                    	
						        <img alt="" src="${pageContext.request.contextPath}/dist/images/project/pencil.png">		                    	                 
						        <img alt="" src="${pageContext.request.contextPath}/dist/images/project/delete.png">
						    </div>
						</td>
	                    <td class="task-satus"><span class="status request">요청</span></td>
	                    <td class="task-team">-</td>
	                    <td class="task-start">2025-02-15</td>
	                    <td class="task-end">2025-03-01</td>
	                    <td class="task-regdate">2025-02-21</td>
	                </tr>
	                
	                <tr>
	                    <td class="task-title">
							<div>
								<img class="arrow-img" src="${pageContext.request.contextPath}/dist/images/project/curvedArrow.png">
						    	<span> 하위 2222</span>
							</div>
	                    	<div class="right-group">
		                    	<img alt="" src="${pageContext.request.contextPath}/dist/images/project/pencil.png">
		                    	<img alt="" src="${pageContext.request.contextPath}/dist/images/project/delete.png">
	                    	</div>
	                    </td>
	                    <td class="task-satus"><span class="status request">요청</span></td>
	                    <td class="task-team">-</td>
	                    <td class="task-start">2025-02-15</td>
	                    <td class="task-end">2025-03-01</td>
	                    <td class="task-regdate">2025-02-21</td>
	                </tr>
	                	                
	                <tr>
	                    <td class="stage-title">
	                    	<span>2222</span>
	                    	<div class="right-group">
		                    	<button id="taskAddBtn" class="task-add-btn">업무 추가</button>
		                    	<img alt="" src="${pageContext.request.contextPath}/dist/images/project/pencil.png">
		                    	<img alt="" src="${pageContext.request.contextPath}/dist/images/project/delete.png">
	                    	</div>
	                    </td>
	                    <td class="stage-satus"><span class="status progress">진행</span></td>
	                    <td class="stage-team">-</td>
	                    <td class="stage-start">-</td>
	                    <td class="stage-end">-</td>
	                    <td class="stage-regdate">2025-02-21</td>	                </tr>
	                <tr>
	                    <td class="stage-title">
	                    	<span>3333</span>
	                    	<div class="right-group">
		                    	<button id="taskAddBtn" class="task-add-btn">업무 추가</button>
		                    	<img alt="" src="${pageContext.request.contextPath}/dist/images/project/pencil.png">
		                    	<img alt="" src="${pageContext.request.contextPath}/dist/images/project/delete.png">
	                    	</div>
	                    </td>
	                    <td class="stage-satus"><span class="status complete">완료</span></td>
	                    <td class="stage-team">-</td>
	                    <td class="stage-start">-</td>
	                    <td class="stage-end">-</td>
	                    <td class="stage-regdate">2025-02-21</td>	                </tr>
	                <tr>
	                    <td class="stage-title">
	                    	<span>4444</span>
	                    	<div class="right-group">
		                    	<button id="taskAddBtn" class="task-add-btn">업무 추가</button>
		                    	<img alt="" src="${pageContext.request.contextPath}/dist/images/project/pencil.png">
		                    	<img alt="" src="${pageContext.request.contextPath}/dist/images/project/delete.png">
	                    	</div>
	                    </td>
	                    <td class="stage-satus"><span class="status hold">보류</span></td>
	                    <td class="stage-team">-</td>
	                    <td class="stage-start">-</td>
	                    <td class="stage-end">-</td>
	                    <td class="stage-regdate">2025-02-21</td>	                </tr>
	            </tbody>
	        </table>

	    </div>
    
	</div>

</main>

</body>
</html>