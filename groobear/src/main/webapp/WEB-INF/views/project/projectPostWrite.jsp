<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<jsp:include page="/WEB-INF/views/layout/project/headerResources.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/project/projectPostWrite.css" type="text/css">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

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

    f.action = '${pageContext.request.contextPath}/project/post/${mode}/${projIdx}';
    f.submit();
} 
</script>

</head>
<body>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/layout/project/projectHeader2.jsp"/>

<main>
	<div class="mainInner">
		<div class="container">
			<div class="body-container">	
				<div class="body-title">
					<h3>프로젝트 게시판 </h3>
				</div>
				
				<div class="body-main">
	
					<form name="boardForm" method="post" enctype="multipart/form-data">
						<table class="table write-form">
							<tr class="board-title-tr">
								<td class="board-title">제 목</td>
								<td>
									<input type="text" name="title" class="form-control" value="${dto.title}">
								</td>
							</tr>
		        
							<tr>
								<td class="project-member">작성자명</td>
		 						<td>
									<p class="form-control-plaintext">${sessionScope.member.empName}</p>
								</td>
							</tr>
		
							<tr>
								<td class="board-content">내 용</td>
								<td>
									<textarea name="content" id="ir1" class="form-control" style="width: 99%; height: 300px;">${dto.content}</textarea>
								</td>
							</tr>
							
							<tr>
								<td class="board-file">첨 부</td>
								<td>
									<input type="file" name="selectFile" class="form-control">
								</td>
							</tr>
							
							<c:if test="${mode == 'update'}">
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
									<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/project/post/list/${projIdx}';">${mode=="update" ? "수정취소" : "등록취소"}&nbsp;<i class="bi bi-x"></i></button>
									
									<c:if test="${mode == 'update' }">
										<input type="hidden" name="postIdx" value="${dto.postIdx}">
										<input type="hidden" name="saveFilename" value="${dto.saveFilename}">								
										<input type="hidden" name="originalFilename" value="${dto.originalFilename}">								
										<input type="hidden" name="postPage" value="${postPage}">								
									</c:if>
								</td>
							</tr>
						</table>
					</form>
	
				</div>
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
			let url = '${pageContext.request.contextPath}/project/post/deleteFile';
			
			$.ajaxSetup({ beforeSend: function(e) { e.setRequestHeader('AJAX', true); } });
			$.post(url, {fileIdx:fileIdx}, function(data){
				$($tr).remove();
			}, 'json').fail(function(jqXHR){
				console.log(jqXHR.responseText);
			});
		});
	</script>
</c:if>

</body>
</html>