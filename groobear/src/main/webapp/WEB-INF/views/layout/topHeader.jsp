<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<div class="top-menu">
	<div class="top-menu-inner">
		<div class="logo">
			<img src="${pageContext.request.contextPath}/dist/images/logo-w.png" alt="">
		</div>
		<ul>
			<li><a href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
			<li><a href="${pageContext.request.contextPath}/">HR</a></li>
			<li><a href="${pageContext.request.contextPath}/">사내 교육 자료실</a></li>
			<li><a href="${pageContext.request.contextPath}/map/map">조직도</a></li>
		</ul>
		<div class="notif">
			<img alt="" src="${pageContext.request.contextPath}/dist/images/menuIcon/bell_w.png">
			<div class="count">100</div>
		</div>
	</div>
</div>