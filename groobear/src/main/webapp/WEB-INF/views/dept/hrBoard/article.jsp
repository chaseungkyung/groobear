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
						
						<c:if test="${listFile.size() != 0}">
							<tr>
								<td colspan="2">
									<p class="border text-secondary my-1 p-2">
										<i class="bi bi-folder2-open"></i>
										<c:forEach var="dto" items="${listFile}" varStatus="status">
											<a href="${pageContext.request.contextPath}/dept/hrBoard/download?fileIdx=${dto.fileIdx}" class="text-reset">${dto.originalFilename}</a>
											<c:if test="${not status.last}"> | </c:if>
										</c:forEach>
									</p>
									<p class="border text-secondary mb-1 p-2">
										<i class="bi bi-folder2-open"></i>
										<a href="${pageContext.request.contextPath}/dept/hrBoard/zipdownload?postIdx=${dto.postIdx}" class="text-reset" title="압축 다운로드">파일 전체 압축 다운로드(zip)</a>
									</p>	
								</td>
							</tr>
						</c:if>						
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

<c:if test="${sessionScope.member.empIdx == dto.empIdx}">
	<script type="text/javascript">
		function deleteOk() {
			if(confirm('게시글을 삭제 하시겠습니까 ? ')) {	
				let query = 'postIdx=${dto.postIdx}&${query}';
				let url = '${pageContext.request.contextPath}/dept/hrBoard/delete?' + query;
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
// 댓글 추가
$(function(){
	$('.btnSendReply').click(function(){
		let postIdx = '${dto.postIdx}';
		const $tb = $(this).closest('table');
		
		let content = $tb.find('textarea').val().trim();
		if(! content) {
			$tb.find('textarea').focus();
			return false;
		}
		
		let url = '${pageContext.request.contextPath}/dept/hrBoard/insertReply';
		let params = {postIdx:postIdx, content:content};
		
		const fn = function(data) {
			$tb.find('textarea').val(' ');
			
			let state = data.state;
			if(state === 'true') {
				listPage(1);
			} else {
				alert('댓글 등록 실패');
			}
		};
		
		ajaxRequest(url, 'post', params, 'json', fn);
		
	});
});

// 삭제 메뉴
$(function(){
	$('.reply').on('click', '.reply-dropdown', function(){
		const $menu = $(this).next('.reply-menu');
		
		if($menu.is(':visible')) {
			$menu.fadeOut(100);
		} else {
			$('.reply-menu').hide();
			$menu.fadeIn(100);
		
			let pos = $(this).offset();
			$menu.offset({left:pos.left-70, top:pos.top+20});
		}
	});
	
	$('.reply').on('click', function(evt) {
		if($(evt.target.parentNode).hasClass('reply-dropdown')) {
			return false;
		}
		
		$('.reply-menu').hide();
	});
});

// 댓글 삭제
$(function(){
	$('.reply').on('click', '.deleteReply', function(){
		if(! confirm('댓글을 삭제하겠습니까 ? ')) {
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