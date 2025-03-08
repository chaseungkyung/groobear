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
	<script type="text/javascript" src="${pageContext.request.contextPath}/dist/js/sign/approvalLine.js"></script>
	<script type="text/javascript">
		function submit() {
			const form = document.leaveForm;
			
			let str;
			
			str = form.leaveReason.value.trim();
			if(!str || str === '<p><br></p>') {
				alert('휴가 사유를 입력하세요');
				form.leaveReason.focus();
				return false;
			}
			
			form.action="${pageContext.request.contextPath}/sign/leaveRequest"
			
			return true;
		}
	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/signHeader.jsp"/>
	
	<main>
		<div class="mainInner">
			<form name="leaveForm" method="post">
				<jsp:include page="/WEB-INF/views/sign/approvalLine/approvalLineTable.jsp"/>
				<div class="writeForm">
					<h2>휴가 신청서</h2>
					<input type="hidden" value="휴가 신청서" name="docType">
					<div class="aa">
						<table class="my">
							<tr>
								<th>부서</th>
								<td>${sessionScope.member.deptName}</td>
								<th>소속</th>
								<td>${sessionScope.member.teamName}</td>
							</tr>
							<tr>
								<th>직급</th>
								<td>${sessionScope.member.positionName}</td>
								<th>성명</th>
								<td>${sessionScope.member.empName}</td>
							</tr>
						</table>
						<table class="leaveRequest">
							<tr>
								<td colspan="2" class="title">신청내역</td>
							</tr>
							<tr>
								<th>휴가 구분</th>
								<td>
									<label for="vacationLeave"><input type="radio" name="leaveType" id="vacationLeave" value="0">연차</label>
									<label for="morningLeave"><input type="radio" name="leaveType" id="morningLeave" value="1">오전 반차</label>
									<label for="afternoonLeave"><input type="radio" name="leaveType" id="afternoonLeave" value="2">오후 반차</label>
									<label for="bereavementLeave"><input type="radio" name="leaveType" id="bereavementLeave" value="3">경조</label>
									<label for="officialLeave"><input type="radio" name="leaveType" id="officialLeave" value="4">공가</label>
									<label for="sickLeave"><input type="radio" name="leaveType" id="sickLeave" value="5">병가</label>
									<label for="otherLeave"><input type="radio" name="leaveType" id="otherLeave" value="6">기타(<input type="text">)</label>
								</td>
							</tr>
							<tr class="holiday">
								<th>휴가 기간</th>
								<td>
									<input type="date" name="startDate" id="startDate"> ~ <input type="date" name="endDate" id="endDate">
									( <input type="text" class="date" name="leaveDays" readonly style="border: none; width: 2%; text-align: right"> 일간 )
								</td>
							</tr>
							<tr class="leaveReason">
								<th>휴가 사유</th>
								<td><textarea name="leaveReason"></textarea></td>
							</tr>
							<tr class="remarks">
								<th>비고</th>
								<td><textarea name="remark"></textarea></td>
							</tr>
						</table>
					</div>
				</div>
			</form>
			<p class="msg">
				상기와 같이 휴가를 신청하오니 검토 후 승인하여 주시기 바랍니다.<br>
			</p>
			<div class="signature">
				<p>20 년 월 일</p>
				<p>신청자 : (인)</p>
			</div>
			<p class="company">GROOBEAR 대표이사 귀중</p>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/sign/approvalLine/approvalPopup.jsp"/>
</body>
</html>