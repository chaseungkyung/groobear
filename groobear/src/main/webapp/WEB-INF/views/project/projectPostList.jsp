<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/project/projectPostList.css" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
	
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/boot-board.css" type="text/css">

</head>
<body>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
<jsp:include page="/WEB-INF/views/layout/project/projectHeader2.jsp"/>

<main>
	
<div class="mainInner">
	<div class="board-title">
		<span>프로젝트 게시판</span> 
	</div> 
	
	<div class="button-container">
		<div class="reset-btn">
		    <button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/project/post/list/${projIdx}';" title="새로고침">
		        <i class="bi bi-arrow-counterclockwise"></i>
		    </button>
	    </div>
	    <div class="post-btn">
	    	<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/project/post/write/${projIdx}';">글올리기</button>
		</div>
	</div>

	<div class="listArea">
		<ul>
			<li>제목</li>
			<li>작성자</li>
			<li>작성날짜</li>
			<li>수정날짜</li>
			<li>첨부파일</li>
			<li>댓글</li>			
		</ul>
		
		<c:forEach var="dto" items="${list}">
			<ul>
				<li>
					<a href="${articleUrl}&postIdx=${dto.postIdx}" class="text-reset">${dto.title}</a>
				</li>
				<li class="board-author">${dto.empName}</li>
				<li>${dto.regDate}</li>
				<li>${dto.updateDate}</li>
				<li><i class="fas fa-paperclip file-icon"></i></li>
				<li><i class="fas fa-comments"></i> <span class="comment-count">0</span></li>			
			</ul>
		</c:forEach>
			
			<ul>
				<li>게시글 제목2</li>
				<li class="board-author">박민우</li>
				<li>2025-02-20</li>
				<li>-</li>
				<li><i class="fas fa-paperclip file-icon"></i></li>
				<li><i class="fas fa-comments"></i> <span class="comment-count">0</span></li>			
			</ul>		
		</div>
	
	<div class="page-navigation">
		${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
	</div>
	
	<div class="row board-list-footer">
		
		<div class="searchArea">
			<form class="row" name="searchForm" style="justify-content: center;">
				
				<div class="col-auto p-1">
					<select name="schType" class="form-select" >
						<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
						<option value="userName" ${schType=="userName"?"selected":""}>작성자</option>
						<option value="reg_date" ${schType=="reg_date"?"selected":""}>등록일</option>
						<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
						<option value="content" ${schType=="content"?"selected":""}>내용</option>
					</select>
				</div>
				<div class="col-auto p-1">
					<input type="text" name="kwd" value="${kwd}" class="form-control">
				</div>
				<div class="col-auto p-1">
					<button type="button" class="btn btn-light" onclick="searchList()"> <i class="bi bi-search"></i> </button>
				</div>
			</form>
		</div>
		
	</div>

</div>

</main>

<script type="text/javascript">
$(document).ready(function() {
    $(".board-item").each(function() {
        let hasFile = $(this).data("hasfile");
        let comments = $(this).data("comments");

        if (hasFile) {
            $(this).find(".file-icon").show();
        }
        $(this).find(".comment-count").text(comments);
    });
});
</script>

</body>
</html>