<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">
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
			<ul>
				<li>1</li>
				<li><a href="${pageContext.request.contextPath}/project/article">[국가]한국 교육 학술정보원 2025년~2026년 국립대학지원미ㅏ너ㅣ아러ㅣㅏ너ㅣ아ㅓ니ㅏㅓ리ㅏㅓㅣㅏ너ㅁ니ㅏ어리ㅏㅓ니아ㅓㅣ라ㅣ나어리ㅏ너이러니아ㅓ린어리ㅏㄴ이러ㅣ나어리ㅏ</a></li>
				<li>2025-01-15</li>
				<li>2025-04-15</li>
				<li>[개발 1팀] 홍길동 부장</li>
				<li>2025-01-23</li>
			</ul>
			
			<c:forEach var="dto" items="${listProject}" varStatus="status">
				<ul>
					<li>${dataCount - (page - 1) * size - status.index}</li>
					<li><a href="${articleUrl}/${dto.projIdx}?${query}">${dto.projName}</a></li>
					<li>2025-01-15</li>
					<li>2025-05-20</li>
					<li>${dto.empName}</li>
					<li>${dto.createdAt}</li>
				</ul>
			</c:forEach>
		</div>
	</main>

</body>
</html>