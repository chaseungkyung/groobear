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
			<p class="title">보낸 메일</p>
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
					<li><a href="${pageContext.request.contextPath}/">[보낸메일] 20241001 홍길동 사원 건강보험 피부양자 변경 서류</a></li>
					<li>2025-02-11 13:27</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/full-star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[보낸메일] 25-1-1 프로젝트 회의록-1 및 상황 보고 </a></li>
					<li>2025-01-20 13:38</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/full-star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[보낸메일] 25-1-1 프로젝트 기획안 최종 수정 내용 보고 </a></li>
					<li>2025-01-14 16:25</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/full-star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[보낸메일] 25-1-1 프로젝트 기획안 3차 수정 내용 보고 </a></li>
					<li>2025-01-10 15:10</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/full-star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[보낸메일] 25-1-1 프로젝트 기획안 2차 수정 내용 보고 </a></li>
					<li>2025-01-06 15:02</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/full-star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[보낸메일] 25-1-1 프로젝트 기획안 1차 수정 내용 보고 </a></li>
					<li>2025-01-03 16:16</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/full-star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[보낸메일] 25-1-1 프로젝트 기획안 초안 </a></li>
					<li>2024-12-31 16:42</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[보낸메일] [전달] 2024 크리스마스 씰 구매 희망자 조사 </a></li>
					<li>2024-12-20 17:38</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[보낸메일] 요청하신 24-4-3 프로젝트 기록 서류 전달드립니다. </a></li>
					<li>2025-12-16 10:43</li>
				</ul>
				<ul>
					<li><input type="checkbox"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/common/star.png"></li>
					<li><img alt="" src="${pageContext.request.contextPath}/dist/images/mail/email.png"></li>
					<li><a href="${pageContext.request.contextPath}/">[보낸메일] 20241001 홍길동 사원 급여 관련 질문드립니다. </a></li>
					<li>2025-12-10 13:01</li>
				</ul>
				
			</form>
		</div>
	</main>

</body>
</html>