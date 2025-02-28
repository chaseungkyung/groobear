<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<style>
.iconHeader-right .iconHeader-right-inner ul li a:hover {background-color: #fffff;}
</style>

<div class="iconHeader-right">
	<div class="iconHeader-right-inner">
		<div class="btnArea">
			<a href="${pageContext.request.contextPath}/reservation/write?cabinet=${cabinet}">
				<img alt="" src="${pageContext.request.contextPath}/dist/images/common/plus.png">예약 하기
			</a>
		</div>
		<ul class = "tab-menu">
			<li id = "cabinetA" class = "active" onclick="cabinetName('A')"><a href = "${pageContext.request.contextPath}/reservation/main">A 회의실</a></li>
			<li id = "cabinetB" onclick="cabinetName('B')"><a href = "${pageContext.request.contextPath}/reservation/main">B 회의실</a></li>
			<li id = "cabinetC"onclick="cabinetName('C')"><a href = "${pageContext.request.contextPath}/reservation/main">C 회의실</a></li>
		</ul>
	</div>
</div>
