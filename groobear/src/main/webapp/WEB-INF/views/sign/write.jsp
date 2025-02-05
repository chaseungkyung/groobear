<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/signMenu.css" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/dist/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>
	<style type="text/css">
		
		.writeForm h2 {width: 100%; text-align: center; font-weight: bold; font-size: 25px; background-color: #f0f0f0; padding: 20px 0; box-sizing: border-box;}
		
		table {width: 100%; text-align: center;}
		table th, table td {border: 1px solid #333;}
		table tr {height: 40px; line-height: 40px;}
		
		.my th, .my td {width: 25%;}
		
		.title {background-color: #f0f0f0; padding: 10px 0; box-sizing: border-box; font-size: 15px; font-weight: bold;}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/signHeader.jsp"/>
	
	<main>
		<div class="mainInner">
			<div class="writeForm">
				<h2>휴가 신청서</h2>
				<form>
					<div class="aa">
						<table class="my">
							<tr>
								<th>부서</th>
								<td></td>
								<th>소속</th>
								<td></td>
							</tr>
							<tr>
								<th>직급</th>
								<td></td>
								<th>성명</th>
								<td></td>
							</tr>
						</table>
						<table class="">
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
								</td>
							</tr>
							<tr>
								<th>휴가 사유</th>
								<td><textarea></textarea></td>
							</tr>
							<tr>
								<th>비고</th>
								<td><textarea></textarea></td>
							</tr>
						</table>
					</div>
				</form>
				<p class="footer">
			        상기와 같이 휴가를 신청하오니 검토 후 승인하여 주시기 바랍니다.<br>
			        ※ 첨부 : 휴가 증빙 제출 서류 1부
			    </p>
			    <div class="signature">
			        <table>
			            <tr>
			                <td>20 년 월 일</td>
			                <td>신청자 : (인)</td>
			            </tr>
			        </table>
			    </div>
			    <p class="company">GROOBEAR 대표이사 귀중</p>
		    </div>
		</div>
	</main>

</body>
</html>