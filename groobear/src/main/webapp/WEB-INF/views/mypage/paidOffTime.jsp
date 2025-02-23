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
		<div class="mainInner">
			<div class="button-group">
		        <a href="${pageContext.request.contextPath}/mypage/workList" class="custom-button">근무 현황</a>
		        <a href="${pageContext.request.contextPath}/mypage/timeKeeping" class="custom-button">근태 내역</a>
		        <a href="${pageContext.request.contextPath}/mypage/paidOffTime" class="custom-button select-button">휴가 내역</a>
		       </div>
			<form action="">
				<div class="ptoListArea">
					<ul>
						<li>기간</li>
						<li>일수</li>
						<li>이름</li>
						<li>부서</li>
						<li>팀</li>
						<li>직급</li>
						<li>종류</li>
						<li>비고</li>
						<li hidden>승인상태</li>
					</ul>
					<c:forEach var="vo" items="${list}">
					<ul>
						<li>${vo.startDate} ~ ${vo.endDate}</li>
						<li>${vo.leaveDays}</li>
						<li>${vo.empName}</li>
						<li>${vo.deptIdx}</li>
						<li>${vo.teamIdx}</li>
						<li>${vo.positionCode}</li>
						<li>${vo.leaveReason}</li>
						<li>${vo.remarks}</li>
						<li hidden>${vo.status}</li>						
					</ul>
					</c:forEach>
				</div>
			</form>
		</div>
	</main>

</body>
</html>