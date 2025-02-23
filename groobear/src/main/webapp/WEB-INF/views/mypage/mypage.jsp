<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/layout/headerResources.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listmenu.css" type="text/css">
<style type="text/css">
.custom-button {
    background-color: #4C73B8; 
    color: white;
    padding: 10px 20px;
    font-size: 16px;
    font-weight: bold;
    border: none;
    border-radius: 8px; 
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    margin-right: 10px;
}

.custom-button:hover {
    background-color: #365491; 
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
}

@media (max-width: 768px) {
    .blue-button {
        width: 100%;
        margin: 8px 0;
        padding: 14px 0;
    }
}

.button-group {
    padding-left: 50px; 
    margin-bottom: 20px;
    display: flex;
    align-items: center;
    
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<jsp:include page="/WEB-INF/views/layout/mypageHeader.jsp" />

	<main>
    <div class="mainInner">
    	<div class="button-group">
	        <a href="${pageContext.request.contextPath}/mypage/workList" class="custom-button">근무 현황</a>
	        <a href="${pageContext.request.contextPath}/mypage/timeKeeping" class="custom-button">근태 내역</a>
	        <a href="${pageContext.request.contextPath}/mypage/paidOffTime" class="custom-button">휴가 내역</a>
	        <a href="${pageContext.request.contextPath}/mypage/modify" class="custom-button">나의 정보 수정</a>
		</div>
	</div>
	</main>

</body>
</html>