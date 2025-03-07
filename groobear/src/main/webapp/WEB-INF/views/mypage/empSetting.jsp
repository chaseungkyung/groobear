<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>

	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">

</head>

<style type="text/css">
.body-container {
	max-width: 800px;
}

.btn-color {
	background-color: #365F8A;
	color: #fff;
	align-content: center;
}

.btn-color:hover, .btn-color:active, .btn-color:focus {
	background-color: #7A9ACD;
	border: 1px solid #7A9ACD;
	color: #fff;
}

.btn-colors {
	background-color: #B03A2E;
	color: #fff;
	align-content: center;
}

.btn-colors:hover, .btn-colors:active, .btn-colors:focus {
	background-color: #E26A6A;
	border: 1px solid #E26A6A;
	color: #fff;
}

</style>

<script type="text/javascript">
function isValidDateString(dateString) {
	try {
		const date = new Date(dateString);
		const [year, month, day] = dateString.split("-").map(Number);
		
		return date instanceof Date && !isNaN(date) && date.getDate() === day;
	} catch(e) {
		return false;
	}
}

function memberOk() {
	const f = document.memberForm;
	let str;

    str = f.empName.value;
    if( !/^[가-힣]{2,5}$/.test(str) ) {
        alert('이름을 다시 입력하세요. ');
        f.empName.focus();
        return;
    }

    str = f.birth.value;
    if( ! isValidDateString(str) ) {
        alert('생년월일를 입력하세요. ');
        f.birth.focus();
        return;
    }

    str = f.tel.value;
    if (!/^\d{2,3}-\d{3,4}-\d{4}$/.test(str)) {
        alert('전화번호는 XXX-XXXX-XXXX 형식으로 입력해주세요.');
        f.tel.focus();
        return;
    }
   
    str = f.email.value.trim();
    if (!/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(str)) {
        alert('이메일은 example@example.com 형식으로 입력해주세요.');
        f.email.focus();
        return;
    }

    f.action = '${pageContext.request.contextPath}/mypage/empSetting';
    f.submit();
}
</script>

<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/mypageHeader.jsp"/>
	
</header>	
	
<main>
	<div class="mainInner" align="center" style="margin-left: 100px; padding: 50px;">
		
		<div class="body-main">
			
			<form name="memberForm" method="post">
				<div class="row mb-3" >
					<label class="col-sm-2 col-form-lable" for="empCode">사번</label>
					<div class="col-sm-10 wrap-empCode">
						<div class="row">
							<div class="col-6">
								<input type="text" name="empCode" id="empCode" class="form-control"
									value="${dto.empCode}" readonly placeholder="사번">
							</div>
						</div>
					</div>
				</div>
				
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label" for="empName">이름</label>
					<div class="col-sm-10 wrap-empName" >
						<div class="row">
							<div class="col-6">
								<input type="text" name="empName" id="empName" class="form-control" 
										value="${dto.empName}" ${mode=='update'} placeholder="이름">
							</div>
						</div>
					</div>
				</div>
								
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label" for="birth">생년월일</label>
					<div class="col-sm-10 wrap-birth">
						<div class="row">
							<div class="col-6">
								<input type="date" name="birth" id="birth" class="form-control" 
										value="${dto.birth}" ${mode=='update'} placeholder="생년월일">
							</div>
						</div>
						<small class="form-control-plaintext" style="text-align: left; margin-left: 50px; line-height: 2;">
							생년월일은 YYYY-MM-DD 형식으로 입력해주세요.</small>
					</div>
				</div>
								
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label" for="email">이메일</label>
					<div class="col-sm-10 row wrap-email">
						<div class="col-6 pe-0">
							<input type="text" name="email" id="email" class="form-control" 
									value="${dto.email}" ${mode=='update'} placeholder="이메일">
						</div>
					</div>
				</div>
								
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label" for="tel">전화번호</label>
					<div class="col-sm-10 row wrap-tel">
						<div class="col-6 pe-0">
							<input type="text" name="tel" id="tel" class="form-control" 
									value="${dto.tel}" ${mode=='update'} placeholder="전화번호">
						</div>
					</div>
				</div>
								
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label" for="zipCode">우편번호</label>
					<div class="col-sm-5">
						<div class="input-group">
							<input type="text" name="zipCode" id="zipCode" class="form-control" 
							     	placeholder="우편번호" value="${dto.zipCode}" readonly>
						    <button class="btn btn-light" type="button" style="margin-left: 3px;" 
						    onclick="daumPostcode();">우편번호 검색</button>
						   </div>
					</div>
				</div>								

				<div class="row mb-3">
					<label class="col-sm-2 col-form-label" for="addrMain">주소</label>
					<div class="col-sm-5 wrap-addrMain">
						<div>
							<input type="text" name="addrMain" id="addrMain" class="form-control" 
									placeholder="기본 주소" value="${dto.addrMain}" readonly>
						</div>
						<div style="margin-top: 5px;">
							<input type="text" name="addrSub" id="addrSub" class="form-control" 
									placeholder="상세 주소" value="${dto.addrSub}">
						</div>
					</div>
				</div>								
								
				<div class="row mb-3" style="text-align: center; margin-right: 250px; padding-top: 25px;">
					<div class="text-left">
				    	<button type="button" name="sendButton" class="btn btn-color" 
				    			onclick="memberOk();"> ${mode=='update'?'': readonly} 
				    			수정완료 <i class="bi bi-check2"></i></button>
						<button type="button" class="btn btn-colors" 
								onclick="location.href='${pageContext.request.contextPath}/mypage/workList';"> 
								 ${mode=='update'?'':readonly} 수정취소<i class="bi bi-x"></i></button>
					</div>
				</div>
							
				<div class="row">
					<p class="form-control-plaintext text-center">${message}</p>
				</div>							
			</form>
			
		</div>
	</div>
</main>	

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function daumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {

        	var fullAddr = '';
            var extraAddr = ''; 

            if (data.userSelectedType === 'R') {
                fullAddr = data.roadAddress;

            } else { 
                fullAddr = data.jibunAddress;
            }


            if(data.userSelectedType === 'R'){

            	if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            document.getElementById('zipCode').value = data.zonecode;
            document.getElementById('addrMain').value = fullAddr;

            document.getElementById('addrSub').focus();
        }
    }).open();
}
</script>



<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

	<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
	
</body>
</html>