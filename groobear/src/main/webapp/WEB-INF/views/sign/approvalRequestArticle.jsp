<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/signMenu.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/sign/approvalRequest.css" type="text/css">
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
			<jsp:include page="/WEB-INF/views/sign/approvalLine/approvalLineTable.jsp"/>
			<div class="writeForm">
				<h2>결재 요청서</h2>
				<input type="hidden" value="결재 요청서" name="docType">
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
					<table class="approvalRequest">
						<tr>
							<th class="title">제목</th>
							<td><input type="text" name="title">${approvalReq.title}</td>
						</tr>
						<tr class="content">
							<th>내용</th>
							<td><textarea name="content">${approvalReq.content}</textarea></td>
						</tr>
						<tr class="remarks">
							<th>비고</th>
							<td><textarea name="remarks">${approvalReq.remarks}</textarea></td>
						</tr>
					</table>
				</div>
			</div>
			<p class="msg">
				상기와 같이 결재 요청하오니 검토 후 승인하여 주시기 바랍니다<br>
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