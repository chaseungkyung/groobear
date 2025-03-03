window.addEventListener('load', function(){
	
	// 모달 창 띄울 때 전체 list
	const list = function(data) {
		
		if(data){
			
			if(data.state === 'false') {
				return false;
			}
			
			let html = "";
		
			if(data.memberList) {
				
				html += "<tbody>"
				
				for(item of data.memberList) {
					html += "<tr>"
					html +=    "<td>" + item.deptName + "</td>";
					html +=    "<td>" + item.teamName + "</td>";
					html +=    "<td>" + item.empName + "</td>";
					html +=    "<td>" + item.positionName + "</td>";
					html +=    "<td>"
					html +=      "<input type='hidden' value='" + item.empIdx + "'>";
					html +=      "<input type='hidden' value='" + item.deptIdx + "'>";
					html +=      "<input type='hidden' value='" + item.teamIdx + "'>";
					html +=      "<input type='hidden' value='" + item.empName + "'>";
					html +=      "<input type='hidden' value='" + item.empCode + "'>";
					html +=      "<input type='hidden' value='" + item.positionCode + "'>";
					html +=      "<input type='button' value='선택' type='button' class='choose'>"
					html +=    "</td>";
					html += "</tr>";
				}
				
				html += "</tbody>";
				
				$(".listTable table").append(html);
			}
		
		}
	};
	
	ajaxRequest('/sign/listEmp', 'get', null, 'json', list);
	
	
	// 모달창 안 select box 변경
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
					html +=      "<input type='hidden' value='" + item.empIdx + "'>";
					html +=      "<input type='hidden' value='" + item.deptIdx + "'>";
					html +=      "<input type='hidden' value='" + item.teamIdx + "'>";
					html +=      "<input type='hidden' value='" + item.empName + "'>";
					html +=      "<input type='hidden' value='" + item.empCode + "'>";
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
	
	
	// select box 'teamIdx' 가 변경 될 때
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
					html +=      "<input type='hidden' value='" + item.empIdx + "'>";
					html +=      "<input type='hidden' value='" + item.deptIdx + "'>";
					html +=      "<input type='hidden' value='" + item.teamIdx + "'>";
					html +=      "<input type='hidden' value='" + item.empName + "'>";
					html +=      "<input type='hidden' value='" + item.empCode + "'>";
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
	
	// select box 'positionCode' 가 변경될 때
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
					html +=      "<input type='hidden' value='" + item.empIdx + "'>";
					html +=      "<input type='hidden' value='" + item.deptIdx + "'>";
					html +=      "<input type='hidden' value='" + item.teamIdx + "'>";
					html +=      "<input type='hidden' value='" + item.empName + "'>";
					html +=      "<input type='hidden' value='" + item.empCode + "'>";
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
	
});

$(function(){
	$('.approvalCell').on('click', '.approvalAdd', function(){
		$('.backGround').fadeIn(300);
		$('.lineSelectPopUp').fadeIn(300);
		document.body.style.overflow = 'hidden';
		
		let $td = $(this).closest("td");
		let tdEq = $('.approvalCell').find('td').index($td);				
		$('.lineSelectPopUp').attr('data-eq', tdEq);
	});

	$('.listTable').on('click', '.choose', function(){
		let tdEq = $('.lineSelectPopUp').attr('data-eq');

		let row = $(this).closest("tr");
		
	    let empIdx = row.find("input[type='hidden']").eq(0).val();
	    let deptIdx = row.find("input[type='hidden']").eq(1).val();
	    let teamIdx = row.find("input[type='hidden']").eq(2).val();
	    let empName = row.find("input[type='hidden']").eq(3).val();
	    let empCode = row.find("input[type='hidden']").eq(4).val();
	    let positionCode = row.find("input[type='hidden']").eq(5).val();
	    
	    let deptName = row.find("td").eq(0).text();
	    let teamName = row.find("td").eq(1).text();
	    let positionName = row.find("td").eq(3).text();
	    
	    html = "";
	    html += "<input type='hidden' value='" + empIdx + "'name='apr" + tdEq +"Emp'>";
	    html += "<input type='hidden' value='" + deptIdx + "'>";
	    html += "<input type='hidden' value='" + teamIdx + "'>";
		html += "<input type='hidden' value='" + empCode + "'name='apr" + tdEq +"Info'>";
	    html += "<input type='hidden' value='" + positionCode + "'>";
		
	    $(".approvalLine table tr:nth-of-type(1) th").eq(tdEq).html(html+ deptName + " " + teamName + " " + empName + " " + positionName);
	    
		$('.backGround').fadeOut(300);
		$('.lineSelectPopUp').fadeOut(300);
		document.body.style.overflow = 'hidden';
		
		$("#deptIdx").val("").trigger("change");
	    $("#teamIdx").html("<option value='' readOnly>소속</option>");
	    $("#positionCode").val("");
	    $(".listTable table tbody").html("");
		
		$('.approvalCell .approvalAdd').hide();
		
		document.body.style.overflow = 'auto';
		
		$('.approvalCell').find('td').eq(parseInt(tdEq) + 1).html("<button type='button' class='approvalAdd'>등록하기</button>");
		
	});
	
	$(".approvalCell").on('click', '.approvalAdd', function(){
		
		let tdEq = $('.lineSelectPopUp').attr('data-eq');
		
		if("input[name='paymentStage']") {
			$("input[name='paymentStage']").remove();
		}
		
		$('.approvalCell').append("<input type='hidden' value='" + tdEq +"' name='paymentStage'>")
		
		console.log(tdEq)
	});
	
});

$(function(){
	$('.close, .backGround').on('click', function(){
		$('.backGround').fadeOut(300);
		$('.lineSelectPopUp').fadeOut(300);
		
		$("#deptIdx").val("").trigger("change");
	    $("#teamIdx").html("<option value='' readOnly>소속</option>");
	    $("#positionCode").val("");
	    $(".listTable table tbody").html("");
		
		document.body.style.overflow = 'auto';
	});
	
	$(".reset").on("click", function() {
	    $("#deptIdx").val("").trigger("change");
	    $("#teamIdx").html("<option value='' readOnly>소속</option>");
	    $("#positionCode").val("");
	    $(".listTable table tbody").html("");
	});
});

// 결재 완료 날짜 찍기
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

// 휴가 날짜 평일 일 수 구하기
$(function(){
	
	const today = new Date().toISOString().split("T")[0];
	
	$("#startDate").attr('min', today);
	
	$("#startDate").on("change", function(){
		
		let startDate = $(this).val();
		$('#endDate').attr("min", startDate);
		$('#endDate').attr("");
		
	});
	
	$("#endDate").on("change", function(){
		
		let startDate = $("#startDate").val();
		let endDate = $(this).val();
		
		if(startDate && endDate) {
			let holidays = calWeekdays(startDate, endDate);
			
			$('.holiday td .date').val(holidays);
		}
		
	});
	
	function calWeekdays(start, end) {
		
		let startDate = new Date(start);
		let endDate = new Date(end);
		
		let count = 0;
		
		while(startDate <= endDate) {
			let day = startDate.getDay();
			if(day !== 0 && day !== 6) {
				count++;
			}
			startDate.setDate(startDate.getDate() + 1);
		}
		
		return count;
		
	}
	
	
	
});