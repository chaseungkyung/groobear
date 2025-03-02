<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
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
	<div class="innerMain">
		<div class="body-container">
			<div class="body-title">
			</div>
			
			<div class="body-main">
				
				<div class="row-board-list-header">
					<div class="col-auto me-auto dataCount">
						${dataCount}개(${page}/${total_page} 페이지)
					</div>
					<div class="col-auto">&nbsp;</div>
				</div>
				
				<table class="table table-hover board-list">
					<thead class="table-list">
						<tr>
							<th width="60">번호</th>
							<th>제목</th>
							<th width="100">작성자</th>
							<th width="100">작성일</th>
							<th width="50">표시</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="dto" items="${noticeList}">
							<tr>
								<td><span class="badge bg-primary">공지</span></td>
								<td class="left">
									<div class="text-wrap"><a href="${articleUrl}&noticeIdx=$${dto.noticeIdx}">${dto.title}</a></div>
								</td>
								<td>${dto.empName}</td>
								<td>${dto.regDate}</td>
								<td>
									<c:if test="${dto.fileCount != 0}"> 
										<a href="${pageContext.request.contextPath}/notice/zipdownload?noticeIdx=" ${dto.noticeIdx} class="text-reset"><i class="bi bi-file-arrow-down"></i></a>									
									</c:if>
								</td>
								<td>&nbsp;</td>
							</tr>
						</c:forEach>
					
						<c:forEach var="dto" items="${list}" varStatus="status">
							<tr>
								<td ${dataCount - (page-1) * size - status.index}></td>
								<td class="left">
									<div class="text-wrap">
									<a href="${articleUrl}&postIdx=${dto.noticeIdx}" class="text-reset">${dto.title}</a>
									</div>
									<c:if test="${dto.gap < 10}">
										<span class="badge bg-danger">N</span>
									</c:if>
									<c:if test="${dto.replyCount != 0}">(${dto.replyCount})</c:if>
								</td>
								<td>${dto.empName}</td>
								<td>${dto.regDate}</td>
								<td></td>
							</tr>						
						</c:forEach>
					</tbody>
				</table>
				
				<div class="page-navigation">
					${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
				</div>
				
				<div class="row board-list-footer">
					<div class="col">
						<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/dept/hrBoard/list';" title="새로고침">
						<i class="bi bi-arrow-counterclockwise"></i></button>
					</div>
					<div class="col-6 text-center">
						<form class="row" name="searchForm">
							<div class="col-auto p-1">
								<select name="schType" class="form-select">
									<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
									<option value="empName" ${schType=="empName"?"selected":""}>작성자</option>
									<option value="regDate" ${schType=="regDate"?"selected":""}>등록일</option>
									<option value="title" ${schType=="title"?"selected":""}>제목</option>
									<option value="content" ${schType=="content"?"selected":""}>내용</option>
								</select>
							</div>
							<div class="col-auto p-1">
								<input type="text" name="kwd" value="${kwd}" class="form-control">
							</div>
							<div class="col-auto p-1">
								<button type="button" class="btn btn-light" onclick="searchList()"><i class="bi bi-search"></i></button>
							</div>
						</form>
					</div>	
					
					<div>
						<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/notice/write';">글올리기</button>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</main>	

<script type="text/javascript">
// 검색 키워드 입력란에서 엔터를 누른 경우 서버 전송 막기 
window.addEventListener('load', () => {
	const inputEL = document.querySelector('form input[name=kwd]'); 
	inputEL.addEventListener('keydown', function (evt) {
	    if(evt.key === 'Enter') {
	    	evt.preventDefault();
	    	
	    	searchList();
	    }
	});
});

function searchList() {
	const f = document.searchForm;
	if(! f.kwd.value.trim()) {
		return;
	}
	
	const formData = new FormData(f);
	let requestParams = new URLSearchParams(formData).toString();
	
	let url = '${pageContext.request.contextPath}/notice/list';
	location.href = url + '?' + requestParams;
}
</script>

<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

	<jsp:include page="/WEB-INF/views/layout/footerResources.jsp"/>
	
</body>
</html>