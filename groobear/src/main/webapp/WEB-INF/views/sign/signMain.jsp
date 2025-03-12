<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/signMenu.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/sign/signMain.css" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/dist/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/signHeader.jsp"/>
	
	<main>
		<div class="mainInner">
			<div class="quickMenu">
				<div class="menu">
					<span>
						<i class="bi bi-journal"></i>
					</span>
					<p>템플릿 관리</p>
				</div>
				<div class="menu">
					<span>
						<i class="bi bi-search"></i>
					</span>
					<p>문서 검색</p>
				</div>
				<div class="menu">
					<span>
						<i class="bi bi-star"></i>
					</span>
					<p>즐겨찾기 문서</p>
				</div>
				<div class="menu">
					<span>
						<i class="bi bi-folder"></i>
					</span>
					<p>부서별 문서함</p>
				</div>
				<div class="menu">
					<span>
						<i class="bi bi-people"></i>
					</span>
					<p>권한 위임 관리</p>
				</div>
			</div>
			<div class="list">
				<div class="left">
					<div class="moveUrl">
		               	<a href="${pageContext.request.contextPath}/sign/request">
		               		<img alt="" src="${pageContext.request.contextPath}/dist/images/common/plus.png">
		               	</a>
					</div>
					<p>결재 대기 문서</p>
					<ul>
						<li>휴가 신청서</li>
						<li>출장 계획 및 비용 정산건</li>
						<li>사업 비용 결제 요청건</li>
						<li>사무용품 물품 구매 요청건</li>
						<li>신규 프로젝트 기획 및 승인 요청서</li>
					</ul>
				</div>
				<div class="middle">
					<div class="moveUrl">
	                	<a href="${pageContext.request.contextPath}/sign/history">
	                		<img alt="" src="${pageContext.request.contextPath}/dist/images/common/plus.png">
	                	</a>
	                </div>
					<p>결재 완료 문서</p>
					<ul>
						<li>주간 업무 진행 상황 보고</li>
						<li>인사 이동 변경 요청건</li>
						<li>사무용 비품 지급 요청건</li>
						<li>신규 거래처 계약 체결 요청건</li>
						<li>사내외 교육 및 세미나 참석 요청건</li>
					</ul>
				</div>
				<div class="right">
					<div class="moveUrl">
	                	<a href="${pageContext.request.contextPath}/sign/completed">
	                		<img alt="" src="${pageContext.request.contextPath}/dist/images/common/plus.png">
	                	</a>
	                </div>
					<p>반려 문서</p>
					<ul>
						<li>급여 인상 요청서</li>
						<li>고가 장비 구매 요청서</li>
						<li>출장비 정산 요청서</li>
						<li>회식비 정산 청구서</li>
						<li>법인카드 사용 승인서</li>
					</ul>
				</div>
			</div>
		</div>
	</main>

</body>
</html>