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
			<p class="title">전체 메일</p>
			<form action="">
				<ul>
					<li><input type="checkbox"></li>
					<li></li>
					<li>읽음</li>
					<li>제목</li>
					<li>시간</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[보낸메일]	 20241001 홍길동 사원 건강보험 피부양자 변경 서류</a></li>
					<li>2025-02-11 13:27</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/y_star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[받은메일]	 [급여명세서] 2025 02월 급여명세서</a></li>
					<li>2025-02-10 10:22</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[받은메일]	 [공지] 25년 2월 3주차 회의실 예약 현황</a></li>
					<li>2025-02-07 11:18</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[받은메일]	 [공지] 3층 남자 화장실 시설 점검 안내 </a></li>
					<li>2025-02-03 10:11</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/y_star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[받은메일] 	[공지] 설 상여금 지급 관련 공지</a></li>
					<li>2025-01-24 16:52</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[받은메일] 	[공지] 설 연휴간 추가 근무 안내 </a></li>
					<li>2025-01-21 10:04</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/y_star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[보낸메일] 	25-1-1 프로젝트 회의록-1 및 상황 보고 </a></li>
					<li>2025-01-20 11:32</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[받은메일] 	[예약] 2025-01-20 10:00 A회의실 예약 완료되었습니다. </a></li>
					<li>2025-01-17 17:20</li>
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
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[받은메일] [공지] 25년 1월 4주차 회의실 예약 현황</a></li>
					<li>2025-01-17 11:18</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/y_star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[받은메일] 	Your ChatGPT Plus subscription has been renewed </a></li>
					<li>2025-01-15 16:49</li>
				</ul>
			</form>
		</div>
	</main>

</body>
</html>