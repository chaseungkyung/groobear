<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/board.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/boot-board.css" type="text/css">

<script type="text/javascript">
 function sendOk() {
    const f = document.boardForm;
    let str;
	
    str = f.title.value.trim();
    if( !str ) {
        alert('제목을 입력하세요. ');
        f.title.focus();
        return;
    }

    str = f.content.value.trim();
    if( !str ) {
        alert('내용을 입력하세요. ');
        f.content.focus();
        return;
    }

    f.action = '${pageContext.request.contextPath}/dept/hrBoard/${mode}';
    f.submit();
} 
</script>
<style type="text/css">
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
</head>

<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/deptHeader.jsp"/>
</header>

<main>
	<div class="mainInner">
		<div class="body-container">	
			<div class="body-title">
				<h3><i class="bi bi-app"></i> 인사부 </h3>
			</div>
			
			<div class="body-main">

				<form name="boardForm" method="post" enctype="multipart/form-data">
					<table class="table mt-5 write-form">
						<tr>
							<td class="bg-light col-sm-2" scope="row">제 목</td>
							<td>
								<input type="text" name="title" maxlength="100" class="form-control" value="${dto.title}">
							</td>
						</tr>
	        
						<tr>
							<td class="bg-light col-sm-2" scope="row">작성자명</td>
	 						<td>
								<p class="form-control-plaintext">${sessionScope.member.empName}</p>
							</td>
						</tr>
	
						<tr>
							<td class="bg-light col-sm-2" scope="row">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
							<td>
								<textarea name="content" class="form-control">${dto.content}</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="bg-light col-sm-2" scope="row">첨 부</td>
							<td>
								<input type="file" name="selectFile" class="form-control" multiple>
							</td>
						</tr>
						
						<c:if test="${mode=='update'}">
							<c:forEach var="dto" items="${listFile}">
								<tr> 
									<td class="bg-light col-sm-2">첨부된 파일</td>
									<td>
										<p class="form-control-plaintext">
											<span class="delete-file" data-fileIdx="${dto.fileIdx}"><i class="bi bi-trash"></i></span> 
											${dto.originalFilename}
										</p>
									</td>
								  </tr>
							</c:forEach>
						</c:if>
						
					</table>
					
					<table class="table table-borderless">
	 					<tr>
							<td class="text-center">
								<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=="update" ? "수정완료" : "등록완료"}&nbsp;<i class="bi bi-check2"></i></button>
								<button type="reset" class="btn btn-light">다시입력</button>
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/dept/hrBoard/list';">${mode=="update" ? "수정취소" : "등록취소"}&nbsp;<i class="bi bi-x"></i></button>
								
								<c:if test="${mode == 'update' }">
									<input type="hidden" name="postIdx" value="${dto.postIdx}">
									<input type="hidden" name="saveFilename" value="${dto.saveFilename}">								
									<input type="hidden" name="originalFilename" value="${dto.originalFilename}">								
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

<c:if test="${mode=='update'}">
	<script type="text/javascript">
		$('.delete-file').click(function(){
			if(! confirm('선택한 파일을 삭제 하시겠습니까 ? ')) {
				return false;
			}
			
			let $tr = $(this).closest('tr');
			let fileIdx = $(this).attr('data-fileIdx');
			let url = '${pageContext.request.contextPath}/dept/hrBoard/deleteFile';
			
			$.ajaxSetup({ beforeSend: function(e) { e.setRequestHeader('AJAX', true); } });
			$.post(url, {fileIdx:fileIdx}, function(data){
				$($tr).remove();
			}, 'json').fail(function(jqXHR){
				console.log(jqXHR.responseText);
			});
		});
	</script>
</c:if>

<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>

</body>
</html>