<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<style>
.iconHeader-right .iconHeader-right-inner ul li a:hover {background-color: #fffff;}
</style>

<div class="iconHeader-right">
	<div class="iconHeader-right-inner">
		<div class="btnArea">
			<a href="${pageContext.request.contextPath}/schedule/write">
				<img alt="" src="${pageContext.request.contextPath}/dist/images/common/plus.png">일정 추가
			</a>
		</div>
		<ul class = "tab-menu" onsubmit="handleSubmit(event)">
			<li id = "companySchedule" class = "active" onclick="scheduleCategory(3)"><a>회사일정</a></li>
			<li id = "deptSchedule" onclick="scheduleCategory(2)"><a>부서일정</a></li>
			<li id = "mySchedule"onclick="scheduleCategory(1)"><a>개인일정</a></li>
		</ul>
	</div>
</div>
