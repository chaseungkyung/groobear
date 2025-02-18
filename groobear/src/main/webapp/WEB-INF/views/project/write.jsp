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
		    
		    if(!f.empIdx.value.trim()) {
		    	alert("프로젝트 매니저의 이름을 선택해주세요. ");
		        f.empName.focus();
		        return;
		    }
		    $('#teamName').val($('#teamSelect option:selected').text());
	        $('#empName').val($('#empSelect option:selected').text());
		
			f.action = '${pageContext.request.contextPath}/project/write';
			f.submit();
		}
			
	</script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/projectHeader3.jsp"/>
	
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
								<select name="teamIdx" id="teamSelect">
									<option value="">개발부 소속 팀을 선택해주세요</option>
								</select>
							</td>
							<td>
								<select name ="empIdx" id="empSelect">
									<option value="">이름을 선택해주세요</option>
								</select>
								
								<input type="hidden" name="empName" id="empName">
								<input type="hidden" name="teamName" id="teamName">
												
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
const teamSelect = $('#teamSelect');
const empSelect = $('#empSelect');

$(function(){
    // 개발부 소속 팀 불러오기    
    const fn = function(data){
    	if(data.state === 'false') {
    		return false;
    	}
    	
    	if(data){
    		if(data.teamList){
    			let html = '';
    			for(let item of data.teamList){
    				html += "<option value=" + item.teamIdx + ">" + item.teamName + "</option>";
    			}
    			teamSelect.append(html);
    		}	
    	}	
    };
    ajaxRequest('/project/getTeam', 'get', {deptIdx: "F"}, 'json', fn);

	
    // 팀을 선택하면 해당 팀의 직원 이름 가져오기
    teamSelect.on('change', function(){
        let teamIdx = $(this).val();

        if (teamIdx) {
            let empUrl = '/project/getEmpName';

            ajaxRequest(empUrl, 'GET', { teamIdx: teamIdx }, 'json', function (data) {
            	
                if (data.state === "true" && data.empNameList) {
                	empSelect.empty();
                	empSelect.append('<option value="">이름을 선택해주세요</option>');
                    
                	$.each(data.empNameList, function(index, emp){
                		empSelect.append('<option value="' + emp.empIdx + '">' + emp.empName + '</option>');
                	});
                	
                } else {
                	empSelect.empty().append('<option value="">직원 목록을 불러올 수 없습니다.</option>');
                }
            });
        } else {
        	empSelect.empty().append('<option value="">이름을 선택해주세요</option>');
        } 	
    });
    
});


</script>

</body>
</html>