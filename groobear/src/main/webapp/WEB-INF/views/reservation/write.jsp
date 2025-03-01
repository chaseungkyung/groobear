<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>spring</title>

<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>

<style type="text/css">
.body-container {
	max-width: 800px;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/boot-board.css" type="text/css">

<script type="text/javascript" src="${pageContext.request.contextPath}/dist/js/dateUtil.js"></script>
<script type="text/javascript">
function sendOk() {
    const f = document.reservationForm;
	let str;
	
	if( ! f.title.value.trim() ) {
		f.title.focus();
		return;
	}
	
	if( ! f.reservDate.value ) {
		f.reservDate.focus();
		return;
	}

	if( f.endTime.value ) {
		let s1 = f.startTime.value.replace(/:/g, "");
		let s2 = f.endTime.value.replace(/:/g, "");
		if(s1 > s2) {
			f.startTime.focus();
			return;
		}
	}
	
    f.action = '${pageContext.request.contextPath}/reservation/write';
    f.submit();
}

$(function(){
	$('#form-color').css('background-color', $('#form-color').val());
	$('#form-color').css('color', '#fff');
	$('#form-color').change(function(){
		$(this).css('background-color', $(this).val());
	});
});

/*
 window.onload = function() {
    const activeTab = localStorage.getItem('activeTab') || 'A';
    loadTab(activeTab);
}; 
 */
</script>

</head>
<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
</header>
	
<main>
	<div class="container">
		<div class="body-container">	
			<div class="body-title">
				<h3><i class="bi bi-calendar-event"></i> 예약 관리 </h3>
			</div>
			
			<div class="body-main">

				<form name="reservationForm" method="post">
					<table class="table mt-5 write-form">
						<tr>
							<td class="bg-light col-2" scope="row">제 목</td>
							<td>
								<div class="row">
									<div class="col">
										<input type="text" name="title" maxlength="100" id="form-subject" class="form-control" value="${dto.title}">
									</div>
								</div>
								<small class="form-control-plaintext">* [부서]사용목적 간단디(필수 입력 항목).</small>
							</td>
						</tr>
	
						<tr>
							<td class="bg-light col-2" scope="row"></td>
						</tr>
	
						<tr>
							<td class="bg-light col-2" scope="row">예약장소</td>
							<td>
								<div class="row">
									<div class="col-5">
										<select name="cabinet" id="form-cabinet" class="form-select">
											<option value="A" style="background:#F781F3;" >A회의실</option>
											<option value="B" style="background:#31B404;" >B회의실</option>
											<option value="C" style="background:#F78181;" >C회의실</option>
										</select>
									</div>
								</div>
							</td>
						</tr>
	
	 					<tr>
							<td class="bg-light col-2" scope="row">예약일자</td>
							<td>
								<div class="row">
									<div class="col-5 pe-0">
										<input type="date" name="reservDate" id="form-startDate" class="form-control" value="${dto.reservDate}">
									</div>
									<div class="col-3">
										<input type="time" name="startTime" id="form-startTime" class="form-control" value="${dto.startTime}">
											
									</div>
								</div>
								<small class="form-control-plaintext">* 예약날짜는 필수입니다.</small>
							</td>
						</tr>
	
	 					<tr>
							<td class="bg-light col-2" scope="row">종료시간</td>
							<td>
								<div class="row">
									<div class="col-3">
										<input type="time" name="endTime" id="form-endTime" class="form-control" value="${dto.endTime}">
											
									</div>
								</div>
							</td>
						</tr>
					</table>
					
					<table class="table table-borderless">
	 					<tr>
							<td class="text-center">
								<input type = "hidden" name="cabinet" value="${cabinet}">
								<button type="button" class="btn btn-dark" onclick="sendOk();">예약완료&nbsp;<i class="bi bi-check2"></i></button>
								<button type="reset" class="btn btn-light">다시입력</button>
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/reservation/main?cabinet=${cabinet}';">입력취소&nbsp;<i class="bi bi-x"></i></button>
							</td>
						</tr>
					</table>
				</form>

			</div>
		</div>
	</div>
</main>

<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>