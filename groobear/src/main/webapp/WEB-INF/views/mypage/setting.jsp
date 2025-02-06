<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">

	<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/a81368914c.js"></script>
	
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/mypageHeader.jsp"/>
	
	<div class="container">
		<div class="login-content"> 
			<form name="loginForm" action="" method="post">
				<h2 class="title">비밀번호 확인</h2>		
				<div class="input-div pass">
					<div class="i">
						<i class="fas fa-lock"></i>
					</div>
					<div class="div">
						<h5>비밀번호</h5>
						<input type="password" class="input" name="empPwd" autocomplete="off">
					</div>
				</div>
				<input type="button" class="btn" value="확인" onclick="sendLogin();">
			</form>
			<p class="message">${message}</p>
		</div>		
	</div>
	
	<script type="text/javascript">
		function sendLogin() {
			const f = document.loginForm;
			let str;
			
			str = f.empPwd.value.trim();
			if(! str) {
				f.empPwd.focus();
				return;
			}
			
			f.action = '${pageContext.request.contextPath}/pwd';
			f.submit();
		}
		
		const inputs = document.querySelectorAll(".input");
		
		function addcl() {
			let parent = this.parentNode.parentNode;
			parent.classList.add("focus");
		}
		
		function remcl(){
			  let parent = this.parentNode.parentNode;
			  if(this.value == ""){
			    parent.classList.remove("focus");
			 }
		}
		
		inputs.forEach(input => {
			 input.addEventListener("focus", addcl);
			 input.addEventListener("blur", remcl);
		});
	</script>
</body>
</html>