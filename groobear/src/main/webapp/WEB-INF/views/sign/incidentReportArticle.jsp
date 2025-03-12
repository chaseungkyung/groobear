<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/signMenu.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/sign/incidentReport.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/sign/approvalline/approvalLineTable.css" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/dist/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/dist/js/sign/approvalLine.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/signHeader.jsp"/>
	
	<main>
		<div class="mainInner">
			<input type="hidden" id="aprIdx" name="aprIdx" value="${approvalLine.aprIdx}" />
			<input type="hidden" id="paymentStage" name="paymentStage" value="${docApproval.paymentStage}" />
			<input type="hidden" id="status" name="status" value="${docApproval.status}" />
			<jsp:include page="/WEB-INF/views/sign/approvalLine/approveButton.jsp"/>
			<div class="writeForm">
				<h2>시말서</h2>
				<input type="hidden" value="시말서" name="docType">
				<div class="aa">
					<table class="my">
						<tr>
							<th>부서</th>
							<td>${docApproval.deptName}</td>
							<th>소속</th>
							<td>${docApproval.teamName}</td>
						</tr>
						<tr>
							<th>직급</th>
							<td>${docApproval.positionName}</td>
							<th>성명</th>
							<td>${docApproval.empName}</td>
						</tr>
					</table>
					<table class="incidentReport">
						<tr>
							<th>위반내용</th>
						</tr>
						<tr class="incDetail">
							<td><textarea name="incDetail" readonly>${incidentReport.content}</textarea></td>
						</tr>
					</table>
				</div>
			</div>
			<p class="msg">
				상기자는 위와 같이 시말서를 제출합니다.
			</p>
			<div class="signature">
				<p>${docApproval.regDate}</p>
				<p>신청자 : ${docApproval.empName}</p>
			</div>
			<p class="company">GROOBEAR 대표이사 귀중</p>
		</div>
	</main>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/dist/js/sign/approveButton.js"></script>
</html>