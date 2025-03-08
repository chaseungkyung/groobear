<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/signMenu.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/sign/leaveRequest.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/sign/approvalline/approvalLineTable.css" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/dist/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>
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
					<h2>휴가 신청서</h2>
					<input type="hidden" value="휴가 신청서" name="docType">
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
						<table class="leaveRequest">
							<tr>
								<td colspan="2" class="title">신청내역</td>
							</tr>
							<tr>
								<th>휴가 구분</th>
								<td>
									<label for="vacationLeave"><input type="radio" name="leaveType" id="vacationLeave" ${leaveRequest.leaveType == "0" ? "checked" : ""} disabled>연차</label>
									<label for="morningLeave"><input type="radio" name="leaveType" id="morningLeave" ${leaveRequest.leaveType == "1" ? "checked" : ""} disabled>오전 반차</label>
									<label for="afternoonLeave"><input type="radio" name="leaveType" id="afternoonLeave" ${leaveRequest.leaveType == "2" ? "checked" : ""} disabled>오후 반차</label>
									<label for="bereavementLeave"><input type="radio" name="leaveType" id="bereavementLeave" ${leaveRequest.leaveType == "3" ? "checked" : ""} disabled>경조</label>
									<label for="officialLeave"><input type="radio" name="leaveType" id="officialLeave" ${leaveRequest.leaveType == "4" ? "checked" : ""} disabled>공가</label>
									<label for="sickLeave"><input type="radio" name="leaveType" id="sickLeave" ${leaveRequest.leaveType == "5" ? "checked" : ""} disabled>병가</label>
									<label for="otherLeave"><input type="radio" name="leaveType" id="otherLeave" ${leaveRequest.leaveType == "6" ? "checked" : ""} disabled>기타(<input type="text" disabled>)</label>
								</td>
							</tr>
							<tr class="holiday">
								<th>휴가 기간</th>
								<td>
									<input type="date" name="startDate" id="startDate" value="${leaveRequest.startDate}" readonly> ~ <input type="date" name="endDate" id="endDate" value="${leaveRequest.endDate}" readonly>
									( <input type="text" class="date" name="leaveDays" readonly style="border: none; width: 2%; text-align: right" value="${leaveRequest.leaveDays}"> 일간 )
								</td>
							</tr>
							<tr class="leaveReason">
								<th>휴가 사유</th>
								<td><textarea name="leaveReason" readonly>${leaveRequest.leaveReason}</textarea></td>
							</tr>
							<tr class="remarks">
								<th>비고</th>
								<td><textarea name="remark" readonly>${leaveRequest.remarks}</textarea></td>
							</tr>
						</table>
					</div>
				</div>
			<p class="msg">
				상기와 같이 휴가를 신청하오니 검토 후 승인하여 주시기 바랍니다.<br>
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