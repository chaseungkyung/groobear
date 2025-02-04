<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/login/login.css" type="text/css">
	
	<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/a81368914c.js"></script>
	
</head>
<body>

	<!-- <img class="wave" src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/wave.png"> -->
	<img class="wave" alt="" src="${pageContext.request.contextPath}/dist/images/login/wave.png">
	<div class="container">
		<div class="img">
			<img src="${pageContext.request.contextPath}/dist/images/login/bg.png">
			<!-- <img src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/bg.svg"> -->
		</div>
		<div class="login-content">
			<form>
				<img src="${pageContext.request.contextPath}/dist/images/login/groobear.png">
				<!-- <img src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/avatar.svg"> -->
				<h2 class="title">GrooBear</h2>
				<div class="input-div one">
					<div class="i">
						<i class="fas fa-user"></i>
					</div>
					<div class="div">
						<h5>사원번호</h5>
						<input type="text" class="input">
					</div>
				</div>
				<div class="input-div pass">
					<div class="i"> 
						<i class="fas fa-lock"></i>
					</div>
					<div class="div">
						<h5>비밀번호</h5>
						<input type="password" class="input">
					</div>
				</div>
				<input type="submit" class="btn" value="Login">
			</form>
		</div>
	</div>
	<script type="text/javascript">
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