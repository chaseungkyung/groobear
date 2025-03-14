﻿<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/board.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/boot-board.css" type="text/css">

<style type="text/css">
.write-form .img-viewer {
	cursor: pointer;
	border: 1px solid #ccc;
	width: 45px;
	height: 45px;
	border-radius: 45px;
	background-image: url("${pageContext.request.contextPath}/dist/images/add_photo.png");
	position: relative;
	z-index: 9999;
	background-repeat : no-repeat;
	background-size : cover;
}
.body-title {
    color: #424951;
    padding-top: 0.69vw;
    padding-bottom: 0.35vw;
    margin: 0 0 1.74vw 0;
    border-bottom: 0.07vw solid #ddd;
}
.body-title h3 {
    font-size: 1.30vw;
    min-width: 20.83vw;
    font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
    font-weight: bold;
    margin: 0 0 -0.35vw 0;
    padding-bottom: 0.35vw;
    display: inline-block;
    border-bottom: 0.21vw solid #424951;
}
</style>

<script type="text/javascript">
function sendOk() {
    const f = document.photoForm;
	let str;
	
    str = f.subject.value.trim();
    if(!str) {
        alert('제목을 입력하세요. ');
        f.subject.focus();
        return;
    }

    str = f.content.value.trim();
    if(!str) {
        alert('내용을 입력하세요. ');
        f.content.focus();
        return;
    }
    
    let mode = '${mode}';
    if( (mode === 'write') && (!f.selectFile.value) ) {
        alert('이미지 파일을 추가 하세요. ');
        f.selectFile.focus();
        return;
	}    

    f.action = '${pageContext.request.contextPath}/club/${mode}';
    f.submit();
}
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/deptHeader.jsp"/>
	
<main>
	<div class="container">
		<div class="body-container">	
			<div class="body-title">
				<h3><i class="bi bi-image"></i> 동호회 게시판 </h3>
			</div>
			
			<div class="body-main">

				<form name="photoForm" method="post" enctype="multipart/form-data">
					<table class="table mt-5 write-form">
						<tr>
							<td class="bg-light col-sm-2" scope="row">제 목</td>
							<td>
								<input type="text" name="subject" maxlength="100" class="form-control" value="${dto.subject}">
							</td>
						</tr>
						
						<tr>
							<td class="bg-light col-sm-2" scope="row">작성자명</td>
	 						<td>
								<p class="form-control-plaintext">${sessionScope.member.empName}</p>
							</td>
						</tr>
	
						<tr>
							<td class="bg-light col-sm-2" scope="row">내 용</td>
							<td>
								<textarea name="content" class="form-control">${dto.content}</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="bg-light col-sm-2" scope="row">이미지</td>
							<td>
								<div class="img-viewer"></div>
								<input type="file" name="selectFile" accept="image/*" class="form-control" style="display: none;">
							</td>
						</tr>
	
					</table>
					
					<table class="table table-borderless">
	 					<tr>
							<td class="text-center">
								<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='update'?'수정완료':'등록완료'}&nbsp;<i class="bi bi-check2"></i></button>
								<button type="reset" class="btn btn-light">다시입력</button>
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/club/list';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
								<c:if test="${mode=='update'}">
									<input type="hidden" name="num" value="${dto.num}">
									<input type="hidden" name="imageFilename" value="${dto.imageFilename}">
									<input type="hidden" name="page" value="${page}">
								</c:if>
							</td>
						</tr>
					</table>
				</form>

			</div>
		</div>
	</div>
</main>

<script type="text/javascript">
	window.addEventListener('load', ev => {
		let img = '${dto.imageFilename}';
		
		const viewerEL = document.querySelector('.write-form .img-viewer');
		const inputEL = document.querySelector('form[name=photoForm] input[name=selectFile]');
		
		if( img ) { // 수정인 경우
			img = '${pageContext.request.contextPath}/uploads/photo/' + img;
			viewerEL.textContent = '';
			viewerEL.style.backgroundImage = 'url(' + img + ')';
		}
		
		viewerEL.addEventListener('click', ev => {
			inputEL.click();
		});
		
		inputEL.addEventListener('change', ev => {
			let file = ev.target.files[0];
			if(! file) {
				viewerEL.textContent = '';
				if( img ) {
					img = '${pageContext.request.contextPath}/uploads/photo/' + img;
				} else {
					img = '${pageContext.request.contextPath}/dist/images/add_photo.png';
				}
				viewerEL.style.backgroundImage = 'url(' + img + ')';
				
				return;
			}
			
			if(! file.type.match('image.*')) {
				inputEL.focus();
				return;
			}
			
			var reader = new FileReader();
			reader.onload = function(e) {
				viewerEL.textContent = '';
				viewerEL.style.backgroundImage = 'url(' + e.target.result + ')';
			}
			reader.readAsDataURL(file);			
		});
	});
</script>

<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>