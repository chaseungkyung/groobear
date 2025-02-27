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
		
		.empInfo .img-viewer {
			cursor: pointer;
			border: 1px solid #ccc;
			width: 225px;
			height: 300px;
			border-radius: 15px;
			background-image: url("https://placehold.co/225x300");
			position: relative;
			z-index: 9999;
			background-repeat : no-repeat;
			background-size : cover;
		}
		
	</style>
	
<script type="text/javascript">
window.addEventListener('load', function(){
	
	const mode = '${mode}';
	
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
				if(mode == 'update') {
					$("#deptIdx2").append(html);
				}
				
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
				if(mode == 'update') {
					$("#positionCode2").append(html);
				}
				
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

$(function() {
	let img = '${dto.saveProfile}';
	if( img ) { // 수정인 경우
		img = '${pageContext.request.contextPath}/uploads/emp/' + img;
		$('.empInfo .img-viewer').empty();
		$('.empInfo .img-viewer').css('background-image', 'url(' + img + ')');
	}
	
	$('.empInfo .img-viewer').click(function(){
		$('form[name=empForm] input[name=selectFile]').trigger('click'); 
	});
	
	$('form[name=empForm] input[name=selectFile]').change(function(){
		let file = this.files[0];
		if(! file) {
			$('.empInfo .img-viewer').empty();
			if( img ) {
				img = '${pageContext.request.contextPath}/uploads/emp/' + img;
			} else {
				img = 'https://placehold.co/225x300';
			}
			$('.empInfo .img-viewer').css('background-image', 'url(' + img + ')');
			
			return false;
		}
		
		if(! file.type.match('image.*')) {
			this.focus();
			return false;
		}
		
		let reader = new FileReader();
		reader.onload = function(e) {
			$('.empInfo .img-viewer').empty();
			$('.empInfo .img-viewer').css('background-image', 'url(' + e.target.result + ')');
		}
		reader.readAsDataURL(file);
	});
});

</script>


</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<main>
		<div class="mainInner">
			<form name="empForm" method="post"  enctype="multipart/form-data">
				<div class="empInfo">
	                <div class="photoArea">
                        <div class="img-viewer"></div>
                        <input type="file" name="selectFile" accept="image/*" class="form-control" style="display: none;">
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
									<select name="deptIdx" id="deptIdx" style="${mode=='update' ? 'pointer-events: none; background: #eee;':''}">
										<option value="">부서를 선택해주세요</option>	
									 </select>
								</td>
								<th>퇴사년월일</th>
								<td><input type="date" name="retireDate" ></td>
							</tr>
							<tr>
								<th>소속</th>
								<td>
									<select name="teamIdx" id="teamIdx" style="${mode=='update' ? 'pointer-events: none; background: #eee;':''}">
										<option value="" >소속을 선택해주세요	</option>
									</select>
								</td>
								<th>주민등록번호</th>
								<td><input type="text" name="rrn" id="rrn" value="${dto.rrn}"></td>
							</tr>
							<tr>
								<th>직급</th>
								<td>
									<select name="positionCode" id="positionCode" style="${mode=='update' ? 'pointer-events: none; background: #eee;':''}">
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
			
			<c:if test="${mode=='update'}">
			
				<form name="historyForm" method="post">
		            <div style="width:1450px; padding: 15px;">
		                <div class="title">
		                    <p>사원 이력</p>
		                </div>
		                
						<table class="table table-bordered">
							<thead class="table-light">
							    <tr align="center">
							        <th width="250">날짜</th>
							        <th width="200">부서</th>
							        <th width="200">팀</th>
							        <th width="200">직급</th>
							        <th width="250">비고</th>
							        <th width="100">담당</th>
							        <th>변경</th>
							    </tr>
						    </thead>
						    <tbody>
							    <tr align="center">
							        <td><input type="date" name="startDate" class="form-control form-control-sm"></td>
							        <td>
							        	<select name="deptIdx" id="deptIdx2" class="form-control form-control-sm">
											<option value="">부서를 선택해주세요</option>	
										 </select>
										 <input type="hidden" name="deptName">
									</td>
									<td>
							        	<select name="teamIdx" id="teamIdx2" class="form-control form-control-sm">
											<option value="" >소속을 선택해주세요	</option>
										</select>
										<input type="hidden" name="teamName">
									</td>
									<td>
							        	<select name="positionCode" id="positionCode2" class="form-control form-control-sm">
											<option value="">직급을 선택해주세요</option>
										</select>
										<input type="hidden" name="empRank">
							        </td>
							        <td><input type="text" name="note" class="form-control form-control-sm"></td>
							        <td>
							        	${sessionScope.member.empName}
									</td>
							        <td>
							        	<input type="hidden" name="empIdx" value="${dto.empIdx}">
							        	<button type="button" class="action-col" onclick="updateEmpHistory();">등록</button>
							        </td>
							    </tr>
						    </tbody>
						    <tfoot>
							    <c:forEach var="empInfo" items="${list}">
							        <tr align="center">
							            <td>${empInfo.startDate} ~ ${empty empInfo.endDate ? '현재' : empInfo.endDate}</td>
							            <td>${empInfo.deptName}</td>
							            <td>${empInfo.teamName}</td>
							            <td>${empInfo.empRank}</td>
							            <td align="left">${empInfo.note}</td>
							            <td>${empInfo.updateName}</td>
							            <td></td>
							        </tr>
							    </c:forEach>
						    </tfoot>
						</table>
		            </div>
	            </form>
	            
	            <script type="text/javascript">
		            window.addEventListener('load', function(){
		            	
		            	// Dept Change Event / request Team
		            	$("#deptIdx2").on("change", function() {
		            		const fn = function(data){
		            			if(data.state === 'false') {
		            				return false;
		            			}
		            			if(data && data.team){
		            				let html = "<option value='' selected disabled>소속을 선택해주세요</option>";
		            				for(item of data.team){
		            					html += "<option value="+ item.teamIdx +">" + item.teamName +"</option>";
		            				}
		            				$("#teamIdx2").html(html);
		            			}
		            		};
		            		let formData = 'deptIdx=' + $("#deptIdx2").val();
		            		ajaxRequest('/emp/getTeam', 'get', formData, 'json', fn);
		            	})
		            });
		            
		            function updateEmpHistory() {
		            	const f = document.historyForm;

		            	if(! f.startDate.value) {
		            		f.startDate.focus();
		            		return;
		            	}

		            	if(! f.deptIdx.value) {
		            		f.deptIdx.focus();
		            		return;
		            	}
		            	f.deptName.value = $('#deptIdx2 :selected').text();
		            	
		            	if(! f.teamIdx.value) {
		            		f.deptIdx.focus();
		            		return;
		            	}
		            	f.teamName.value = $('#teamIdx2 :selected').text();

		            	if(! f.positionCode.value) {
		            		f.deptIdx.focus();
		            		return;
		            	}
		            	f.empRank.value = $('#positionCode2 :selected').text();

		            	f.action = '${pageContext.request.contextPath}/emp/historyCreated';
		            	f.submit();
		            }
		            
	            </script>
	            
            </c:if>
            
		</div>
	</main>
</body>
</html>