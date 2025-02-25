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

</head>
<body>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/layout/project/projectHeader4.jsp"/>

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
									<input type="text" name="title" class="form-control" value="">
								</td>
							</tr>
		        
							<tr>
								<td class="project-member">작성자명</td>
		 						<td>
									<p class="form-control-plaintext">작성자</p>
								</td>
							</tr>
		
							<tr>
								<td class="board-content">내 용</td>
								<td>
									<textarea name="content" id="ir1" class="form-control" style="width: 99%; height: 300px;">내용</textarea>
								</td>
							</tr>
							
							<tr>
								<td class="board-file">첨 부</td>
								<td>
									<input type="file" name="selectFile" class="form-control">
								</td>
							</tr>
							
							<c:if test="${mode == 'update'}">
								<tr>
									<td class="attached-file">첨부된파일</td>
									<td>
										<p class="form-control-plaintext">
											<c:if test="${not empty dto.saveFilename}">
												<a href="javascript:deleteFile('${dto.num}')"><i class="bi bi-trash"></i></a>
												${dto.originalFilename}
											</c:if>
											&nbsp;
										</p>
									</td>
								</tr>
							</c:if>
							
						</table>
						
						<table class="table table-borderless">
		 					<tr>
								<td class="text-center">
									<button type="button" class="btn btn-dark" onclick="submitContents(this.form);">${mode=="update" ? "수정완료" : "등록완료"}&nbsp;<i class="bi bi-check2"></i></button>
									<button type="reset" class="btn btn-light">다시입력</button>
									<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/project/projectPostList/${projIdx}';">${mode=="update" ? "수정취소" : "등록취소"}&nbsp;<i class="bi bi-x"></i></button>
									
									<c:if test="${mode == 'update' }">
										<input type="hidden" name="num" value="${dto.num}">
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
	</div>
</main>

<script type="text/javascript" src="${pageContext.request.contextPath}/dist/vendor/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: 'ir1',
	sSkinURI: '${pageContext.request.contextPath}/dist/vendor/se2/SmartEditor2Skin.html',
	fCreator: 'createSEditor2',
	fOnAppLoad: function(){
		// 로딩 완료 후
		oEditors.getById['ir1'].setDefaultFont('돋움', 12);
	},
});

function submitContents(elClickedObj) {
	 oEditors.getById['ir1'].exec('UPDATE_CONTENTS_FIELD', []);
	 try {
		if(! check()) {
			return;
		}
		
		elClickedObj.submit();
		
	} catch(e) {
	}
}
</script>

</body>
</html>