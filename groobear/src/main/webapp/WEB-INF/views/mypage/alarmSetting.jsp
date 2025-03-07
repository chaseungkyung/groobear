<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>

	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">

</head> 
<body>
<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/mypageHeader.jsp"/>
</header>

<main>
	
	<div class="mainInner">	
		<div class="body-container">
			<div class="body-title">
				<h2><i class="bi bi-bell"></i>알람 설정 변경</h2>
			</div>
				
			<div class="body-main" style="padding-top: 20px;">
				<div class="form-check form-switch">
					<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault" checked>
					<label class="form-check-label" for="flexSwitchCheckDefault">&nbsp;결재</label>
				</div>
				<div class="form-check form-switch">
					<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault" checked>
					<label class="form-check-label" for="flexSwitchCheckChecked">&nbsp;새글</label>
				</div>
				<div class="form-check form-switch">
					<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault" checked>
					<label class="form-check-label" for="flexSwitchCheckDisabled">&nbsp;부서</label>
				</div>
				<div class="form-check form-switch">
					<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault" checked>
					<label class="form-check-label" for="flexSwitchCheckDisabled">&nbsp;팀</label>
				</div>	
				<div class="form-check form-switch">
					<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault" checked>
					<label class="form-check-label" for="flexSwitchCheckDisabled">&nbsp;프로젝트</label>
				</div>
				<div class="form-check form-switch">
					<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault" checked>
					<label class="form-check-label" for="flexSwitchCheckDisabled">&nbsp;일정</label>
				</div>			
			</div>
		</div>
	</div>
	
</main>

</body>
<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>
	<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
	
</html>