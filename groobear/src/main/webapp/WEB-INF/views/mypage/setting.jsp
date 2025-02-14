<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>

	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">

</head>

<style type="text/css">
.body-container {max-width: 800px;}
</style>

<script type="text/javascript">

</script>

<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/mypageHeader.jsp"/>
</header>	
	
<main>

	<div class="container mainInner">
		<div>
			<a href="${pageContext.request.contextPath}/mypage/empSetting">개인정보 수정</a>
			<a href="${pageContext.request.contextPath}/mypage/alramSetting">알람설정 변경</a>
			<a href="${pageContext.request.contextPath}/mypage/pwdSetting">비밀번호 변경</a>
		</div>
	</div>

</main>	

<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

	<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
	
</body>
</html>