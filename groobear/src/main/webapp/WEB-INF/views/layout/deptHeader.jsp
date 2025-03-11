<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<div class="iconHeader-right">
	<div class="iconHeader-right-inner">
		<div class="titleArea" style="width: 100%; margin-bottom: 10%; display: flex; justify-content: center;">
			<div class="btnArea">
				<a href="${pageContext.request.contextPath}/dept/hrBoard/write"><img alt="" src="${pageContext.request.contextPath}/dist/images/common/plus.png">글쓰기</a>
			</div>
		</div>
		<ul>
			<li><a href="${pageContext.request.contextPath}/dept/hrBoard/list"><img alt="" src="${pageContext.request.contextPath}/dist/images/project/project-plan.png">부서 게시판</a></li>
		</ul>
		<ul>
			<li><a href="${pageContext.request.contextPath}/club/list"><img alt="" src="${pageContext.request.contextPath}/dist/images/project/project-plan.png">동호회 게시판</a></li>
		</ul>
	</div>
</div>