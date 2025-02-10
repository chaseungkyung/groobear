<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/layout/headerResources.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listmenu.css" type="text/css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<jsp:include page="/WEB-INF/views/layout/mypageHeader.jsp" />

	<main>
		<div class="mainInner">
			<div>
				<a href="${pageContext.request.contextPath}/mypage/mypage" style="border: 1px solid; padding: 4px; border-radius : 4px; background-color: white;">근무 현황</a>
				<a href="${pageContext.request.contextPath}/mypage/mypage2" style="border: 1px solid; padding: 4px; border-radius : 4px; background-color: white;">근태 내역</a>
				<a href="${pageContext.request.contextPath}/mypage/mypage3" style="border: 1px solid; padding: 4px; border-radius : 4px; background-color: white;">휴가 내역</a>
				
			</div>
			<form action="">
				<div class="listArea">

				</div>
			</form>
		</div>
	</main>

</body>
</html>