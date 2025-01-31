<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/mailMenu.css" type="text/css">	
	<style type="text/css">
		main {width: 83%;}
		main .mainInner {width: 78vw}
		
		main .mainInner li img {width: 50%;}
		main .mainInner ul li:nth-child(4) a:hover {text-decoration: underline;}
		
		main .mainInner ul li:nth-child(1) {width: 3%;} /* checkBox */
		main .mainInner ul li:nth-child(2) {width: 3%;} /* star */
		main .mainInner ul li:nth-child(3) {width: 3%;} /* 읽음/안읽음 */
		main .mainInner ul li:nth-child(4) {width: 76%; justify-content: flex-start; padding-left: 2%; box-sizing: border-box;} /* 제목 */
		main .mainInner ul li:nth-child(5) {width: 15%;} /* 날짜 */
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/iconHeader.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/mailHeader.jsp"/>
	
	<main>
		<div class="mainInner">
			<ul>
				<li><input type="checkbox"></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
			<ul>
				<li><input type="checkbox"></li>
				<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/star.png"></li>
				<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/open-email.png"></li>
				<li><a href="${pageContext.request.contextPath}/">[공지] 설 연휴간 근무 안내</a></li>
				<li>2025-01-23 08:00</li>
			</ul>
		</div>
	</main>

</body>
</html>