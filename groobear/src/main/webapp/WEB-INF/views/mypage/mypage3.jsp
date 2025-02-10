<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/layout/headerResources.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/menu/listmenu.css"
	type="text/css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<jsp:include page="/WEB-INF/views/layout/mypageHeader.jsp" />

	<main>
	<h3>휴가내역</h3>
		<div class="mainInner">
			<div>
				<button type="button" class="" onclick="" style="background-color: #2f5ea2; color: white;">근무 현황</button>
				<button type="button" class="" onclick="" style="background-color: #2f5ea2; color: white;">근태 내역</button>
				<button type="button" class="" onclick="" style="background-color: #2f5ea2; color: white;">휴가 내역</button>
			</div>
			<form action="">
				<div class="listArea">
					<ul>
						<li>이름</li>
						<li>부서</li>
						<li>팀</li>
						<li>직급</li>
						<li>입사년월일</li>
						<li>전화번호</li>
						<li>이메일</li>
						<li>내선번호</li>
					</ul>
					<c:forEach var="vo" items="${list}">
						<ul>
							<li><input type="checkbox" name="" id=""></li>
							<li>${vo.empName}</li>
							<li>${vo.deptIdx}</li>
							<li>${vo.teamIdx}</li>
							<li>${vo.empRank}</li>
							<li>${vo.hireDate}</li>
							<li>${vo.tel}</li>
							<li>${vo.email}</li>
							<li>${vo.empTel}</li>
						</ul>
					</c:forEach>
				</div>
			</form>
		</div>
	</main>

</body>
</html>