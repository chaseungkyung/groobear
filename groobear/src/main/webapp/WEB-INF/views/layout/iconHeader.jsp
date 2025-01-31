<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<div class="iconHeader-left">
	<div class="iconHeader-left-inner">
		<ul>
			<li><a href="${pageContext.request.contextPath}/"><img alt="" src="${pageContext.request.contextPath}/dist/images/menuIcon/home_w.png"></a></li>
			<li><a href="${pageContext.request.contextPath}/mail/list"><img alt="" src="${pageContext.request.contextPath}/dist/images/menuIcon/mail_w.png"></a></li>
			<li><a href="${pageContext.request.contextPath}/schedule/schedule"><img alt="" src="${pageContext.request.contextPath}/dist/images/menuIcon/calendar_w.png"></a></li>
			<li><a href="${pageContext.request.contextPath}/chat/chat"><img alt="" src="${pageContext.request.contextPath}/dist/images/menuIcon/chat_w.png"></a></li>
			<li><a href="${pageContext.request.contextPath}/sign/list"><img alt="" src="${pageContext.request.contextPath}/dist/images/menuIcon/sign_w.png"></a></li>
			<li><a href="${pageContext.request.contextPath}/project/list"><img alt="" src="${pageContext.request.contextPath}/dist/images/menuIcon/project_w.png"></a></li>
			<li><a href="${pageContext.request.contextPath}/reservation/main"><img alt="" src="${pageContext.request.contextPath}/dist/images/menuIcon/reservation_w.png"></a></li>
			<li><a href="${pageContext.request.contextPath}/contact/list"><img alt="" src="${pageContext.request.contextPath}/dist/images/menuIcon/addressBook_w.png"></a></li>
			<li><a href="${pageContext.request.contextPath}/map/map"><img alt="" src="${pageContext.request.contextPath}/dist/images/menuIcon/orgChart_w.png"></a></li>
			<li><a href="${pageContext.request.contextPath}/dept/dept"><img alt="" src="${pageContext.request.contextPath}/dist/images/menuIcon/papers_w.png"></a></li>
			<li><a href="${pageContext.request.contextPath}/emp/list"><img alt="" src="${pageContext.request.contextPath}/dist/images/menuIcon/employee_w.png"></a></li>
			<li><a href="${pageContext.request.contextPath}/setting/setting"><img alt="" src="${pageContext.request.contextPath}/dist/images/menuIcon/setting_w.png"></a></li>
		</ul>
		<div class="btn">
			<a href="${pageContext.request.contextPath}/"><img alt="" src="${pageContext.request.contextPath}/dist/images/menuIcon/logout_w.png"></a>      
		</div>
	</div>       
</div>
<jsp:include page="/WEB-INF/views/layout/topHeader.jsp"/>