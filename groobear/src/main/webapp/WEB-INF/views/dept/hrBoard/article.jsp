<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/boot-board.css" type="text/css">
</head>

<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/deptHeader.jsp"/>
</header>
	
<main>
	<div class="container">
		<div class="body-container">	
			<div class="body-title">
				<h3><i class="bi bi-app"></i> 인사부 </h3>
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
							<td align="right">
								${dto.regDate}
							</td>
						</tr>
						
						<tr>
							<td colspan="2" valign="top" height="200" style="border-bottom: none;">
								${dto.content}
							</td>
						</tr>
						
							<tr>
								<td colspan="2">
									<c:forEach var="dto" items="${listFile}" varStatus="status">
										<p class="border text-secondary my-1 p-2">
											<i class="bi bi-folder2-open"></i>
											<a href="${pageContext.request.contextPath}/dept/hrBoard/download?fileIdx=${dto.fileIdx}" class="text-reset">${dto.originalFilename}</a>
										</p>	
									</c:forEach>
								</td>
							</tr>

						<tr>
							<td colspan="2">
								이전글 :
								<c:if test="${not empty prevDto}">
									<a href="${pageContext.request.contextPath}/dept/hrBoard/article?${query}&postIdx=${prevDto.postIdx}">${prevDto.title}</a>
								</c:if>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								다음글 :
								<c:if test="${not empty nextDto}">
									<a href="${pageContext.request.contextPath}/dept/hrBoard/article?${query}&postIdx=${nextDto.postIdx}">${nextDto.title}</a>
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>
				
				<table class="table table-borderless mb-2">
					<tr>
						<td width="50%">
							<c:choose>
								<c:when test="${sessionScope.member.empIdx == dto.empIdx}">
									<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/dept/hrBoard/update?postIdx=${dto.postIdx}&page=${page}';">수정</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-light" disabled>수정</button>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${sessionScope.member.empIdx == dto.empIdx}">
				    				<button type="button" class="btn btn-light" onclick="deleteOk();">삭제</button>
								</c:when>
								<c:otherwise>
				    				<button type="button" class="btn btn-light" disabled>삭제</button>
								</c:otherwise>
							</c:choose>
						</td>
						<td class="text-end">
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/dept/hrBoard/list?${query}';">리스트</button>
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
</main>

<c:if test="${sessionScope.member.empIdx==dto.empIdx}">
	<script type="text/javascript">
		function deleteOk() {
			let qs = 'postIdx=${dto.postIdx}&${query}';
			let url = '${pageContext.request.contextPath}/dept/hrBoard/delete?' + query;
				if(confirm('게시글을 삭제 하시겠습니까 ? ')) {	
				location.href = url;
			}
		}
	</script>
</c:if>

<script type="text/javascript">
// 댓글 --
$(function(){
	listPage(1);
});

// 댓글 리스트
function listPage(page) {
	let url = '${pageContext.request.contextPath}/dept/hrBoard/listReply';
	let postIdx = '${dto.postIdx}';
	let params = {postIdx:postIdx, pageNo:page};
	
	const fn = function(data) {
		$('#listReply').html(data);
	};
	
	ajaxRequest(url, 'get', params, 'text', fn);
}

// 댓글 삭제
$(function(){
	$('.reply').on('click', '.deleteReply', function(){
		if(! confirm('게시글을 삭제하시겠습니까 ? ')) {
			return false;
		}
		
		let cmtIdx = $(this).attr('data-cmtIdx');
		let page = $(this).attr('data-pageNo');
		
		let url = '${pageContext.request.contextPath}/dept/hrBoard/deleteReply';
		let params = {cmtIdx:cmtIdx, mode:'reply'};
		
		const fn = function(data) {
			listPage(page);
		};
		
		ajaxRequest(url, 'post', params, 'json', fn);
	});
});
</script>

<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

	<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
	
</body>
</html>