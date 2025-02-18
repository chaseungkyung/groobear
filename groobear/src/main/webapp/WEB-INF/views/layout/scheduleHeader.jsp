<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<div class="iconHeader-right">
	<div class="iconHeader-right-inner">
		<div class="btnArea">
			<a href="${pageContext.request.contextPath}/schedule/write"><img alt="" src="${pageContext.request.contextPath}/dist/images/common/plus.png">일정 추가</a>
		</div>
		<ul>
			<li><a href="${pageContext.request.contextPath}/schedule/schedule">회사일정</a></li>
			<li><a href="${pageContext.request.contextPath}/schedule/schedule">팀일정</a></li>
			<li><a href="${pageContext.request.contextPath}/schedule/schedule">개인일정</a></li>
		</ul>
	</div>
</div>

