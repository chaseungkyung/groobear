<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<div class="iconHeader-right">
	<div class="iconHeader-right-inner">

		<ul>
			<li><a href="${pageContext.request.contextPath}/project/projectList"><img alt="" src="${pageContext.request.contextPath}/dist/images/project/backlog.png">프로젝트 리스트</a></li>
			<li><a href="${pageContext.request.contextPath}/project/projectDetail/${projIdx}?${query}"><img alt="" src="${pageContext.request.contextPath}/dist/images/project/project-plan.png">피드</a></li>
			<li><a href="${pageContext.request.contextPath}/project/projectTask/${projIdx}?${query}"><img alt="" src="${pageContext.request.contextPath}/dist/images/project/gantt-chart.png">업무</a></li>
			<li><a href="${pageContext.request.contextPath}/project/projectPostList"><img alt="" src="${pageContext.request.contextPath}/dist/images/project/board.png">게시판</a></li>

		</ul>
	</div>
</div>