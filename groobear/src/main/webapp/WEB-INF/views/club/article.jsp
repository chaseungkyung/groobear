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
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/board.css" type="text/css">
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
				<h3><i class="bi bi-image"></i> 동호회 게시판 </h3>
			</div>
			
			<div class="body-main">

				<table class="table board-article">
					<thead>
						<tr>
							<td colspan="2" align="center">
								${dto.subject}
							</td>
						</tr>
					</thead>
					
					<tbody>
						<tr>
							<td width="50%">
								작성자 : ${dto.empName}						
							</td>
							<td align="right">
								${dto.reg_date}
							</td>
						</tr>
	
						<tr>
							<td colspan="2" style="border-bottom: none; text-align: center;">
								<img src="${pageContext.request.contextPath}/uploads/photo/${dto.imageFilename}" 
									class="img-fluid img-thumbnail mw-100 h-auto">
							</td>
						</tr>
												
						<tr>
							<td colspan="2">
								${dto.content}
							</td>
						</tr>
						
						<tr>
							<td colspan="2">
								이전글 :
								<c:if test="${not empty prevDto}">
									<a href="${pageContext.request.contextPath}/club/article?${query}&num=${prevDto.num}">${prevDto.subject}</a>
								</c:if>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								다음글 :
								<c:if test="${not empty nextDto}">
									<a href="${pageContext.request.contextPath}/club/article?${query}&num=${nextDto.num}">${nextDto.subject}</a>
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>
				
				<table class="table table-borderless">
					<tr>
						<td width="50%">
							<c:choose>
								<c:when test="${sessionScope.member.empCode == dto.empCode}">
									<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/club/update?num=${dto.num}&page=${page}';">수정</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-light" disabled>수정</button>
								</c:otherwise>
							</c:choose>
					    	
							<c:choose>
					    		<c:when test="${sessionScope.member.empCode == dto.empCode}">
					    			<button type="button" class="btn btn-light" onclick="deleteOk();">삭제</button>
					    		</c:when>
					    		<c:otherwise>
					    			<button type="button" class="btn btn-light" disabled>삭제</button>
					    		</c:otherwise>
					    	</c:choose>
						</td>
						<td class="text-end">
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/club/list?${query}';">리스트</button>
						</td>
					</tr>
				</table>

			</div>
		</div>
	</div>
</main>

<c:if test="${sessionScope.member.empCode==dto.empCode}">
	<script type="text/javascript">
		function deleteOk() {
			let query = 'num=${dto.num}&${query}&imageFilename=${dto.imageFilename}';
		    let url = '${pageContext.request.contextPath}/club/delete?' + query;
		
		    if(confirm('위 자료를 삭제 하시 겠습니까 ? ')) {
		  	  location.href = url;
		    }
		}
	</script>
</c:if>

<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
</body>
</html>