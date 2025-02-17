<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/project/list.css" type="text/css">
	<style type="text/css">
		main ul li a {display: block; width: 100%; white-space: nowrap; overflow: hidden; text-overflow : ellipsis;}
		main ul li a:hover {text-decoration: underline;}
		
		main ul li:nth-child(1) {width: 5%;}
		main ul li:nth-child(2) {width: 50%;}
		main ul li:nth-child(3) {width: 10%;}
		main ul li:nth-child(4) {width: 10%;}
		main ul li:nth-child(5) {width: 15%;}
		main ul li:nth-child(6) {width: 10%;}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/projectHeader.jsp"/>
	
	<main>
		<div class="mainInner">
			<ul>
				<li>No</li>
				<li>프로젝트</li>
				<li>시작일</li>
				<li>종료일</li>
				<li>프로젝트 매니저</li>
				<li>등록일</li>
			</ul>
			
			<c:forEach var="dto" items="${listProject}" varStatus="status">
				<ul>
					<li>${dataCount - (page - 1) * size - status.index}</li>
					<li>
						<a href="${detailUrl}/${dto.projIdx}?${query}">${dto.projName}</a>
						<button type="button" class="btnProjectSet"> : </button>
						
					</li>
					<li>${dto.startDate}</li>
					<li>${dto.endDate}</li>
					<li>${dto.empName}</li>
					<li>${dto.createdAt}</li>
				</ul>
			</c:forEach>
			
			<div class="page-navigation">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>
			
			<div class="search-container">							
				<input type="text" name="" value="" class="form-control" placeholder="프로젝트 이름으로 검색하세요.">
				<button type="button" class="btn btn-light" onclick="searchList()">
					<i class="bi bi-search"></i> 
				</button>		
			</div>		
				
		</div>
	</main>

</body>
</html>