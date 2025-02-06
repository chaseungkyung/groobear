<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/mail/mail.css" type="text/css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/mailHeader.jsp"/>
	
	<main>
		<div class="mainInner">
			<p class="title">즐겨찾기</p>
			<form action="">
				<ul>
					<li><input type="checkbox"></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/y_star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[받은메일] [급여명세서] 2025 02월 급여명세서</a></li>
					<li>2025-02-10 10:22</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/y_star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[받은메일] [공지] 설 상여금 지급 관련 공지</a></li>
					<li>2025-01-24 16:52</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/y_star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[보낸메일] 25-1-1 프로젝트 회의록-1 및 상황 보고 </a></li>
					<li>2025-01-20 13:38</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/y_star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[받은메일] [개발부 공지] 25-1-1 프로젝트 계획서 / 관련서류첨부 </a></li>
					<li>2025-01-17 14:13</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/y_star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[받은메일] Your ChatGPT Plus subscription has been renewed </a></li>
					<li>2025-01-15 16:49</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/y_star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[보낸메일] 25-1-1 프로젝트 기획안 최종 수정 내용 보고 </a></li>
					<li>2025-01-14 16:25</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/y_star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[보낸메일] 25-1-1 프로젝트 기획안 3차 수정 내용 보고 </a></li>
					<li>2025-01-10 15:10</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/y_star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[받은메일] [급여명세서] 2025 01월 급여명세서 </a></li>
					<li>2025-01-10 10:17</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/y_star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[보낸메일] 25-1-1 프로젝트 기획안 2차 수정 내용 보고 </a></li>
					<li>2025-01-06 15:02</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/y_star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[보낸메일] 25-1-1 프로젝트 기획안 1차 수정 내용 보고 </a></li>
					<li>2025-01-03 16:16</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/y_star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[보낸메일] 25-1-1 프로젝트 기획안 초안 </a></li>
					<li>2024-12-31 16:42</li>
				</ul>
			</form>
		</div>
	</main>

</body>
</html>