<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/signMenu.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/sign/leaveRequest.css" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/dist/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/signHeader.jsp"/>
	
	<main>
		<div class="mainInner">
			<div>
				<button>작성 취소</button>
				<button>상신하기</button>
			</div>
			<div class="approvalLine">
				<div class="getApprovalLine">
					<p>결재라인 불러오기</p>
				</div>
				<table>
					<tr>
						<th>본인</th>
						<th>대리</th>
						<th>팀장</th>
						<th>부장</th>
					</tr>
					<tr class="approvalCell">
						<td></td>
						<td>
							<button>결재하기</button>
						</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>${sessionScope.member.empName} ${sessionScope.member.positionCode}</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
			<div class="writeForm">
				<h2>휴가 신청서</h2>
				<form>
					<div class="aa">
						<table class="my">
							<tr>
								<th>부서</th>
								<td>${sessionScope.member.deptIdx}</td>
								<th>소속</th>
								<td>${sessionScope.member.teamIdx}</td>
							</tr>
							<tr>
								<th>직급</th>
								<td>${sessionScope.member.positionCode}</td>
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
									<label for="vacationLeave"><input type="radio" name="leave" id="vacationLeave">연차</label>
									<label for="morningLeave"><input type="radio" name="leave" id="morningLeave">오전 반차</label>
									<label for="afternoonLeave"><input type="radio" name="leave" id="afternoonLeave">오후 반차</label>
									<label for="bereavementLeave"><input type="radio" name="leave" id="bereavementLeave">경조</label>
									<label for="officialLeave"><input type="radio" name="leave" id="officialLeave">공가</label>
									<label for="sickLeave"><input type="radio" name="leave" id="sickLeave">병가</label>
									<label for="otherLeave"><input type="radio" name="leave" id="otherLeave">기타(<input type="text">)</label>
								</td>
							</tr>
							<tr>
								<th>휴가 기간</th>
								<td>
									<input type="date"> ~ <input type="date">
									( 일간)
								</td>
							</tr>
							<tr class="leaveReason">
								<th>휴가 사유</th>
								<td><textarea></textarea></td>
							</tr>
							<tr class="remarks">
								<th>비고</th>
								<td><textarea></textarea></td>
							</tr>
						</table>
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
		</div>
	</main>

</body>
</html>