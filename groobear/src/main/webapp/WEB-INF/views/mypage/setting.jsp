<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>

	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/dist/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
.btn-padding {
	 margin-right: 10px;
}

.nav-tabs .nav-link {
    color: #495057; /* 기본 글자 색상 */
    background-color: #f8f9fa; /* 기본 배경색 */
    border: 1px solid #dee2e6; /* 테두리 색 */
}

.nav-tabs .nav-link.active {
    color: #222; /* 활성화된 탭 글자 색 */
    background-color: lightgray; /* 활성화된 탭 배경색 (파란색) */
    border-color: lightgray; /* 활성화된 테두리 */
}

.mine {
	width: 1000px;
	align: center;
	margin: 0 auto; 
	padding: 20px;"
}
</style>
</head>

<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/mypageHeader.jsp"/>
</header>	
	
<main>

	<div class="body-container mine">	
		<ul class="nav nav-tabs">
	    	<li class="nav-item">
	        	<a class="nav-link active" href="${pageContext.request.contextPath}/mypage/pwd?mode=update"> 개인정보수정 </a>
	    	</li>
		    <li class="nav-item">
		        <a class="nav-link" href="${pageContext.request.contextPath}/mypage/alarmSetting"> 알람설정변경 </a>
		    </li>
		    <li class="nav-item">
		        <a class="nav-link" href="${pageContext.request.contextPath}/mypage/pwd?mode=pwd"> 비밀번호변경 </a>
		    </li>
		</ul>
	</div>

</main>	

<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>
	
	<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
	
</body>
</html>