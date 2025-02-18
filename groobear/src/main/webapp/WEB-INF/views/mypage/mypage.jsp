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
				<a href="${pageContext.request.contextPath}/mypage/workList" >근무 현황</a>
				<a href="${pageContext.request.contextPath}/mypage/timeKeeping" >근태 내역</a>
				<a href="${pageContext.request.contextPath}/mypage/paidOffTime" >휴가 내역</a>
				<a href="${pageContext.request.contextPath}/emp/add" >나의 정보 수정</a>
		</div>
	</main>

</body>
</html>