<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<div class="iconHeader-right">
	<div class="iconHeader-right-inner">
		<div class="btnArea">
			<c:if test="${sessionScope.member.empIdx == dto.crtEmpIdx}">
				<a href="${pageContext.request.contextPath}/project/update?projIdx=${projIdx}&page=${page}">프로젝트 수정</a>
			</c:if>
		</div>

		<ul>
			<li><a href="${pageContext.request.contextPath}/project/list"><img alt="" src="${pageContext.request.contextPath}/dist/images/project/backlog.png">프로젝트 리스트</a></li>
			<li><a href="${pageContext.request.contextPath}/project/list"><img alt="" src="${pageContext.request.contextPath}/dist/images/project/project-plan.png">업무 목록</a></li>
			<li><a href="${pageContext.request.contextPath}/project/post">게시판</a></li>
			<li><a href="${pageContext.request.contextPath}/project/list">캘린더</a></li>
			<li><a href="${pageContext.request.contextPath}/project/list">캘린더</a></li>

		</ul>
	</div>
</div>