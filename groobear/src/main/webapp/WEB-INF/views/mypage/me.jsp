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

function insertEmp(){
	const f = document.empForm;
	let str;
	
	f.action = '${pageContext.request.contextPath}/mypage/modify';
	f.submit();
}

$(function() {
	let img = '${empInfo.saveProfile}';
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
			<form name="empForm" method="post" enctype="multipart/form-data">
				<div class="title">
                    <p>나의 정보</p>
                </div>
				<div class="empInfo">
	                <div class="photoArea">
                        <div class="img-viewer"></div>
                        <input type="file" name="selectFile" accept="image/*" class="form-control" style="display: none;">
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
								<td><input type="date" name="hireDate" id="" class="readonly" value="${empInfo.hireDate}" readOnly>
								
								</td>
							</tr>
							<tr>
								<th>부서</th>
								<td><input type="text" class="readonly" value="${empInfo.deptName}" readonly></td>
								<th>퇴사년월일</th>
								<td><input type="date" class="readonly" name="retireDate" value="${empInfo.retireDate}"readOnly></td>
							</tr>
							<tr>
								<th>소속</th>
								<td><input type="text" class="readonly" value="${empInfo.teamName}" readonly></td>
								<th>주민등록번호</th>
								<td><input type="text" class="readonly" name="rrn" id="rrn" value="${empInfo.rrn}" readOnly></td>
							</tr>
							<tr>
								<th>직급</th>
								<td><input type="text" class="readonly" value="${empInfo.positionName}" readonly></td>
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
	            <div style= "text-align: left; margin-left: 55px;">
				    <button type="button" class="custom-button" onclick="insertEmp();" >사진 수정 완료</button>
				    <input type='hidden' name="empIdx" value="${empInfo.empIdx}">
	            </div>
            </form>
            <div class="back">
			    <a href="javascript:history.back();" class="custom-button btn-right">뒤로가기</a>
			</div>
            <div style="width:1000px; padding: 15px;">
                <div class="title">
                    <p>나의 이력</p>
                </div>
                <table class="table table-bordered">
              	  <thead class="table-light">
                    <tr  align="center">
                        <th width="250">날짜</th>
                        <th width="200">부서</th>
                        <th width="200">팀</th>
                        <th width="200">직급</th>
                        <th width="250">비고</th>
                    </tr>
                   <tbody>
		                <c:forEach var="empRecord" items="${list}">
			                <tr  align="center">
			                	<td style="padding-left: 30px;">${empRecord.startDate} ~ ${empty empRecord.endDate ? '현재' : empRecord.endDate}</td>
								<td>${empRecord.deptName}</td>
								<td>${empRecord.teamName}</td>
								<td>${empRecord.empRank}</td>
								<td>${empRecord.note}</td>
			                </tr>
		               </c:forEach>
                   </tbody>
                </table>
            </div>
		</div>
	</main>
</body>
</html>