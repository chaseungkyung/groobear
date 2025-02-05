<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<style type="text/css">
		main {width: 93vw;}
		main .mainInner {width: 83vw;}
		.mainInner img {
		    width: 80vw;
		    height: 40vw; 
			}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	
	<main>
		<div class="mainInner">
			<img alt=""src="${pageContext.request.contextPath}/dist/images/common/map.png">
		</div>
		<div class = "organiztionMap">
		</div>
	</main>

</body>
</html>