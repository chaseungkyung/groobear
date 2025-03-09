<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/mail/mail.css" type="text/css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/mailHeader.jsp"/>
	
	<main>
		<div class="mainInner">
			<p class="title">휴지통</p>
			<form action="">
				<ul>
					<li><input type="checkbox"></li>
					<li>중요</li>
					<li>읽음</li>
					<li>제목</li>
					<li>날짜</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[광고] 화끈한 놀이터 대기중 &#60;삼식이네 놀이터&#62; </a></li>
					<li>2025-01-30 08:00</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/open-email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[광고] 화끈한 놀이터 대기중 &#60;삼식이네 놀이터&#62; </a></li>
					<li>2025-01-23 08:00</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/open-email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[광고] 화끈한 놀이터 대기중 &#60;삼식이네 놀이터&#62; </a></li>
					<li>2025-01-23 08:00</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/open-email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[광고] 화끈한 놀이터 대기중 &#60;삼식이네 놀이터&#62; </a></li>
					<li>2025-01-23 08:00</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/open-email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[광고] 화끈한 놀이터 대기중 &#60;삼식이네 놀이터&#62; </a></li>
					<li>2025-01-23 08:00</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/open-email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[광고] 화끈한 놀이터 대기중 &#60;삼식이네 놀이터&#62; </a></li>
					<li>2025-01-23 08:00</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/open-email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[광고] 화끈한 놀이터 대기중 &#60;삼식이네 놀이터&#62; </a></li>
					<li>2025-01-23 08:00</li>
				</ul>
			</form>
		</div>
	</main>

</body>
</html>