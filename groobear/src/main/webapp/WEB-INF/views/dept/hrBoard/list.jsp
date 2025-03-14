<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/board/board.css" type="text/css">
	
<style type="text/css">
    .board-list th, .board-list td {
        border-top: 1px solid rgba(33, 37, 41, 0.1); /* 연한 검정색 */
        border-bottom: 1px solid rgba(33, 37, 41, 0.1); /* 연한 검정색 */
    }
    
     /* <th>의 글자를 진하게 */
    .board-list th {
        font-weight: 600; /* 굵기 조정 */
        color: rgba(33, 37, 41, 0.8); /* 글자 색을 약간 진하게 */
    }

.text-wrap {
	display: inline-flex;
	max-width: 500px;
	> a {
		flex: 1;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
}

</style>

</head>

<body>

	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/deptHeader.jsp"/>
	
	
	<main>
		<div class="container">
			<div class="body-container">
				<div class="body-title">
						<h3><i class="bi bi-app"></i> 인사부 </h3>
				</div>
				
				<div class="body-main">
					
					<div class="row board-list-header">
						<div class="col-auto me-auto dataCount">
						</div>
						<div class="col-auto">&nbsp;</div>
					</div>
					
					<table class="table table-hover board-list">
						<thead class="table-light">
							<tr>
								<th></th>
								<th class="title">제목</th>
								<th width="120">작성자</th>
								<th width="120">작성일</th>
							</tr>
						</thead>
						
						<tbody>
							<c:forEach var="dto" items="${list}" varStatus="status">
								<tr>
									<td ${dataCount - (page-1) * size - status.index}></td>
									<td class="left">
										<div class="text-wrap">
											<a href="${articleUrl}&postIdx=${dto.postIdx}" class="text-reset">${dto.title}</a>
										</div>
										<c:if test="${dto.replyCount != 0}"> (${dto.replyCount})</c:if>
									</td>
									<td>${dto.empName}</td>
									<td>${dto.regDate}</td>
							
								</tr>						
							</c:forEach>
						</tbody>
					</table>
					
					<div class="page-navigation">
						${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
					</div>
					
					<div class="row board-list-footer">
						<div class="col" style="margin-left: 0;">
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/dept/hrBoard/list';" title="새로고침"><i class="bi bi-arrow-counterclockwise"></i></button>
						</div>
						<div class="col-6 text-center" style="margin-left: 500px; margin-bottom:20px;">
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
						
						<div class="col text-end">
							<!--  
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/dept/hrBoard/write';">글올리기</button>
							-->
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
		
		let url = '${pageContext.request.contextPath}/dept/hrBoard/list';
		location.href = url + '?' + requestParams;
	}
	</script>

</body>
</html>