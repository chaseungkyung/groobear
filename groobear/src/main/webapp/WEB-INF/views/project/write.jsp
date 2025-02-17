<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/project/write.css" type="text/css">
	
	
	<script type="text/javascript">
		function sendOk() {
		    const f = document.projectForm;
			let str;
		    
			if(!f.projName.value.trim()) {
		        alert('프로젝트 이름을 입력하세요. ');
		        f.projName.focus();  
		        return;
			}
		    
			if(!f.startDate.value.trim()) {
		        alert("프로젝트 시작일을 입력하세요. ");
		        f.startDate.focus();
		        return;
			}
			
		    
			str = f.endDate.value.trim();
		    if(!str) {
		        alert('프로젝트 종료일을 입력하세요. ');
		        f.endDate.focus();
		        return;
		    }
			
		    if(!f.teamIdx.value.trim()) {
		    	alert("프로젝트 매니저의 팀을 선택해주세요.");
		    	f.teamIdx.focus();
		    	return;
		    }
		    
		    if(!f.empName.value.trim()) {
		    	alert("프로젝트 매니저의 이름을 선택해주세요. ");
		        f.empName.focus();
		        return;
		    }

		
			f.action = '${pageContext.request.contextPath}/project/write';
			f.submit();
		}
		
		function searchOk() {
			
		}
		
	</script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/projectHeader.jsp"/>
	
	<main>
		<div class="mainInner">
			<div class="write">
				<form name = "projectForm" method = "post" enctype = "multipart/form-data">
					<table class="textArea">
						<tr>
							<th>프로젝트 이름</th>
							<td><input type="text" name ="projName" ></td>
						</tr>
						<tr>
							<th>시작일</th>
							<td><input type="date" name ="startDate" id="startDate" min=""></td>
						</tr>
						<tr>
							<th>종료일</th>
							<td><input type="date" name ="endDate"></td>
						</tr>
						<tr>
							<th>PM 지정</th>
							<td>
								<select name="teamIdx" id="teamIdx">
									<option value="">개발부 소속 팀을 선택해주세요</option>
								</select>
							</td>
							<td>
								<select name ="empName" id="empName">
									<option value="">이름을 선택해주세요</option>
								</select>
								
								<input type="hidden" name="empIdx" id="empIdx">
												
							</td>						
						</tr>
					</table>
					<table class="table table-borderless">
	 					<tr>
							<td class="text-center">
								<button type="button" class="btn btn-dark" onclick="sendOk();">프로젝트 만들기&nbsp;<i class="bi bi-check2"></i></button>
								<button type="reset" class="btn btn-light">다시입력</button>
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/project/list';">취소&nbsp;<i class="bi bi-x"></i></button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</main>
	
<script type="text/javascript">

$(function(){
    // 개발부 소속 팀을 불러오기    
    const fn = function(data){
    	if(data.state === 'false') {
    		return false;
    	}
    	
    	if(data){
    		if(data.teamList){
    			let html = '';
    			for(const item of data.teamList){
    				html += "<option value=" + item.teamIdx + ">" + item.teamName + "</option>";
    			}
    			$('#teamIdx').append(html);
    		}	
    	}	
    };
    ajaxRequest('/project/getTeam', 'get', {deptIdx: "F"}, 'json', fn);

	
    // 팀을 선택하면 해당 팀의 직원 이름 가져오기
    $('#teamIdx').on('change', function(){
        let teamIdx = $(this).val();

        if (teamIdx) {
            let empUrl = '/project/getEmpName'; // 팀 이름을 가져오는 API 엔드포인트

            ajaxRequest(empUrl, 'GET', { teamIdx: teamIdx }, 'json', function (data) {
                if (data.state === "true" && data.empNameList) {
                	let empSelect = $('#empName');
                	empSelect.empty();
                	empSelect.append('<option value="">이름을 선택해주세요</option>')
                    
                	$.each(data.empNameList, function(index, emp){
                		empSelect.append('<option value="' + emp.empIdx + '">' + emp.empName + '</option>');
                	});
                	
                } else {
                	$("#empName").empty().append('<option value="">직원 목록을 불러올 수 없습니다.</option>');
                }
            });
        } else {
        	$("#empName").empty().append('<option value="">이름을 선택해주세요</option>');
        } 	
    });
    
    // 선택된 직원의 empIdx 값을 hidden input 에 설정
    $('#empName').on('change', function(){
    	let selectEmpIdx = $(this).val();
    	$('#empIdx').val(selectedEmpIdx);
    });

});



</script>

</body>
</html>