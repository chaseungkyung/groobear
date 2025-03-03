<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/signMenu.css" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/dist/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>
	<style type="text/css">
		.mainInner .list ul li:nth-child(1) {width: 5%;}
		.mainInner .list ul li:nth-child(2) {width: 60%;}
		.mainInner .list ul li:nth-child(3) {width: 10%;}
		.mainInner .list ul li:nth-child(4) {width: 15%;}
		.mainInner .list ul li:nth-child(5) {width: 10%;}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/signHeader.jsp"/>
	
	<main>
		<div class="mainInner">
			
			<div class="list">
				<ul>
					<li>No</li>
					<li>제목</li>
					<li>기안자</li>
					<li>상신일</li>
					<li>결재 상태</li>
				</ul>
				<!-- 결재 진행함, 결재 완료함 -->
				<c:if test="${mode eq 'inProgress' or mode eq 'completed'}">
					<c:forEach var="docApprovalList" items="${docApprovalList}" varStatus="status">
						<ul>
							<li>${dataCount - (page - 1) * size - status.index}</li>
							<li>
								<a href="${articleUrl}/${docApprovalList.aprIdx}?${query}">${docApprovalList.docType}</a>
							</li>
							<li>${docApprovalList.empName}</li>
							<li>${docApprovalList.regDate}</li>
							<li>
								<c:if test="${docApprovalList.status == 0}">상신 완료</c:if>
								<c:if test="${docApprovalList.status == 1}">결재자 1 결재완료</c:if>
								<c:if test="${docApprovalList.status == 2}">결재자 2 결재완료</c:if>
								<c:if test="${docApprovalList.status == 3}">결재자 3 결재완료</c:if>
								<c:if test="${docApprovalList.status == 99}">결재 완료</c:if>
								<c:if test="${docApprovalList.status == 11}">결재자 1 반려</c:if>
								<c:if test="${docApprovalList.status == 12}">결재자 2 반려</c:if>
								<c:if test="${docApprovalList.status == 13}">결재자 3 반려</c:if>
							</li>
						</ul>
					</c:forEach>
				</c:if>
				<!-- 결재 요청함, 결재 내역함 -->
				<c:if test="${mode eq 'request' or mode eq 'history'}">
					<c:forEach var="approvalLineList" items="${approvalLineList}" varStatus="status">
						<ul>
							<li>${dataCount - (page - 1) * size - status.index}</li>
							<li>
								<a href="${articleUrl}/${approvalLineList.aprIdx}?${query}">${approvalLineList.docType}</a>
							</li>
							<li>${approvalLineList.writerName}</li>
							<li>${approvalLineList.regDate}</li>
							<li>
								<c:if test="${approvalLineList.status == 0}">상신 완료</c:if>
								<c:if test="${approvalLineList.status == 1}">결재자 1 결재완료</c:if>
								<c:if test="${approvalLineList.status == 2}">결재자 2 결재완료</c:if>
								<c:if test="${approvalLineList.status == 3}">결재자 3 결재완료</c:if>
								<c:if test="${approvalLineList.status == 99}">결재 완료</c:if>
								<c:if test="${approvalLineList.status == 11}">결재자 1 반려</c:if>
								<c:if test="${approvalLineList.status == 12}">결재자 2 반려</c:if>
								<c:if test="${approvalLineList.status == 13}">결재자 3 반려</c:if>
							</li>
						</ul>
					</c:forEach>
				</c:if>
			</div>
			
			<div class="page-navigation" style="text-align: center; padding: 10px;">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>
		</div>
	</main>

</body>
</html>