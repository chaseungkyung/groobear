<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/board/board.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/boot-board.css" type="text/css">

<style type="text/css">
	.item {cursor: pointer; }
	.item img { display: block; width: 100%; height: 200px; border-radius: 5px; }
	.item img:hover { scale: 100.7%; }
	.item .item-title {
		font-size: 14px;
		font-weight: 500;
		padding: 10px 2px 0;
		
		width: 175px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/deptHeader.jsp"/>
		
	<main>
		<div class="mainInner">
			<div class="body-container">	
				<div class="body-title">
					<h3><i class="bi bi-image"></i> 동호회 게시판</h3>
				</div>
				
				<div class="body-main">
	
			        <div class="row board-list-header">
			            <div class="col-auto me-auto">
			            	${dataCount}개(${page}/${total_page} 페이지)
			            </div>
			            <div class="col-auto">&nbsp;</div>
			        </div>				
					
					<div class="row row-cols-4 px-1 py-1 g-2">
						<c:forEach var="dto" items="${list}" varStatus="status">
							<div>
								<div class="col border rounded p-1 item"
										onclick="location.href='${articleUrl}&num=${dto.num}';">
									<img src="${pageContext.request.contextPath}/uploads/photo/${dto.imageFilename}">
									<p class="item-title">${dto.subject}</p>
								</div>
							</div>
						</c:forEach>
					</div>			 
					
					<div class="page-navigation">
						${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
					</div>
		
					<div class="row board-list-footer">
						<div class="col">
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/photo/list';" title="새로고침"><i class="bi bi-arrow-counterclockwise"></i></button>
						</div>
						<div class="col-6 text-center">
							<form class="row" name="searchForm">
								<div class="col-auto p-1">
									<select name="schType" class="form-select">
										<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
										<option value="userName" ${schType=="empName"?"selected":""}>작성자</option>
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
						<div class="col text-end">
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/club/write';">글올리기</button>
						</div>
					</div>
	
				</div>
			</div>
		</div>
	</main>
	
	<script type="text/javascript">
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
		
		let url = '${pageContext.request.contextPath}/photo/list';
		location.href = url + '?' + requestParams;
	}
	</script>
</body>
</html>