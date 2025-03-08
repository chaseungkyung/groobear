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
	<script type="text/javascript">
		function submit() {
			const form = document.requestForm;
			
			let str;
			
			str = form.workDeatil.value.trim();
			if(!str || str === '<p><br></p>') {
				alert('결재 내용을 입력하세요');
				form.leaveReason.focus();
				return false;
			}
			
			form.action="${pageContext.request.contextPath}/sign/approvalRequest"
			
			return true;
		}
	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/signHeader.jsp"/>
	
	<main>
		<div class="mainInner">
			<form name="requestForm" method="post">
				<jsp:include page="/WEB-INF/views/sign/approvalLine/approvalLineTable.jsp"/>
				<div class="writeForm">
					<h2>결재 요청서</h2>
					<input type="hidden" value="결재 요청서" name="docType">
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
						<table class="approvalRequest">
							<tr>
								<th class="title">제목</th>
								<td><input type="text" name="title"></td>
							</tr>
							<tr class="content">
								<th>내용</th>
								<td><textarea name="content"></textarea></td>
							</tr>
							<tr class="remarks">
								<th>비고</th>
								<td><textarea name="remarks"></textarea></td>
							</tr>
						</table>
					</div>
				</div>
			</form>
			<p class="msg">
				상기와 같이 결재 요청하오니 검토 후 승인하여 주시기 바랍니다.<br>
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