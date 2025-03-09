<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64, iVBORw0KGgo=">
<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">

<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/mailHeader.jsp"/>
	
	<main>
		<div class="mainInner">
			<div>
				<div class="imgArea" style="width: 10%; margin: 0 auto 10px auto;">
					<img alt=""src="${pageContext.request.contextPath}/dist/images/mail/send.png">
				</div>
				<div class="textArea" style="width: 100%; text-align: center;">
					<p>메일을 성공적으로 보냈습니다.</p>
				</div>
			</div>
			<div class = "btnArea">
				<button type="button"  class = "btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/mail/list';">확인</button>
				<button type="button"  class = "btn" onclick="location.href='${pageContext.request.contextPath}/mail/mailSend';">보낸 메일함</button>
			</div>
		</div>
	</main>
</body>
</html>