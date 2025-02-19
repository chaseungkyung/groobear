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
		<div class="inner-top">
			<span class="projectName">테스트</span>
			<button type="button" class="invite-button"> 
				<i class="bi bi-person-plus"></i>
				초대하기 
			</button>		
		</div>
		
		<div class="inner-middle">
			<div class="middle-left">
				<div class="stage-section">
					<div class="stage stage1">1</div>
					<div class="stage stage2">2</div>
					<div class="stage stage3">3</div>
					<div class="stage stage4">4</div>
					<div class="stage stage5">5</div>
				</div>
				
				<div class="step-section">
					<div class="step step1">1</div>
					<div class="step step2">2</div>
					<div class="step step3">3</div>
					<div class="step step4">4</div>
				</div>
			</div>
			
			<div class="middle-right">
			
				<div class="member-section">
					<div class="member-title">
						<span class="">참여자</span>
						<span class="member-count">6</span>
					</div>
					<div class="member-container">
						<div class="pm-list">
							<span class="member-title">프로젝트 관리자</span>
							<span class="number-of-member">2</span>
						</div>
						<div class="pm-info">
							<strong class="pm-name">이자바</strong>
							<em class="pm-position">팀장</em>
						</div>
						
						<div class="member-list">
							<span class="member-title">프로젝트 멤버</span>
							<span class="number-of-member">3</span>
						</div>
						<div class="member-info">
							<strong class="member-name">김노션</strong>
							<em class="member-position">사원</em>
						</div>
						
					</div>
				</div>
				
			</div>
				
		</div>   	
		
			
		   	
	
	</div>

</main>
		    	



<script type="text/javascript">


</script>

</body>
</html>