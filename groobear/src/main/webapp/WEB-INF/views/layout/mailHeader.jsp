<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<div class="iconHeader-right">
	<div class="iconHeader-right-inner">
		<div class="btnArea">
			<a href="${pageContext.request.contextPath}/mail/write"><img alt="" src="${pageContext.request.contextPath}/dist/images/common/plus.png">메일 쓰기</a>
		</div>
		<ul>
			<li><a href="${pageContext.request.contextPath}/mail/list"><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png">전체 메일</a></li>
			<li><a href="${pageContext.request.contextPath}/mail/receive"><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/inbox.png">받은 메일</a></li>
			<li><a href="${pageContext.request.contextPath}/mail/mailSend"><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/send.png">보낸 메일</a></li>
			<li><a href="${pageContext.request.contextPath}/mail/important"><img alt="" src="${pageContext.request.contextPath}/dist/images/common/star.png">즐겨찾기</a></li>
			<li><a href="${pageContext.request.contextPath}/mail/trash"><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/trash-can.png">휴지통</a></li>
		</ul>
	</div>
</div>