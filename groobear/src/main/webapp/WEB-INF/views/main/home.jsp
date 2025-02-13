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
            <div class="project">
                <h2>프로젝트 진행 현황</h2>
                <div class="selectBox">
                    <select name="" id="">
                        <option value="">A 프로젝트</option>
                        <option value="">B 프로젝트</option>
                        <option value="">C 프로젝트</option>
                        <option value="">D 프로젝트</option>
                        <option value="">E 프로젝트</option>
                        <option value="">F 프로젝트</option>
                    </select>
                </div>
                <div class="chartArea">
                	
                </div>
            </div>
            <div class="alarm">
                <h2>알림</h2>
                <div class="alarmList"></div>
            </div>
            <div class="calendar"></div>
            <div class="sign">
                <h2>결재 대기 문서</h2>
                <div class="signStandBy"></div>
            </div>
            <div class="mail">
                <h2>메일</h2>
                <div class="acceptMail">
                    <ul>
                        <li><a href="javscript:;">메일1</a></li>
                        <li><a href="javscript:;">메일2</a></li>
                        <li><a href="javscript:;">메일3</a></li>
                        <li><a href="javscript:;">메일4</a></li>
                        <li><a href="javscript:;">메일5</a></li>
                    </ul>
                </div>
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
        </div>
    </main>

</body>
</html>