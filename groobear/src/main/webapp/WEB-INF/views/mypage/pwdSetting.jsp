<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>

	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">

<style type="text/css">
.body-container { max-width: 800px;}

.btn-color {
	background-color: #365F8A;
	color: #fff;
	align-content: center;
}

.btn-color:hover, .btn-color:active, .btn-color:focus {
	background-color: #7A9ACD;
	border: 1px solid #7A9ACD;
	color: #fff;
}

.btn-colors {
	background-color: #B03A2E;
	color: #fff;
	align-content: center;
}

.btn-colors:hover, .btn-colors:active, .btn-colors:focus {
	background-color: #E26A6A;
	border: 1px solid #E26A6A;
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
	<div class="mainInner" style="margin-left: 100px; margin-top: 20px; ">
		<div class="body-container">
			
			<div class="row justify-content-md-center">
				<div class="col-md-6 pt-5"> 
					<div class="border mt-5 p-3">
						<form name="pwdForm" method="post" class="row g-3">
							<h3 class="text-center fw-bold">비밀번호 변경</h3>
							
							<div class="d-grid">
								<input type="password" name="empPwd" class="form-control form-control-lg" 
										placeholder="변경 비밀번호">
							</div>
							<div class="d-grid">
								<input type="password" name="empPwd2" class="form-control form-control-lg" 
										placeholder="변경 비밀번호 확인">
							</div>
							<div align="center">
								<button type="button" class="btn btn-color" onclick="sendOk();">
									변경완료 <i class="bi bi-check2"></i></button>
								<button type="button" class="btn btn-colors" 
									onclick="location.href='${pageContext.request.contextPath}/mypage/setting';">
									변경취소 <i class="bi bi-x"></i></button>
							</div>													
						</form>
					</div>
					
					<div class="d-grid">
						<p class="form-control-plaintext text-center py-3">${message}</p>
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
	if(! str) {
		alert('비밀번호를 입력하세요.');
		f.empPwd.focus();
		return;
	}
	
	if(f.empPwd.value !== f.empPwd2.value) {
		alert('비밀번호가 일치하지 않습니다.');
		f.empPwd.focus();
		return;
	}
	
	f.action = '${pageContext.request.contextPath}/mypage/pwdSetting';
	f.submit();
}

</script>

<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

	<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>

</body>
</html>