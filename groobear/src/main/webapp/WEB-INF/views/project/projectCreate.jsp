<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/project/projectCreate.css" type="text/css">
	
	
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
		    
		    if(!f.pmEmpIdx.value.trim()) {
		    	alert("프로젝트 매니저의 이름을 선택해주세요. ");
		        f.pmEmpName.focus();
		        return;
		    }
		    $('#teamName').val($('#teamSelect option:selected').text());
	        $('#pmEmpName').val($('#pmEmpSelect option:selected').text());
		
			f.action = '${pageContext.request.contextPath}/project/${mode}';
			f.submit();
		}
			
	</script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/project/projectHeader.jsp"/>
	
	<main>
		<div class="mainInner">
			<div class="write">
				<form name = "projectForm" method = "post" enctype = "multipart/form-data">
					<table class="textArea">
						<tr>
							<th>프로젝트 이름</th>
							<td><input type="text" name ="projName" value="${dto.projName}"></td>
						</tr>
						<tr>
							<th>시작일</th>
							<td><input type="date" name ="startDate" id="startDate" value="${dto.startDate}"></td>
						</tr>
						<tr>
							<th>종료일</th>
							<td><input type="date" name ="endDate" value="${dto.endDate}"></td>
						</tr>
						<tr>
						    <th>${mode == "update" ? "PM 수정" : "PM 지정"}</th>
						    <td class="teamName">
						        <select name="teamIdx" id="teamSelect">
						            <option value="">개발부 소속 팀을 선택해주세요.</option>
						            <c:forEach var="team" items="${teamList}">
						                <option value="${team.teamIdx}" ${team.teamIdx == dto.pmTeamIdx ? 'selected' : ''}>${team.teamName}</option>
						            </c:forEach>
						        </select>
						    </td>
						    <td class="pmName">
						        <select name="pmEmpIdx" id="pmEmpSelect">
						            <option value="">이름을 선택해주세요.</option>
						            <c:forEach var="emp" items="${empList}">
						                <option value="${emp.empIdx}" ${emp.empIdx == dto.pmEmpIdx ? 'selected' : ''}>${emp.empName}</option>
						            </c:forEach>
						        </select>
						
						        <input type="hidden" name="empName" id="empName">
						        <input type="hidden" name="teamName" id="teamName">
						    </td>						
						</tr>

					</table>
					<table class="table table-borderless">
	 					<tr>
							<td class="text-center">
								<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=="update" ? "수정완료" : "프로젝트 만들기"}&nbsp;<i class="bi bi-check2"></i></button>
								<button type="reset" class="btn btn-light">다시입력</button>
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/project/list';">${mode=="update" ? "수정취소" : "등록취소"}&nbsp;<i class="bi bi-x"></i></button>
							
								<c:if test="${mode=='update'}">
									<input type="hidden" name="projIdx" value="${dto.projIdx}">
									<input type="hidden" name="page" value="${page}">
								</c:if>
							
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</main>
	
<script type="text/javascript">
const teamSelect = $('#teamSelect');
const pmEmpSelect = $('#pmEmpSelect');

const selectedTeamIdx = "${dto.pmTeamIdx}";
const selectedPmEmpIdx = "${dto.pmEmpIdx}";

$(function(){   
    function loadTeams() {
        ajaxRequest('/project/getTeam', 'GET', { deptIdx: "F" }, 'json', function (data) {
            if (data.state === 'false') return false;

            if (data.teamList) {
                teamSelect.empty().append('<option value="">개발부 소속 팀을 선택해주세요.</option>');
                
                $.each(data.teamList, function(index, team) {
                    let selected = team.teamIdx == selectedTeamIdx ? "selected" : "";
                    teamSelect.append('<option value="' + team.teamIdx + '" ' + selected + '>' + team.teamName + '</option>');
                });

                if (selectedTeamIdx) {
                    loadPmList(selectedTeamIdx);
                }
            }
        });
    }


    function loadPmList(teamIdx) {
        let empUrl = '/project/getEmpName';

        ajaxRequest(empUrl, 'GET', { teamIdx: teamIdx }, 'json', function (data) {
            pmEmpSelect.empty().append('<option value="">이름을 선택해주세요</option>');

            if (data.state === "true" && data.empNameList) {
                $.each(data.empNameList, function(index, emp) {
                    let selected = emp.empIdx == selectedPmEmpIdx ? "selected" : "";
                    pmEmpSelect.append('<option value="' + emp.empIdx + '" ' + selected + '>' + emp.empName + '</option>');
                });
            } else {
                pmEmpSelect.append('<option value="">직원 목록을 불러올 수 없습니다.</option>');
            }
        });
    }

    teamSelect.on('change', function() {
        let teamIdx = $(this).val();
        if (teamIdx) {
            loadPmList(teamIdx);
        } else {
            pmEmpSelect.empty().append('<option value="">이름을 선택해주세요</option>');
        }
    });

    loadTeams();
});



</script>

</body>
</html>