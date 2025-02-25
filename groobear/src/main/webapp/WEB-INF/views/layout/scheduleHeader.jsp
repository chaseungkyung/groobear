<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<style>
.iconHeader-right .iconHeader-right-inner ul li a:hover {background-color: #fffff;}
</style>

<div class="iconHeader-right">
	<div class="iconHeader-right-inner">
		<div class="btnArea">
			<c:choose>
				<c:when test="${categoryIdx == 3 && (sessionScope.member.positionCode <= 2 || sessionScope.member.deptIdx == 'A' || sessionScope.member.positionCode == 100)}">
					<a href="${pageContext.request.contextPath}/schedule/write">
						<img alt="" src="${pageContext.request.contextPath}/dist/images/common/plus.png">일정 추가
					</a>
				</c:when>
				<c:when test="${categoryIdx == 2 && sessionScope.member.positionCode <= 6 || sessionScope.member.positionCode == 100}">
					<a href="${pageContext.request.contextPath}/schedule/write">
						<img alt="" src="${pageContext.request.contextPath}/dist/images/common/plus.png">일정 추가
					</a>
				</c:when>
				<c:when test="${categoryIdx == 1}">
					<a href="${pageContext.request.contextPath}/schedule/write">
						<img alt="" src="${pageContext.request.contextPath}/dist/images/common/plus.png">일정 추가
					</a>
				</c:when>
			</c:choose>		
		</div>
		<ul class = "tab-menu">
			<li id = "companySchedule" class = "active" onclick="scheduleCategory(3)"><a href = "${pageContext.request.contextPath}/schedule/schedule?categoryIdx=3">회사일정</a></li>
			<li id = "deptSchedule" onclick="scheduleCategory(2)"><a href = "${pageContext.request.contextPath}/schedule/schedule?categoryIdx=2">부서일정</a></li>
			<li id = "mySchedule"onclick="scheduleCategory(1)"><a href = "${pageContext.request.contextPath}/schedule/schedule?categoryIdx=1">개인일정</a></li>
		</ul>
	</div>
</div>
