<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/signMenu.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/sign/signMain.css" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/dist/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/signHeader.jsp"/>
	
	<main>
		<div class="mainInner">
			<div class="quickMenu">
				<div class="menu">
					<a href=""></a>
					<i class="bi bi-file-text"></i>
					<p>문서1</p>
				</div>
				<div class="menu">
					<i class="bi bi-file-text"></i>
					<p>문서1</p>
				</div>
				<div class="menu">
					<i class="bi bi-file-text"></i>
					<p>문서1</p>
				</div>
				<div class="menu">
					<i class="bi bi-file-text"></i>
					<p>문서1</p>
				</div>
				<div class="menu">
					<i class="bi bi-file-text"></i>
					<p>문서1</p>
				</div>
			</div>
		</div>
	</main>

</body>
</html>