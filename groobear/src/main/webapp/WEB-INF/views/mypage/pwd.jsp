<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>

	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">

<style type="text/css">
.body-container { max-width: 800px; }
</style>
</head>

<body>
<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/mypageHeader.jsp"/>
</header>	

<main>
	<div class="container">
		<div class="body-container">
			
			<div class="row justify-content-md-center">
				<div class="col-md-7 pt-5">
					<div class="border mt-5 p-4">
						<form name="pwdForm" method="post" class="row g-3">
							<h3 class="text-center fw-bold">비밀번호 재확인</h3>
							
							<div class="d-grid">
								<p class="form-control-plaintext text-center">정보보호를 위해 비밀번호를 입력해주세요.</p>
							</div>
							
							<div class="d-grid">
								<input type="text" name="empCode" class="form-control form-control-lg" 
										placeholder="사번" value="${sessionScope.member.empCode}" readonly>
							</div>
							<div class="d-grid">
								<input type="password" name="empPwd" class="form-control form-control-lg"
										autocomplete="off" placeholder="비밀번호">
							</div>
						    <div class="d-grid">
						    	<button type="button" class="btn btn-lg btn-primary" onclick="sendOk();">
						    		확인 <i class="bi bi-check2"></i></button>
								<input type="hidden" name="mode" value="${mode}">
							</div>
						</form>
					</div>
					
					<div class="d-gird">
						<p class="form-control-plaintext text-center">${message}</p>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</main>

<script type="text/javascript">
function sendOk() {
	const f = document.pwdForm;
	
	let str = f.empPwd.value.trim();
	if(!str) {
		alert('비밀번호를 입력하세요.');
		f.empPwd.focus();
		return;
	}
	
	f.action = '${pageContext.request.contextPath}/mypage/pwd';
	f.submit();
}
</script>

<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

	<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
	
</body>
</html>