<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/login/login.css" type="text/css">
	
	<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
	
</head>
<body>

	<img class="wave" alt="" src="${pageContext.request.contextPath}/dist/images/login/wave.png">
	<div class="container">
		<div class="img">
			<img src="${pageContext.request.contextPath}/dist/images/login/bg.png">
		</div>
		<div class="login-content">
			<form name="loginForm" action="" method="post">
				<img src="${pageContext.request.contextPath}/dist/images/login/groobear.png">
				<h2 class="title">GrooBear</h2>
				<div class="input-div one">
					<div class="i">
						<i class="bi bi-person-fill"></i>
					</div>
					<div class="div">
						<h5>사원번호</h5>
						<input type="text" class="input" name="empCode">
					</div>
				</div>
				<div class="input-div pass">
					<div class="i"> 
						<i class="bi bi-lock-fill"></i>
					</div>
					<div class="div">
						<h5>비밀번호</h5>
						<input type="password" class="input" name="empPwd" autocomplete="off">
					</div>
				</div>
				<input type="button" class="btn" value="로그인" onclick="sendLogin();">
			</form>
			<p class="message">${message}</p>
		</div>
	</div>
	<script type="text/javascript">
		function sendLogin() {
		    const f = document.loginForm;
			let str;
			
			str = f.empCode.value.trim();
		    if( !str ) {
		        f.empCode.focus();
		        return;
		    }
	
		    str = f.empPwd.value.trim();
		    if( !str ) {
		        f.empPwd.focus();
		        return;
		    }
	
		    f.action = '${pageContext.request.contextPath}/login';
		    f.submit();
		}
	
		const inputs = document.querySelectorAll(".input");
	
		function addcl(){
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