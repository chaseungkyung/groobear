<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/home/home.css" type="text/css">
	<style type="text/css">
		main {width: 93vw;}
		main .mainInner {width: 83vw;}
	</style>	
</head>
<body>

	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<main>
		<div class="mainInner home">
            <div class="info">
                <div class="info-inner">
                    <div class="today"><p>2025년 01월 20일</p></div>
                    <div class="profile">
                        <div class="userImg"></div>
                        <div class="department"><p>${sessionScope.member.deptName}</p></div>
                        <div class="name"><p>${sessionScope.member.empName}</p></div>
                    </div>
                    <div class="time"><p>08:50:11</p></div>
                    <div class="work">
                        <div class="status">
                            <ul>
                                <li>업무 상태</li>
                                <li>출근 전</li>
                            </ul>
                            <ul>
                                <li>출근 시간</li>
                                <li>출근 전</li>
                            </ul>
                            <ul>
                                <li>퇴근 시간</li>
                                <li>출근 전</li>
                            </ul>
                        </div>
                    </div>
                    <div class="btnWrap">
                        <button type="button">출근</button>
                    </div>
                </div>
            </div>
            <div class="calendar">
            	<h2><a href="${pageContext.request.contextPath}/schedule/schedule?categoryIdx=3">일정</a></h2>
            		<c:forEach var="schedule" items="${list}">
            			<c:choose>
            				<c:when test="${schedule.startTime != null}">            				
            					<div>${schedule.startTime} / ${schedule.title}</div>            					            			
            				</c:when>
            				<c:otherwise>
            					<div>${schedule.title}</div>
            				</c:otherwise>
            			</c:choose>
            		</c:forEach>
            </div>
            <div class="notice">
                <h2>공지사항</h2>
                <div class="noticeList">
                    <ul>
                        <li><a href="javscript:;">[공지 1] 회사 내 규정 사항 공지합니다.</a></li>
                        <li><a href="javscript:;">[공지 2] 설 연휴 사내 출입 관련 공지</a></li>
                        <li><a href="javscript:;">[공지 3] 설 연휴 선물 배송 관련 안내ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</a></li>
                        <li><a href="javscript:;">[공지 4] 공지 개싫음</a></li>
                        <li><a href="javscript:;">[공지 4] 공지 개싫음</a></li>
                    </ul>
                </div>
            </div>
            <div class="dataRoom">
                <h2>자료실</h2>
            </div>
            <div class="sign">
                <h2>결재 대기 문서</h2>
                <div class="signStandBy"></div>
            </div>
            <div class="mail">
                <h2><a href="${pageContext.request.contextPath}/mail/list">메일</a></h2>
                <div class="acceptMail">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/mail/list">[보낸메일]	 20241001 홍길동 사원 건강보험 피부양자 변경 서류</a></li>
                        <li><a href="${pageContext.request.contextPath}/mail/list">[받은메일]	 [급여명세서] 2025 02월 급여명세서</a></li>
                        <li><a href="${pageContext.request.contextPath}/mail/list">[받은메일]	 [공지] 25년 2월 3주차 회의실 예약 현황</a></li>
                        <li><a href="${pageContext.request.contextPath}/mail/list">[받은메일]	 [공지] 3층 남자 화장실 시설 점검 안내 </a></li>
                        <li><a href="${pageContext.request.contextPath}/mail/list">[받은메일] 	 [공지] 설 상여금 지급 관련 공지</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </main>

</body>
</html>