<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>환경설정 완료</title>

	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">

<style type="text/css">
.body-container { max-width: 1000px; }

.btn-color {
	background-color: #365F8A;
	color: #fff;
}

.btn-color:hover, .btn-color:active, .btn-color:focus {
	background-color: #7A9ACD;
	border: 1px solid #7A9ACD;
	color: #fff;
}

</style>
</head>

<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/mypageHeader.jsp"/>
</header>	

<main>
	<div  class="mainInner" style="margin-left: 250px; margin-top: 20px;">
		<div class="body-container">
			
			<div class="row justify-container-md-center mt-5">
				<div class="col-md-6 pt-5">
					<div class="border mt-5 p-3">
						<h4 class="text-center fw-bold">${title}</h4>
						<hr class="mt-4">
					
						<div class="d-grid p-4">
							<p class="text-center">${message}</p>
						</div>
						
						<div class="d-grid">
							<button type="button" class="btn btn-color" 
							onclick="location.href='${pageContext.request.contextPath}/main';">
								메인화면 <i class="bi bi-check2"></i>
							</button>
						</div>
						
					</div>
				</div>
			</div>
		
		</div>
	</div>
</main>

<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

	<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>

</body>
</html>