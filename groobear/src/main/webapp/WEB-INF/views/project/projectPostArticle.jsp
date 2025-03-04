<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/project/projectPostArticle.css" type="text/css">

</head>
<body>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
<jsp:include page="/WEB-INF/views/layout/project/projectHeader2.jsp"/>

<main>

<div class="mainInner">
	<div class="container">
		<div class="body-container">	
			<div class="body-title">
				<h3> 게시판 </h3>
			</div>
			
			<div class="body-main">

				<table class="table board-article">
					<thead>
						<tr>
							<td colspan="2" align="center">
								${dto.title}
							</td>
						</tr>
					</thead>
					
					<tbody>
						<tr>
							<td width="50%">
								이름 : ${dto.empName}
							</td>
						</tr>
						
						<tr>
							<td colspan="2" valign="top" height="200" style="border-bottom: none;">
								${dto.content}
							</td>
						</tr>

						<tr>
							<td colspan="2">
								<c:if test="${not empty dto.saveFilename}">
									<p class="border text-secondary my-1 p-2">
										<i class="bi bi-folder2-open"></i>
										<a href="#">${dto.originalFilename}</a>
									</p>
								</c:if>
							</td>
						</tr>

						<tr>
							<td colspan="2">
								이전글 : 
								<c:if test="${not empty prevDto}">
									<a href="#">${prevDto.subject}</a>
								</c:if>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								다음글 : 
								<c:if test="${not empty nextDto}">
									<a href="#">${nextDto.subject}</a>
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>
				
				<table class="table table-borderless mb-2">
					<tr>
						<td width="50%">
									<button type="button" class="btn btn-light" >수정</button>
								
									<button type="button" class="btn btn-light" disabled>수정</button>
							
							
							
				    				<button type="button" class="btn btn-light" onclick="deleteOk();">삭제</button>
								
				    				<button type="button" class="btn btn-light" disabled>삭제</button>
							
						</td>
						<td class="text-end">
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/project/post/list/${projIdx}?postPage=${postPage}';">리스트</button>
						</td>
					</tr>
				</table>

				<div class="reply">
					<form name="replyForm" method="post">
						<div class="form-header">
							<span class="bold">댓글</span>
						</div>
						
						<table class="table table-borderless reply-form">
							<tr>
								<td>
									<textarea class="form-control" name="content"></textarea>
								</td>
							</tr>
							<tr>
							   <td align="right">
									<button type="button" class="btn btn-light btnSendReply">댓글 등록</button>
								</td>
							 </tr>
						</table>
					</form>
					
					<div id="listReply"></div>
				</div>

			</div>
		</div>
	</div>
</div>

</main>

</body>
</html>