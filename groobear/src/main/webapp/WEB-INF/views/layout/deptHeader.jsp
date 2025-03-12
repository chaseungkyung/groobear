<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<script>
	document.addEventListener("DOMContentLoaded", function () {
	    const writeButton = document.querySelector(".btnArea a");
	    
	    if (writeButton) {
	        const currentPath = window.location.pathname;
	
	        if (currentPath.includes("/dept/hrBoard")) {
	            writeButton.href = "${window.location.origin}${pageContext.request.contextPath}/dept/hrBoard/write";
	        } else if (currentPath.includes("/club")) {
	            writeButton.href = "${window.location.origin}${pageContext.request.contextPath}/club/write";
	        }
	    }
	});
</script>
<div class="iconHeader-right">
	<div class="iconHeader-right-inner">
		<div class="titleArea" style="width: 100%; margin-bottom: 10%; display: flex; justify-content: center;">
			<div class="btnArea">
				<a href="${pageContext.request.contextPath}/dept/hrBoard/write"><img alt="" src="${pageContext.request.contextPath}/dist/images/common/plus.png">글쓰기</a>
			</div>
		</div>
		<ul>
			<li><a href="${pageContext.request.contextPath}/dept/hrBoard/list"><img alt="" src="${pageContext.request.contextPath}/dist/images/project/project-plan.png">부서 게시판</a></li>
			<li><a href="${pageContext.request.contextPath}/club/list"><img alt="" src="${pageContext.request.contextPath}/dist/images/common/club-icon.png">동호회 게시판</a></li>
		</ul>
	</div>
</div>