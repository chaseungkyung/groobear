<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/project/article.css" type="text/css">
	
	<style type="text/css">
		
	</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/projectHeader2.jsp"/>
	
	<main>
	    <button class="invite-button">초대하기</button>
	    
	    <button type="button" class="btnProjectStage">업무추가</button>
		<button type="button" class="btnProjectTask">업무추가</button>
	    
	    <div id="inviteModal" class="modal" style="display: none;">
	        <div class="modal-content">
	            <span class="close">&times;</span>
	            <h2>참여자 초대</h2>
	            <label class="input-label">참여자</label>
	            <input type="text" class="input-field" placeholder="참여자 입력">
	            <label class="input-label">팀</label>
	            <input type="text" class="input-field" placeholder="팀 입력">
	            <label class="input-label">역할</label>
	            <input type="text" class="input-field" placeholder="역할 입력">
	            <div class="button-group">
	                <button class="cancel-btn">취소</button>
	                <button class="submit-btn">등록</button>
	            </div>
	        </div>
	    </div>
		
		<div class="content-container">
            <div class="task-section">
                <h3>업무 목록</h3>
                <table class="task-table">
                    <thead>
                        <tr>
                            <th>업무명</th>
                            <th>상태</th>
                            <th>담당자</th>
                            <th>시작일</th>
                            <th>마감일</th>
                            <th>등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<tr>
	                        <td>디자인단계</td>
	                        <td>요청</td>
	                        <td>이자바</td>
	                        <td>2025-02-11</td>
	                        <td>2025-04-10</td>
	                        <td>2025-02-11</td>
                      	</tr>
                    
                        <c:forEach var="task" items="${taskList}">
                            <tr>
                                <td>${task.name}</td>
                                <td>${task.status}</td>
                                <td>${task.assignee}</td>
                                <td>${task.startDate}</td>
                                <td>${task.dueDate}</td>
                                <td>${task.createdDate}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            
            <div class="participant-section">
                <h3>참여자</h3>
                <div class="participant-card">
                    <div class="participant-info">
                        <span class="participant-icon">Y</span>
                        <div class="participant-details">
                            <strong>yylol (나)</strong>
                            <p>test</p>
                        </div>
                    </div>
                    <div class="participant-actions">
                        <button class="chat-btn">💬 채팅</button>
                        <button class="video-btn">📹 화상회의</button>
                    </div>
                </div>
            </div>
        </div>
		

	</main>
	
	
<script type="text/javascript">

$(function() {
    var modal = $("#inviteModal");
    var btn = $(".invite-button");
    var closeBtn = $(".close");
    var cancelBtn = $(".cancel-btn");
	
    modal.hide();
    
    btn.click(function() {
        modal.show();
    });

    closeBtn.click(function() {
        modal.hide();
    });

    cancelBtn.click(function() {
        modal.hide();
    });
});

</script>

</body>
</html>