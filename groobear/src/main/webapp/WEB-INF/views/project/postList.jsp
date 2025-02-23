<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/project/postList.css" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
	
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
<jsp:include page="/WEB-INF/views/layout/projectHeader2.jsp"/>

<main>
	
<div class="mainInner">
    <div class="board-container">
        <div class="board-title">프로젝트 게시판</div>
        <table class="board-table">
            <thead>
                <tr>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성날짜</th>
                    <th>수정날짜</th>
                    <th>첨부파일</th>
                    <th>댓글</th>
                </tr>
            </thead>
            <tbody>
                <tr data-hasfile="true" data-comments="5">
                    <td><a href="#" class="item-title">게시글 제목 1</a></td>
                    <td>홍길동</td>
                    <td>2024-02-24</td>
                    <td>2024-02-25</td>
                    <td><i class="fas fa-paperclip file-icon"></i></td>
                    <td><i class="fas fa-comments"></i> <span class="comment-count">0</span></td>
                </tr>
                <tr data-hasfile="false" data-comments="2">
                    <td><a href="#" class="item-title">게시글 제목 2</a></td>
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