<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<div class="iconHeader-left">
	<div class="iconHeader-left-inner">
		<ul>
			<li><a href="${pageContext.request.contextPath}/main"><img alt="" src="${pageContext.request.contextPath}/dist/images/menuIcon/home_w.png">홈</a></li>
			<li><a href="${pageContext.request.contextPath}/mail/list"><img alt="" src="${pageContext.request.contextPath}/dist/images/menuIcon/mail_w.png">메일</a></li>
			<li><a href="${pageContext.request.contextPath}/schedule/schedule"><img alt="" src="${pageContext.request.contextPath}/dist/images/menuIcon/calendar_w.png">일정</a></li>
			<li><a href="${pageContext.request.contextPath}/chat/chat"><img alt="" src="${pageContext.request.contextPath}/dist/images/menuIcon/chat_w.png">채팅</a></li>
			<li><a href="${pageContext.request.contextPath}/sign/list"><img alt="" src="${pageContext.request.contextPath}/dist/images/menuIcon/sign_w.png">결재</a></li>
			<c:if test="${sessionScope.member.deptIdx == 'B' || sessionScope.member.deptIdx == 'F' || sessionScope.member.empCode == 'admin' || sessionScope.member.positionCode == 1 || sessionScope.member.positionCode == 2}">
				<li><a href="${pageContext.request.contextPath}/project/list"><img alt="" src="${pageContext.request.contextPath}/dist/images/menuIcon/project_w.png">프로젝트</a></li>
			</c:if>
			<li><a href="${pageContext.request.contextPath}/reservation/main"><img alt="" src="${pageContext.request.contextPath}/dist/images/menuIcon/reservation_w.png">예약</a></li>
			<li><a href="${pageContext.request.contextPath}/contact/list"><img alt="" src="${pageContext.request.contextPath}/dist/images/menuIcon/addressBook_w.png">주소록</a></li>
			<li><a href="${pageContext.request.contextPath}/dept/dept"><img alt="" src="${pageContext.request.contextPath}/dist/images/menuIcon/papers_w.png">나의부서</a></li>
			<c:if test="${sessionScope.member.deptIdx == 'D' || sessionScope.member.empCode == 'admin' || sessionScope.member.positionCode == 1 || sessionScope.member.positionCode == 2}">
				<li><a href="${pageContext.request.contextPath}/emp/list"><img alt="" src="${pageContext.request.contextPath}/dist/images/menuIcon/employee_w.png">사원관리</a></li>
			</c:if>
			<li><a href="${pageContext.request.contextPath}/mypage/mypage"><img alt="" src="${pageContext.request.contextPath}/dist/images/menuIcon/user_w.png">마이페이지</a></li>
		</ul>
		<div class="btn">
			<a href="${pageContext.request.contextPath}/logout"><img alt="" src="${pageContext.request.contextPath}/dist/images/menuIcon/logout_w.png"></a>      
		</div>
	</div>       
</div>
<jsp:include page="/WEB-INF/views/layout/topHeader.jsp"/>