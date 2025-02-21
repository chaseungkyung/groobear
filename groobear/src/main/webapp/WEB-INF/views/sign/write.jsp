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
	<script type="text/javascript">
		window.addEventListener('load', function(){
			
			const list = function(data) {
				
				if(data){
					
					if(data.state === 'false') {
						return false;
					}
					
					let html = "";
				
					if(data.memberList) {
						
							html += "<tbody>"
						for(item of data.memberList) {
							html +=   "<tr>"
							html +=      "<td>" + item.deptName + "</td>";
							html +=      "<td>" + item.teamName + "</td>";
							html +=      "<td>" + item.empName + "</td>";
							html +=      "<td>" + item.positionName + "</td>";
							html +=      "<td>"
							html +=        "<input type='hidden' value='" + item.deptIdx + "'>";
							html +=        "<input type='hidden' value='" + item.teamIdx + "'>";
							html +=        "<input type='hidden' value='" + item.positionCode + "'>";
							html +=        "<input type='button' value='선택' type='button' class='choose'>"
							html +=      "</td>";
							html +=   "</tr>";
						}
							html += "</tbody>";
						
						$(".listTable table").append(html);
					}
				
				}
			};
			
			ajaxRequest('/sign/listEmp', 'get', null, 'json', list);
			
			const fn = function(data) {
				
				if(data.state === 'false') {
					return false;
				}
				
				// dept 
				if(data){
					
					if(data.dept){
						let html = "";
						for(item of data.dept){
							html += "<option value="+ item.deptIdx +">" + item.deptName +"</option>";
						}
						$("#deptIdx").append(html);
					}
					
					if(data.position){
						let html = "";
						for(item of data.position){
							html += "<option value="+ item.positionCode +">" + item.positionName +"</option>";
						}
						$("#positionCode").append(html);
					}
				}
			};
			
			ajaxRequest('/sign/getDeptAndPosition', 'get', null, 'json', fn);
			
			// Dept Change Event / request Team
			$("#deptIdx").on("change", function() {
				
				let selectDept = $(this).val();
				
				const team = function(data){
					
					if(data.state === 'false') {
						return false;
					}
					if(data && data.team){
						let html = "<option value='' selected disabled>소속</option>";
						
						for(item of data.team){
							html += "<option value="+ item.teamIdx +">" + item.teamName +"</option>";
						}
						
						$("#teamIdx").html(html);
						
					}
				};
				
				ajaxRequest('/sign/getTeam', 'get', {deptIdx : selectDept}, 'json', team);
				
				const getDeptEmployees = function(data) {
					
					let html = "";
					
					if(data && data.employees) {
						
						for(item of data.employees) {
							html += "<tr>"
							html +=    "<td>" + item.deptName + "</td>";
							html +=    "<td>" + item.teamName + "</td>";
							html +=    "<td>" + item.empName + "</td>";
							html +=    "<td>" + item.positionName + "</td>";
							html +=    "<td>"
							html +=      "<input type='hidden' value='" + item.deptIdx + "'>";
							html +=      "<input type='hidden' value='" + item.teamIdx + "'>";
							html +=      "<input type='hidden' value='" + item.positionCode + "'>";
							html +=      "<input type='button' value='선택'  type='button' class='choose'>"
							html +=    "</td>";
							html += "</tr>";
						}
						
						$(".listTable table tbody").html(html);
						
					} else {
						$(".listTable table tbody").html("<tr><td colspan='5'>해당 부서의 사원이 없습니다.</td></tr>")
					}
				};
				
				ajaxRequest('/sign/getEmployees', 'get', {deptIdx : selectDept}, 'json', getDeptEmployees);
			});
			
			
			$("#teamIdx").on("change", function() {
				
				let selectDept = $("#deptIdx").val();
				let selectTeam = $(this).val();
				
				const getTeamEmployees = function(data) {
					
					let html = '';
					
					if(data && data.employees) {
						
						for(item of data.employees) {
							html += "<tr>"
							html +=    "<td>" + item.deptName + "</td>";
							html +=    "<td>" + item.teamName + "</td>";
							html +=    "<td>" + item.empName + "</td>";
							html +=    "<td>" + item.positionName + "</td>";
							html +=    "<td>"
							html +=      "<input type='hidden' value='" + item.deptIdx + "'>";
							html +=      "<input type='hidden' value='" + item.teamIdx + "'>";
							html +=      "<input type='hidden' value='" + item.positionCode + "'>";
							html +=      "<input type='button' value='선택'  type='button' class='choose'>"
							html +=    "</td>";
							html += "</tr>";
						}
						
						$(".listTable table tbody").html(html);
						
					} else {
						$(".listTable table tbody").html("<tr><td colspan='5'>해당 팀의 사원이 없습니다.</td></tr>")
					}
					
				};
				
				ajaxRequest('/sign/getEmployees', 'get', {deptIdx : selectDept, teamIdx : selectTeam}, 'json', getTeamEmployees);
				
			});
			
			$("#positionCode").on("change", function() {
				
				let selectDept = $("#deptIdx").val();
				let selectTeam = $("#teamIdx").val();
				let selectPositionCode = $(this).val();
				
				const getTeamEmployees = function(data) {
					
					let html = '';
					
					if(data && data.employees) {
						
						for(item of data.employees) {
							html += "<tr>"
							html +=    "<td>" + item.deptName + "</td>";
							html +=    "<td>" + item.teamName + "</td>";
							html +=    "<td>" + item.empName + "</td>";
							html +=    "<td>" + item.positionName + "</td>";
							html +=    "<td>"
							html +=      "<input type='hidden' value='" + item.deptIdx + "'>";
							html +=      "<input type='hidden' value='" + item.teamIdx + "'>";
							html +=      "<input type='hidden' value='" + item.positionCode + "'>";
							html +=      "<input type='button' value='선택' type='button' class='choose'>"
							html +=    "</td>";
							html += "</tr>";
						}
						
						$(".listTable table tbody").empty();
						$(".listTable table tbody").html(html);
						
					} else {
						$(".listTable table tbody").html("<tr><td colspan='5'>해당 직급의 사원이 없습니다.</td></tr>")
					}
					
				};
				
				ajaxRequest('/sign/getEmployees', 'get', {deptIdx : selectDept, teamIdx : selectTeam, positionCode : selectPositionCode}, 'json', getTeamEmployees);
				
			});
			
			$(function(){
		        let today = new Date();

		        let year = today.getFullYear();
		        let month = String(today.getMonth() + 1).padStart(2, '0');
		        let date = String(today.getDate()).padStart(2, '0');
		        
		        let days = ["일", "월", "화", "수", "목", "금", "토"];
		        let day = days[today.getDay()];
		        
		        let hours = String(today.getHours()).padStart(2, '0');
		        let minutes = String(today.getMinutes()).padStart(2, '0');
		        let seconds = String(today.getSeconds()).padStart(2, '0');
		        
		        let sign = year + "/" + month + "/" + date + " " + "(" + day + ")" + "<br>" + hours + ":" + minutes + ":" + seconds;
		        
		        $(".signDate td:nth-of-type(1)").html(sign);
			});

		});
		
		$(function(){
			$('.approvalCell').on('click', '.approvalAdd', function(){
				$('.backGround').fadeIn(300);
				$('.lineSelectPopUp').fadeIn(300);
				document.body.style.overflow = 'hidden';
				
				let $td = $(this).closest("td");
				let tdEq = $('.approvalCell').find('td').index($td);				
				$('.lineSelectPopUp').attr('data-eq', tdEq)
			});

			$('.listTable').on('click', '.choose', function(){
				let tdEq = $('.lineSelectPopUp').attr('data-eq');
		
				let row = $(this).closest("tr");
			    let deptIdx = row.find("input[type='hidden']").eq(0).val();
			    let teamIdx = row.find("input[type='hidden']").eq(1).val();
			    let positionCode = row.find("input[type='hidden']").eq(2).val();
			    
			    let deptName = row.find("td").eq(0).text();
			    let teamName = row.find("td").eq(1).text();
			    let positionName = row.find("td").eq(2).text();
			    
			    html = "";
			    html += "<input type='hidden' value='" + deptIdx + "' name='deptIdx'>";
			    html += "<input type='hidden' value='" + teamIdx + "' name='teamIdx'>";
			    html += "<input type='hidden' value='" + positionCode + "' name='positionCode'>";
			    
			    $(".approvalLine table tr:nth-of-type(1) th").eq(tdEq).html(html+ deptName + " " + teamName + " " + positionName);
			    
				$('.backGround').fadeOut(300);
				$('.lineSelectPopUp').fadeOut(300);
				document.body.style.overflow = 'hidden';
				
				$('.approvalCell .approvalAdd').hide();
				
				$('.approvalCell').find('td').eq(parseInt(tdEq) + 1).html("<button type='button' class='approvalAdd'>등록하기</button>");
			});
			
		});
		
	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/signHeader.jsp"/>
	
	<main>
		<div class="mainInner">
			<div class="btnArea">
				<button type="button" onclick="location.href='${pageContext.request.contextPath}/sign/list'" class="cancel">작성 취소</button>
				<button type="button" onclick="">상신하기</button>
			</div>
			<div class="approvalLine">
				<div class="getApprovalLine">
					<p>결재라인 불러오기</p>
				</div>
				<table>
					<tr>
						<th>${sessionScope.member.deptName} ${sessionScope.member.empName} ${sessionScope.member.positionName}</th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
					<tr class="approvalCell">
						<td>${sessionScope.member.empName}</td>
						<td>
							<button type="button" class="approvalAdd">등록하기</button>
						</td>
						<td></td>
						<td></td>
					</tr>
					<tr class="signDate">
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
				<table>
					<tr>
						<th>참조자</th>
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
	
	<!-- 결재 등록하기 버튼 눌렀을 때 나오는 팝업 -->
	<div class="backGround"></div>
	<div class="lineSelectPopUp">
		<div class="popUpInner">
			<div class="close">X</div>
			<div class="select">
				<select name="deptIdx" id="deptIdx">
					<option value="" readOnly>부서</option>
				</select>
				<select name="teamIdx" id="teamIdx">
					<option value="" readOnly>소속</option>
				</select>
				<select name="positionCode" id="positionCode">
					<option value="" readOnly>직급</option>
				</select>
				<button type="button" class="reset"><i class="bi bi-arrow-clockwise"></i></button>
			</div>
			<div class="listTable">
				<table>
					<thead>
						<tr>
							<th>부서</th>
							<th>팀</th>
							<th>이름</th>
							<th>직급</th>
							<th></th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		$('.close').on('click', function(){
			$('.backGround').fadeOut(300);
			$('.lineSelectPopUp').fadeOut(300);
			document.body.style.overflow = 'auto';
		});
		
		$('.backGround').on('click', function(){
			$('.backGround').fadeOut(300);
			$('.lineSelectPopUp').fadeOut(300);
			document.body.style.overflow = 'auto';
		});
	});
</script>
</html>