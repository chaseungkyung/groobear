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
		
	 	f.action = '${pageContext.request.contextPath}/mypage/${mode}';
	    f.submit();
			
	}
	
	function selectDept() {
		
	}
	
</script>


</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<main>
		<div class="mainInner">
			<form name="empForm" method="post">
				<div class="empInfo">
	                <div class="photoArea">
	                    <div class="photo">
	                        <img src="https://placehold.co/225x300" alt="샘플이미지">
	                    </div>
	                    <div class="buttonArea">
	                        <button type="button" class="custom-button">사진 추가하기</button>
	                    </div>
	                </div>
	                <div class="info">
	                    <table>
							<tr>
								<th>사원번호</th>
								<td><input type="text" name="empCode" class="readonly" readonly value="${empInfo.empIdx}"></td>
								<th>비밀번호</th>
								<td><input type="text" name="empPwd" class="readonly" value="${mode=='modify' ? '****' : ''}" readonly></td>
							</tr>
							<tr>
								<th>성명</th>
								<td><input type="text" name="empName" value="${empInfo.empName}"></td>
								<th>입사년월</th>
								<td><input type="date" name="hireDate" id="" value="${mode=='modify' ? empInfo.hireDate : ''}" readOnly>
								
								</td>
							</tr>
							<tr>
								<th>부서</th>
								<td>
									<select name="deptIdx" id="deptIdx">
										<option value="${mode == 'modify' ? empInfo.deptIdx : ''}" readOnly>
											<c:choose>
												<c:when test="${mode == 'modify'}">
													${empInfo.deptName}
												</c:when>
												<c:otherwise>
													부서를 선택해주세요
												</c:otherwise>
											</c:choose>
										</option>	
									 </select>
								</td>
								<th>퇴사년월일</th>
								<td><input type="date" name="retireDate" readOnly></td>
							</tr>
							<tr>
								<th>소속</th>
								<td>
									<select name="teamIdx" id="teamIdx">
										<option value="${mode =='modify' ? empInfo.teamName : ''}" readOnly>
											<c:choose>
												<c:when test="${mode == 'modify'}" >
													${empInfo.teamName}
												</c:when>
												<c:otherwise>
													소속을 선택해주세요
												</c:otherwise>											
											</c:choose>
										</option>
									</select>
								</td>
								<th>주민등록번호</th>
								<td><input type="text" name="rrn" id="rrn" value="${empInfo.rrn}"></td>
							</tr>
							<tr>
								<th>직급</th>
								<td>
									<select name="positionCode" id="positionCode">
										<option value="${mode == 'modify' ? empInfo.positionCode : ''}" readOnly >
											<c:choose>
												<c:when test="${mode=='modify'}">
													${empInfo.positionCode}
												</c:when>
												<c:otherwise>
													직급을 선택해주세요											
												</c:otherwise>
											</c:choose>
										</option>
									</select>           
								</td>
								<th>휴대폰번호</th>
								<td class="tel"><input type="tel" name="tel" id="tel" value="${empInfo.tel}"></td>
							</tr>
							<tr>
								<th>내선번호</th>
								<td class="tel"><input type="tel" name="empTel" id="empTel" value="${empInfo.empTel}"></td>
								<th>주소</th>
								<td class="address1">
									<input type="text" name="zipCode" id="zipCode" value="${empInfo.zipCode}">
									<input type="text" name="addrMain" id="addrMain" value="${empInfo.addrMain}">
									<input type="button" value="주소검색">
								</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td class="eMail"><input type="text" name="email" class="readonly" readonly value="${empInfo.email}"> @ <input value="groobear.co.kr" disabled></td>	
								<th></th>
								<td class="address2"><input type="text" name="addrSub" id="addrSub" value="${empInfo.addrSub}"></td>
							</tr>
						</table>
                        <div class="insertBtn">
							<button type="reset" class="custom-button" >다시 작성</button>
							<button type="button" class="custom-button" onclick="location.href='${pageContext.request.contextPath}/emp/list'" >${mode=="modify" ? "수정취소" : "등록취소"}</button>
							<button type="button" class="custom-button select-button" onclick="insertEmp();" >${mode=="modify" ? "수정완료" : "등록완료"}</button>
                   	 	</div>
	                </div>
	            </div>
            </form>
            <div class="empHistory">
                <div class="title">
                    <p>사원 이력</p>
                </div>
                <table>
                    <tr>
                        <th>기간</th>
                        <th>부서</th>
                        <th>팀</th>
                        <th>직급</th>
                        <th>비고</th>
                    </tr>
	                    <c:forEach var="empRecord" items="${list}">
		                    <tr>
		                        <td style="padding-left: 30px;">${empRecord.startDate} ~ ${empRecord.endDate}</td>
		                        <td>${empRecord.deptName}</td>
		                        <td>${empRecord.teamName}</td>
		                        <td>${empRecord.empRank}</td>
		                        <td>${empRecord.note}</td>
		                    </tr>
	                    </c:forEach>

                </table>
            </div>
			<div class="back">
			    <c:choose>
			        <c:when test="${mode == 'modify'}">
			            <a href="${pageContext.request.contextPath}/mypage/mypage" class="custom-button">뒤로가기</a>
			        </c:when>
			        <c:otherwise>
			            <a href="${pageContext.request.contextPath}/emp/list" class="custom-button">뒤로가기</a>
			        </c:otherwise>
			    </c:choose>
			</div>
		</div>
	</main>
</body>
</html>