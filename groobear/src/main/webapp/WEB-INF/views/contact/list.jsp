<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/dist/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/contactMenu.css" type="text/css">
	<style type="text/css">
		main .searchArea {width: 100%; margin-bottom: 10px;}
		
		main .listArea ul {width: 100%;}
		
		main .listArea ul li img {width: 50%;}
		
		main .listArea ul li:nth-child(1) {width: 3%;} /* checkbox */
		main .listArea ul li:nth-child(2) {width: 3%;} /* star */
		main .listArea ul li:nth-child(3) {width: 10%;} /* 회사명 */
		main .listArea ul li:nth-child(4) {width: 10%;} /* 부서 */
		main .listArea ul li:nth-child(5) {width: 10%;} /* 팀 */
		main .listArea ul li:nth-child(6) {width: 10%;} /* 이름 */
		main .listArea ul li:nth-child(7) {width: 10%;} /* 직급 */
		main .listArea ul li:nth-child(8) {width: 15%;} /* 전화번호 */
		main .listArea ul li:nth-child(9) {width: 20%;} /* 이메일 */
		main .listArea ul li:nth-child(10) {width: 9%;} /* 내선번호/대표번호 */
		
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/contactHeader.jsp"/>
	
	<main>
		<div class="mainInner">
			<div class="searchArea">
                <div class="search">
                    <input type="text" name="" id="">
                </div>
            </div>
            <form action="">
	            <div class="listArea">
	                <ul>
						<li><input type="checkbox" name="" id=""></li>
						<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/star.png"></li>
	                    <li>회사명</li>
	                    <li>부서</li>
	                    <li>팀</li>
	                    <li>이름</li>
	                    <li>직급</li>
	                    <li>전화번호</li>
	                    <li>이메일</li>
	                    <li>내선번호/대표번호</li>
	                </ul>
	                <ul>
	                    <li><input type="checkbox" name="" id=""></li>
	                    <li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/star.png"></li>
	                    <li>본사</li>
	                    <li>인사부</li>
	                    <li>인사1팀</li>
	                    <li>홍길동</li>
	                    <li>대리</li>
	                    <li>010-1111-1111</li>
	                    <li>ghdrlfehd@groobear.co.kr</li>
	                    <li>01</li>
	                </ul>
	            </div>
            </form>
            <div class="page-navigation">
                1 2 3
            </div>
		</div>
	</main>

</body>
</html>