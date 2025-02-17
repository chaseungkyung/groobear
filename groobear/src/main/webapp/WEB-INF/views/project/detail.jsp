<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/project/detail.css" type="text/css">
	
	<style type="text/css">
		
	</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/projectHeader2.jsp"/>
	
	<main>
		<div class="mainInner">
			<div class="projectName">
				<h4>테스트</h4>
			</div>
		
			<div class="btnArea">
				<button type="button" class="task-btn">업무추가</button>
		    	<button type="button" class="invite-btn">초대하기</button>
		    </div>
		    
			
			<div class="taskList">
	            <div class="task-section">
	                <h3 class="task-title">업무 목록</h3>
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
		                        <td class="stage">
		                        	디자인단계
		                        	<div class="stageInner">
	                        			<img alt="" src="${pageContext.request.contextPath}/dist/images/common/plus.png">
		                        	</div>
		                        </td>
		                        <td>요청</td>
		                        <td>이자바</td>
		                        <td>2025-02-11</td>
		                        <td>2025-04-10</td>
		                        <td>2025-02-11</td>
	                      	</tr>
	                      	
	                      	<tr>
		                        <td>모델링</td>
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
	            
	            <div class="member-section">
	                <h4 class="section-title">
	                	<span class="memberSpan">참여자</span>
	                	<span class="memberCount">12</span>        	
	                </h4>
	                	                         
	                <div class="memberList">
	                    <div class="member-info">
	                        <div class="member-title">프로젝트 관리자</div>
	                        
	                        <div class="member-details">
	                        	<div class="name-rank">
	                        		<span>김자바</span>
	                        		<span>직급</span>
	                        	</div>	                        	
	                            <div class="teamName">
	                            	<p>팀이름</p>
	                            </div>
	                        </div>
	                        
	                        <div class="member-details">
	                            <div class="name-rank">
	                        		<span>이자바</span>
	                        		<span>직급</span>
	                        	</div>	                        	
	                            <div class="teamName">
	                            	<p>팀이름</p>
	                            </div>
	                        </div>
	                    </div>             
	                </div>
	            </div>
	            
	        </div>
		</div>

	</main>
		    	
	<!-- 업무 추가 모달 -->
	<div id="taskModal" class="modal" style="display: none;">
    	<div class="task-content">
            <span class="close">&times;</span>
            <h2>업무 작성</h2>
            
            <label class="input-label">제목</label>
            <input type="text" class="input-field" placeholder="제목을 입력하세요.">
            
            <div class="button-group">
	            <button type="button" class="" >요청</button>
	            <button type="button" class="">진행</button>
	            <button type="button" class="">피드백</button>
	            <button type="button" class="">완료</button>
	            <button type="button" class="">보류</button>
            </div>
            
            <label class="input-label">담당자</label>
            <input type="text" class="input-field" placeholder="담당자 추가">
            
            <label class="input-label">시작일</label>
            <input type="date" class="input-field" placeholder="시작일 추가">
            
            <label class="input-label">마감일</label>
            <input type="date" class="input-field" placeholder="마감일 추가">
            
            <div class="button-group">
                <button type="button" class="cancel-btn">취소</button>
                <button type="button" class="submit-btn">등록</button>
            </div>
        </div>
    </div>
    
   	<!-- 하위 업무추가 모달 -->
	<div id="myPlusModal" class="modal" style="display: none;">
    	<div class="plus-content">
            <span class="close">&times;</span>
            <h2>업무 작성</h2>
            
            <label class="input-label">제목</label>
            <input type="text" class="input-field" placeholder="제목을 입력하세요.">
            
            <div class="button-group">
	            <button type="button" class="" >요청</button>
	            <button type="button" class="">진행</button>
	            <button type="button" class="">피드백</button>
	            <button type="button" class="">완료</button>
	            <button type="button" class="">보류</button>
            </div>
            
            <label class="input-label">담당자</label>
            <input type="text" class="input-field" placeholder="담당자 추가">
            
            <label class="input-label">시작일</label>
            <input type="date" class="input-field" placeholder="시작일 추가">
            
            <label class="input-label">마감일</label>
            <input type="date" class="input-field" placeholder="마감일 추가">
            
            <label class="input-label">메모</label>
            <textarea class="input-field memo" placeholder="내용을 입력하세요."></textarea>
            
            <div class="button-group">
                <button type="button" class="cancel-btn">취소</button>
                <button type="button" class="submit-btn">등록</button>
            </div>
        </div>
    </div>
    
    <!-- 참여자 모달 -->
    <div id="inviteModal" class="modal" style="display: none;">
        <div class="invite-content">
            <span class="close">&times;</span>
            <h2>참여자 초대</h2>
            <label class="input-label">참여자</label>
            <input type="text" class="input-field" placeholder="참여자 입력">
            <label class="input-label">팀</label>
            <input type="text" class="input-field" placeholder="팀 입력">
            <label class="input-label">역할</label>
            <input type="text" class="input-field" placeholder="역할 입력">
            <div class="button-group">
                <button type="button" class="cancel-btn">취소</button>
                <button type="button" class="submit-btn">초대</button>
            </div>
        </div>
    </div>
	
<script type="text/javascript">

/* 초대하기 클릭 */
 
$(function() {
    var modal = $("#inviteModal");
    var btn = $(".invite-btn");
    var closeBtn = $("#inviteModal .close");
    var cancelBtn = $("#inviteModal .cancel-btn");
	
    modal.hide();
    
    btn.click(function() {
    	modal.fadeIn(300);
    });

    closeBtn.click(function() {
        modal.fadeOut(300);
    });

    cancelBtn.click(function() {
        modal.fadeOut(300);
    });
});


/* 업무추가 클릭 */
$(function() {
    var modal = $("#taskModal");
    var btn = $(".task-btn");
    var closeBtn = $("#taskModal .close");
    var cancelBtn = $("#taskModal .cancel-btn");
	
    modal.hide();
    
    btn.click(function() {
        modal.fadeIn(300);
    });

    closeBtn.click(function() {
        modal.fadeOut(300);
    });

    cancelBtn.click(function() {
        modal.fadeOut(300);
    });
});


/* 하위 업무추가 클릭 */
$(function() {
    var modal = $("#myPlusModal");
    var closeBtn = $("#myPlusModal .close");
    var cancelBtn = $("#myPlusModal .cancel-btn");
	
    modal.hide();
    
    /* 동적 생성됐을 때 이벤트 위임 */
    $('.task-section').on('click', '.stageInner', function(){
    	modal.fadeIn(300);
    });
    
    closeBtn.on('click', function(){
    	modal.fadeOut(300);
    });
    
    cancelBtn.on('click', function(){
    	modal.fadeOut(300);
    });
});


</script>

</body>
</html>