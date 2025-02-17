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

</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<jsp:include page="/WEB-INF/views/layout/mypageHeader.jsp" />

	<main>
	<h3>근태 내역</h3>
		<div class="mainInner">
			<div class="">
				<button type="button" class="" onclick="${pageContext.request.contextPath}/mypage/workList" style="background-color: #2f5ea2; color: white;">근무 현황</button>
				<button type="button" class="" onclick="" style="background-color: #2f5ea2; color: white;">근태 내역</button>
				<button type="button" class="" onclick="${pageContext.request.contextPath}/mypage/payoff" style="background-color: #2f5ea2; color: white;">휴가 내역</button>
			</div>
			<form action="">
				<div class="tkListArea">
					<ul>
						<li>이름</li>
						<li>부서</li>
						<li>팀</li>
						<li>직급</li>
						<li>추가근무일자</li>
						<li>추가시간</li>
						<li>사유</li>
						<li hidden>승인상태</li>
					</ul>
					<c:forEach var="vo" items="${list}">
					<ul>
						<li>${vo.empName}</li>
						<li>${vo.deptName}</li>
						<li>${vo.teamName}</li>
						<li>${vo.positionCode}</li>
						<li>${vo.overDate}</li>
						<li>${vo.overTime}</li>
						<li>${vo.workDetail}</li>
						<li hidden>${vo.status}</li>						
					</ul>
					</c:forEach>
				</div>
			</form>
		</div>
	</main>

</body>
</html>