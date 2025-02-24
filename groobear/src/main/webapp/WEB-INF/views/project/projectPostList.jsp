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
<jsp:include page="/WEB-INF/views/project/projectHeader2.jsp"/>

<main>
	
<div class="mainInner">
    <div class="board-container">
        <div class="board-title">
        	<span>프로젝트 게시판</span> 
        </div>
        
        <div class="row board-list-footer">
			<div class="col">
				<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/project/projectPostList/${projIdx}?${query}';" title="새로고침"><i class="bi bi-arrow-counterclockwise"></i></button>
			</div>
			<div class="col-6 text-center">
				<form class="row" name="searchForm">
					<div class="col-auto p-1">
						<select name="schType" class="form-select">
							<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
							<option value="userName" ${schType=="empName"?"selected":""}>작성자</option>
							<option value="reg_date" ${schType=="regDate"?"selected":""}>등록일</option>
							<option value="subject" ${schType=="title"?"selected":""}>제목</option>
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
			<div class="col text-end">
				<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/project/projectPostWrite';">글올리기</button>
			</div>
		</div>
        
        <table class="board-table">
            <thead>
                <tr>
                    <th width="50%">제목</th>
                    <th width="8%">작성자</th>
                    <th width="8%">작성날짜</th>
                    <th width="8%">수정날짜</th>
                    <th width="8%">첨부파일</th>
                    <th width="8%">댓글</th>
                </tr>
            </thead>
            <tbody>
                <tr data-hasfile="true" data-comments="5">
                    <td ><a class="table-board-title" href="#" class="item-title">게시글 제목 1</a></td>
                    <td>홍길동</td>
                    <td>2024-02-24</td>
                    <td>2024-02-25</td>
                    <td><i class="fas fa-paperclip file-icon"></i></td>
                    <td><i class="fas fa-comments"></i> <span class="comment-count">0</span></td>
                </tr>
                <tr data-hasfile="false" data-comments="2">
                    <td ><a class="table-board-title" href="#" class="item-title">게시글 제목 2</a></td>
                    <td>이몽룡</td>
                    <td>2024-02-22</td>
                    <td>2024-02-23</td>
                    <td><i class="fas fa-paperclip file-icon"></i></td>
                    <td><i class="fas fa-comments"></i> <span class="comment-count">0</span></td>
                </tr>
            </tbody>
		</table>
		
		
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