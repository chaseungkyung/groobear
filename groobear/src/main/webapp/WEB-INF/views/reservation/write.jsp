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

	if(! f.cabinet.value ) {
		f.cabinet.focus();
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

window.onload = function() {
    const activeTab = localStorage.getItem('activeTab') || '3';
    loadTab(activeTab);
};
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
				<h3><i class="bi bi-calendar-event"></i> 일정관리 </h3>
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
							<td class="bg-light col-2" scope="row">예약 장소</td>
							<td>
								<div class="row">
									<div class="col-5">
										<c:when test="${categoryIdx == 3}">
											<p>회사일정</p>
											<input type= "hidden" name="categoryIdx" value="3">
										</c:when>
									</div>
								</div>
							</td>
						</tr>
	
						<tr>
							<td class="bg-light col-2" scope="row">색 상</td>
							<td>
								<div class="row">
									<div class="col-5">
										<select name="color" id="form-color" class="form-select">
											<option value="#F781F3" style="background:#F781F3;" ${dto.color=="#F781F3"?"selected":""}></option>
											<option value="#31B404" style="background:#31B404;" ${dto.color=="#31B404"?"selected":""}></option>
											<option value="#F78181" style="background:#F78181;" ${dto.color=="#F78181"?"selected":""}></option>
											<option value="#FAAC58" style="background:#FAAC58;" ${dto.color=="#FAAC58"?"selected":""}></option>
											<option value="tomato" style="background:tomato;" ${dto.color=="tomato"?"selected":""}></option>
											<option value="#AEB404" style="background:#AEB404;" ${dto.color=="#AEB404"?"selected":""}></option>
											<option value="#00BFFF" style="background:#00BFFF;" ${dto.color=="#00BFFF"?"selected":""}></option>
											<option value="#DA81F5" style="background:#DA81F5;" ${dto.color=="#DA81F5"?"selected":""}></option>
											<option value="#2E64FE" style="background:#2E64FE;" ${dto.color=="#2E64FE"?"selected":""}></option>
											<option value="gray" style="background:gray;" ${dto.color=="gray"?"selected":""}></option>
											<option value="black" style="background:black;" ${dto.color=="black"?"selected":""}></option>
											
										</select>
									</div>
								</div>
							</td>
						</tr>
	
						<tr>
							<td class="bg-light col-2" scope="row">종일일정</td>
							<td class="py-3">
								<div class="row">
									<div class="col">
										<input type="checkbox" name="all_day" id="form-all_day" class="form-check-input" 
											 value="1" ${dto.all_day == 1 ? "checked ":"" } >
										<label class="form-check-label" for="form-all_day"> 하루종일</label>
									</div>
								</div>
							</td>
						</tr>
	
	 					<tr>
							<td class="bg-light col-2" scope="row">시작일자</td>
							<td>
								<div class="row">
									<div class="col-5 pe-0">
										<input type="date" name="startDate" id="form-startDate" class="form-control" value="${dto.startDate}">
									</div>
									<div class="col-3">
										<input type="time" name="startTime" id="form-startTime" class="form-control" value="${dto.startTime}"
											style="display: ${dto.all_day == 1 ? 'none;':'inline-block;'}">
									</div>
								</div>
								<small class="form-control-plaintext">* 시작날짜는 필수입니다.</small>
							</td>
						</tr>
	
	 					<tr>
							<td class="bg-light col-2" scope="row">종료일자</td>
							<td>
								<div class="row">
									<div class="col-5 pe-0">
										<input type="date" name="endDate" id="form-endDate" class="form-control" value="${dto.endDate}">
									</div>
									<div class="col-3">
										<input type="time" name="endTime" id="form-endTime" class="form-control" value="${dto.endTime}"
											style="display: ${dto.all_day==1 ? 'none;':'inline-block;'}">
									</div>
								</div>
								<small class="form-control-plaintext">종료일자는 선택사항이며, 시작일자보다 작을 수 없습니다.</small>
							</td>
						</tr>
						
						<tr>
							<td class="bg-light col-2" scope="row">일정반복</td>
							<td>
								<div class="row">
									<div class="col-5 pe-0">
										<select name="repeat" id="form-repeat" class="form-select">
											<option value="0" ${dto.repeat=="0"?"selected":""}>반복안함</option>
											<option value="1" ${dto.repeat=="1"?"selected":""}>년 반복</option>
										</select>
									</div>
									<div class="col-3">
										<input type="text" name="repeat_cycle" id="form-repeat_cycle" maxlength="2" class="form-control"
											style="display: ${dto.repeat==0 ? 'none;':'inline-block;'}"
											value="${dto.repeat_cycle}"
											placeholder="반복주기">
									</div>
								</div>
							</td>
						</tr>
	
						<tr>
							<td class="bg-light col-2" scope="row">메 모</td>
							<td>
								<textarea name="memo" id="form-memo" class="form-control" style="height: 90px;">${dto.memo}</textarea>
							</td>
						</tr>
					</table>
					
					<table class="table table-borderless">
	 					<tr>
							<td class="text-center">
								<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='update'?'수정완료':'일정등록'}&nbsp;<i class="bi bi-check2"></i></button>
								<button type="reset" class="btn btn-light">다시입력</button>
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/schedule/schedule?categoryIdx=${categoryIdx}';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
								<c:if test="${mode=='update'}">
									<input type="hidden" name="scheduleIdx" value="${dto.scheduleIdx}">
								</c:if>
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