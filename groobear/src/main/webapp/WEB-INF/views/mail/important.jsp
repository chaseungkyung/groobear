<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/mailMenu.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/mail/mail.css" type="text/css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/mailHeader.jsp"/>
	
	<main>
		<div class="mainInner">
			<p class="title">즐겨찾기</p>
			<form action="">
				<ul>
					<li><input type="checkbox"></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/full-star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/open-email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[공지] 설 연휴간 근무 안내</a></li>
					<li>2025-01-23 08:00</li>
				</ul>
			</form>
		</div>
	</main>

</body>
</html>