<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<div class="iconHeader-right">
	<div class="iconHeader-right-inner">
		<div class="btnArea">
			<c:if test="${sessionScope.member.deptIdx == 'F' && sessionScope.member.positionCode == 5}">
				<a href="${pageContext.request.contextPath}/project/create"><img alt="" src="${pageContext.request.contextPath}/dist/images/common/plus.png">새 프로젝트</a>
			</c:if>
		</div>
		<ul>
			<li><a href="${pageContext.request.contextPath}/project/list"><img alt="" src="${pageContext.request.contextPath}/dist/images/project/backlog.png">프로젝트 리스트</a></li>
			<li><a href="${pageContext.request.contextPath}/project/list"><img alt="" src="${pageContext.request.contextPath}/dist/images/project/project-plan.png">업무 목록 관리</a></li>
			<li><a href="${pageContext.request.contextPath}/project/list"><img alt="" src="${pageContext.request.contextPath}/dist/images/project/gantt-chart.png">프로젝트 일정</a></li>
		</ul>
	</div>
</div>