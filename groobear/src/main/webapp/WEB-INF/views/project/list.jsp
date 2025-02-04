<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/projectMenu.css" type="text/css">
	<style type="text/css">
		main ul li a {display: block; width: 100%; white-space: nowrap; overflow: hidden; text-overflow : ellipsis;}
		main ul li a:hover {text-decoration: underline;}
		
		main ul li:nth-child(1) {width: 5%;}
		main ul li:nth-child(2) {width: 10%;}
		main ul li:nth-child(3) {width: 60%;}
		main ul li:nth-child(4) {width: 15%;}
		main ul li:nth-child(5) {width: 10%;}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/projectHeader1.jsp"/>
	
	<main>
		<div class="mainInner">
			<ul>
				<li>No</li>
				<li>수주벤더</li>
				<li>프로젝트</li>
				<li>작성자</li>
				<li>등록일</li>
			</ul>
			<ul>
				<li>1</li>
				<li>(주) 코넥</li>
				<li><a href="${pageContext.request.contextPath}/">[국가]한국 교육 학술정보원 2025년~2026년 국립대학지원미ㅏ너ㅣ아러ㅣㅏ너ㅣ아ㅓ니ㅏㅓ리ㅏㅓㅣㅏ너ㅁ니ㅏ어리ㅏㅓ니아ㅓㅣ라ㅣ나어리ㅏ너이러니아ㅓ린어리ㅏㄴ이러ㅣ나어리ㅏ</a></li>
				<li>[개발 1팀] 홍길동 부장</li>
				<li>2025-01-23</li>
			</ul>
			<ul>
				<li>2</li>
				<li>(주) 코넥</li>
				<li><a href="${pageContext.request.contextPath}/">[국가]한국 교육 학술정보원 2025년~2026년 국립대학지원미ㅏ너ㅣ아러ㅣㅏ너ㅣ아ㅓ니ㅏㅓ리ㅏㅓㅣㅏ너ㅁ니ㅏ어리ㅏㅓ니아ㅓㅣ라ㅣ나어리ㅏ너이러니아ㅓ린어리ㅏㄴ이러ㅣ나어리ㅏ</a></li>
				<li>[영업팀] 아무개 사원</li>
				<li>2025-01-23</li>
			</ul>
		</div>
	</main>

</body>
</html>