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
	                    	<c:choose>
		          	        	<c:when test="${mode='modify'}">
		          	        	</c:when>
		          	        	<c:otherwise>
		          	            	<button type="button" class="custom-button">사진 수정하기</button>
		          	        	</c:otherwise>
	                    	</c:choose>
	                    </div>
	                </div>
	                <div class="info">
	                    <table>
							<tr>
								<th>사원번호</th>
								<td><input type="text" name="empCode" class="readonly" readonly value="${empInfo.empIdx}"></td>
								<th>비밀번호</th>
								<td><input type="text" name="empPwd" class="readonly" value="${mode=='modify' ? '****' : ''}" ></td>
							</tr>
							<tr>
								<th>성명</th>
								<td><input type="text" name="empName" class="readonly" value="${empInfo.empName}"></td>
								<th>입사년월</th>
								<td><input type="date" name="hireDate" id="" class="readonly" value="${mode=='update' ? empInfo.hireDate : ''}" readOnly>
								
								</td>
							</tr>
							<tr>
								<th>부서</th>
								<td><input type="text" class="readonly" value="${empInfo.deptName}" readonly></td>
								<th>퇴사년월일</th>
								<td><input type="date" class="readonly" name="retireDate" readOnly></td>
							</tr>
							<tr>
								<th>소속</th>
								<td><input type="text" class="readonly" value="${empInfo.teamName}" readonly></td>
								<th>주민등록번호</th>
								<td><input type="text" class="readonly" name="rrn" id="rrn" value="${empInfo.rrn}" readOnly></td>
							</tr>
							<tr>
								<th>직급</th>
								<td><input type="text" class="readonly" value="${empInfo.positionCode}" readonly></td>
								<th>휴대폰번호</th>
								<td class="tel"><input type="tel" name="tel" id="tel" class="readonly" value="${empInfo.tel}" readOnly></td>
							</tr>
							<tr>
								<th>내선번호</th>
								<td class="tel"><input type="tel" name="empTel" id="empTel" class="readonly" value="${empInfo.empTel}" readonly></td>
								<th>주소</th>
								<td class="address1">
									<input type="text" name="zipCode" id="zipCode" class="readonly" value="${empInfo.zipCode}"readOnly>
									<input type="text" name="addrMain" id="addrMain" class="readonly" value="${empInfo.addrMain}"readOnly>
								</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td class="eMail"><input type="text" name="email" class="readonly"  value="${empInfo.email}" readOnly> @ <input value="groobear.co.kr" disabled></td>	
								<th></th>
								<td class="address2"><input type="text" name="addrSub" id="addrSub" class="readonly" value="${empInfo.addrSub}" readOnly></td>
							</tr>
						</table>
	                </div>
	            </div>
            </form>
            <div class="back">
			    <a href="javascript:history.back();" class="custom-button btn-right">뒤로가기</a>
			</div>
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
		</div>
	</main>
</body>
</html>