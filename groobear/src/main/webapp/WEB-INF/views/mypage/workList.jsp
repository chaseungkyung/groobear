<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/layout/headerResources.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/mypage/list.css"
	type="text/css">
	
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
    const ulElement = document.getElementById("timeTable");

    for (let i = 0; i < 24; i++) {
        const li = document.createElement("li");
        
        li.style.width = "1cm";
        li.style.height = "1cm";
        li.style.display = "inline-block";  
        li.style.border = "1px solid #2f5ea2";
        
        ulElement.appendChild(li);
    }

    ulElement.style.listStyleType = "none";  
    ulElement.style.padding = "0"; 
    ulElement.style.display = "flex";  
    ulElement.style.flexWrap = "wrap"; 
});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<jsp:include page="/WEB-INF/views/layout/mypageHeader.jsp" />

	<main>
	<h3>근무 현황</h3>
		<div class="mainInner">
			<div>
				<button type="button" class="" onclick="" style="background-color: #2f5ea2; color: white;">근무 현황</button>
				<button type="button" class="" onclick="" style="background-color: #2f5ea2; color: white;">근태 내역</button>
				<button type="button" class="" onclick="" style="background-color: #2f5ea2; color: white;">휴가 내역</button>
			</div>
			<form action="">
				<div class="wlListArea">
					<ul>
						<li class="workTime">8h 12m</li>
					</ul>
					<ul id="timeTable"></ul>
					<c:forEach var="vo" items="${list}">
						<ul>
							<li></li>
						</ul>
					</c:forEach>
				</div>
			</form>
		</div>
	</main>
</body>


</html>