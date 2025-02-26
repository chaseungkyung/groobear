<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/emp/add.css" type="text/css">
	<style type="text/css">
		main {width: 93vw;}
		main .mainInner {width: 83vw;}
	</style>
	
<script type="text/javascript">
window.addEventListener('load', function(){
		
	// request Dept
	const fn = function(data){
		if(data.state === 'false') {
			return false;
		}
		// dept 
		if(data){
			if(data.dept){
				// let html = "<option value=''>부서를 선택해주세요</option>";
				let html = "";
				for(item of data.dept){
					html += "<option value="+ item.deptIdx +">" + item.deptName +"</option>";
				}
				$("#deptIdx").append(html);
				
				let deptIdx = '${dto.deptIdx}';
				$("#deptIdx").val(deptIdx);
				
				if(deptIdx) {
					$("#deptIdx").trigger('change');
				}
				
			}
			if(data.position){
				let html = "";
				for(item of data.position){
					html += "<option value="+ item.positionCode +">" + item.positionName +"</option>";
				}
				$("#positionCode").append(html);
				
				$("#positionCode").val('${dto.positionCode}');
			}
		}
	};
	ajaxRequest('/emp/getDeptAndPosition', 'get', null, 'json', fn);
	
	// Dept Change Event / request Team
	$("#deptIdx").on("change", function() {
		const fn = function(data){
			if(data.state === 'false') {
				return false;
			}
			if(data && data.team){
				let html = "<option value='' selected disabled>소속을 선택해주세요</option>";
				for(item of data.team){
					html += "<option value="+ item.teamIdx +">" + item.teamName +"</option>";
				}
				$("#teamIdx").html(html);
				
				$("#teamIdx").val('${dto.teamIdx}');
			}
		};
		let formData = 'deptIdx=' + $("#deptIdx").val();
		ajaxRequest('/emp/getTeam', 'get', formData, 'json', fn);
	})
		
});

function insertEmp() {
	const f = document.empForm;
	let str;
		
	let mode = '${mode}';
		
 	f.action = '${pageContext.request.contextPath}/emp/${mode}';
    f.submit();
			
}
	
function updateEmpHistory() {
	const f = document.historyForm;
	let str;
	let mode = '${mode}';
		
	f.action = '${pageContext.request.contextPath}/emp/${mode}';
	f.submit();
}

$(function() {
	let img = '${dto.origProfile}';
	if( img ) { // 수정인 경우
		img = '${pageContext.request.contextPath}/uploads/photo/' + img;
		$('.empForm .img-viewer').empty();
		$('.empForm .img-viewer').css('background-image', 'url(' + img + ')');
	}
	
	$('.empForm .img-viewer').click(function(){
		$('form[name=photoForm] input[name=selectFile]').trigger('click'); 
	});
	
	$('form[name=photoForm] input[name=selectFile]').change(function(){
		let file = this.files[0];
		if(! file) {
			$('.empForm .img-viewer').empty();
			if( img ) {
				img = '${pageContext.request.contextPath}/uploads/photo/' + img;
			} else {
				img = '${pageContext.request.contextPath}/dist/images/add_photo.png';
			}
			$('.empForm .img-viewer').css('background-image', 'url(' + img + ')');
			
			return false;
		}
		
		if(! file.type.match('image.*')) {
			this.focus();
			return false;
		}
		
		let reader = new FileReader();
		reader.onload = function(e) {
			$('.empForm .img-viewer').empty();
			$('.empForm .img-viewer').css('background-image', 'url(' + e.target.result + ')');
		}
		reader.readAsDataURL(file);
	});
});
}

</script>


</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<main>
		<div class="mainInner">
			<form name="empForm" method="post"  enctype="multipart/form-data">
				<div class="empInfo">
	                <div class="photoArea">
	                    <div class="buttonArea">
          	            	<button type="button" class="custom-button" onclick="">사진 등록</button>
	                    </div>
	                    <div class="img-viewer">
	                        <!-- <img src="https://placehold.co/225x300" alt="샘플이미지"> -->
	                        <input type="file" name="selectFile" accept="image/*" class="form-control" style="display: none;">
	                    </div>
	                </div>
	                <div class="info">
	                    <table>
							<tr>
								<th>사원번호</th>
								<td><input type="text" name="empCode" class="readonly" value="${mode=='update' ? dto.empCode : ''}" readonly></td>
								<th>비밀번호</th>
								<td><input type="text" name="empPwd" class="readonly"  value="${mode=='update' ? '****' : '' }" readonly ></td>
							</tr>
							<tr>
								<th>성명</th>
								<td><input type="text" name="empName" value="${dto.empName}"></td>
								<th>입사년월</th>
								<td><input type="date" name="hireDate" id="" value="${dto.hireDate}" >
								
								</td>
							</tr>
							<tr>
								<th>부서</th>
								<td>
									<select name="deptIdx" id="deptIdx">
										<option value="">부서를 선택해주세요</option>	
									 </select>
								</td>
								<th>퇴사년월일</th>
								<td><input type="date" name="retireDate" ></td>
							</tr>
							<tr>
								<th>소속</th>
								<td>
									<select name="teamIdx" id="teamIdx">
										<option value="" >소속을 선택해주세요	</option>
									</select>
								</td>
								<th>주민등록번호</th>
								<td><input type="text" name="rrn" id="rrn" value="${dto.rrn}"></td>
							</tr>
							<tr>
								<th>직급</th>
								<td>
									<select name="positionCode" id="positionCode">
										<option value="">직급을 선택해주세요</option>
									</select>           
								</td>
								<th>휴대폰번호</th>
								<td class="tel"><input type="tel" name="tel" id="tel" value="${dto.tel}"></td>
							</tr>
							<tr>
								<th>내선번호</th>
								<td class="tel"><input type="tel" name="empTel" id="empTel" value="${dto.empTel}"></td>
								<th>주소</th>
								<td class="address1">
									<input type="text" name="zipCode" id="zipCode" value="${dto.zipCode}" placeholder="우편번호">
									<input type="text" name="addrMain" id="addrMain" value="${dto.addrMain}">
									<input type="button" value="주소검색">
								</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td class="eMail"><input type="text" name="email" value="${dto.email}"> @ <input value="groobear.co.kr" disabled></td>	
								<th></th>
								<td class="address2"><input type="text" name="addrSub" id="addrSub" value="${dto.addrSub}"></td>
							</tr>
							<tr>
								<th></th> <td></td>
								<th>재직상태</th>
							     	<td class="empStatus">
							        <select name="empStatus" id="empStatus">
							        	<option value="0" ${dto.empStatus=='0'?'selected':''}>재직</option> 
							            <option value="1" ${dto.empStatus=='1'?'selected':''}>휴직</option> 
							            <option value="2" ${dto.empStatus=='2'?'selected':''}>퇴직</option> 							                    
							        </select>
							        </td>
								</tr>
						</table>
                        <div class="insertBtn">
	                        <button type="reset" class="custom-button" >다시 작성</button>
							<button type="button" class="custom-button" onclick="location.href='${pageContext.request.contextPath}/emp/list'" >${mode=="update" ? "수정취소" : "등록취소"}</button>
							<button type="button" class="custom-button select-button" onclick="insertEmp();" >${mode=="update" ? "수정완료" : "등록완료"}</button>
							<c:if test="${mode=='update'}">
								<input type='hidden' name="empIdx" value="${dto.empIdx}">
							</c:if>
                   	 	</div> 
	                </div>
	            </div>
            </form>
            <div class="back">
			    <a href="javascript:history.back();" class="custom-button btn-right">뒤로가기</a>
			</div>
			<form name="historyForm" method="post">
	            <div class="empHistory">
	                <div class="title">
	                    <p>사원 이력</p>
	                </div>
					<table class="empHistory">
					    <tr>
					        <th class="date-col">시작일</th>
					        <th></th>
					        <th class="date2-col">종료일</th>
					        <th class="dept-col">부서</th>
					        <th class="team-col">팀</th>
					        <th class="rank-col">직급</th>
					        <th class="note-col">비고</th>
					        <th class="action-col"></th>
					    </tr>
					    <tr>
					        <td><input type="text" class="input-small date-col"></td>
					        <td>~</td>
					        <td><input type="text" class="input-small date2-col"></td>
					        <td><input type="text" class="input-small dept-col"></td>
					        <td><input type="text" class="input-small team-col"></td>
					        <td><input type="text" class="input-small rank-col"></td>
					        <td><input type="text" class="input-small note-col"></td>
					        <td><button type="button" class="action-col" onclick="updateEmpHistory();">등록</button></td>
					    </tr>
					    <c:forEach var="empInfo" items="${list}">
					        <tr>
					            <td class="date-col">${empInfo.startDate}</td>
					            <td>~</td>
					            <td class="date2-col">${empty empInfo.endDate ? '' : empInfo.endDate}</td>
					            <td class="dept-col">${empInfo.deptName}</td>
					            <td class="team-col">${empInfo.teamName}</td>
					            <td class="rank-col">${empInfo.empRank}</td>
					            <td class="action-col">${empInfo.note}</td>
					            <td></td>
					        </tr>
					    </c:forEach>
					</table>
	            </div>
            </form>
		</div>
	</main>
</body>
</html>