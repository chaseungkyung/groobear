<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>

	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">

</head>
<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/mypageHeader.jsp"/>
</header>	
	
<main>
	<div class="container">
		<div class="body-title">
			<h3><i class="bi bi-person-square"></i> ${mode=="설정변경"}</h3>
		
		</div>
			
		<div class="alert alert-info" role="alert">
			<i class="bi bi-person-check-fill">환경설정 변경</i>
		</div>
		
		<div class="body-main">
			
			<form name="memberForm" method="post">
				<div class="row mb-3">
					<label class="col-sm-2 col-form-lable" for="empCode">사번</label>
					<div class="row">
						<div class="col-sm-10 wrap-empCode">
							<div class="row">
								<div class="col-6 pe-1">
									<input type="text" name="empCode" id="empCode" class="form-control"
										value="${dto.empCode}" readonly placeholder="사번">
								</div>

								
								
							</div>
						</div>
					</div>
				
				</div>
			</form>
		</div>
		
	</div>
</main>	
	
<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

	<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
	
</body>
</html>