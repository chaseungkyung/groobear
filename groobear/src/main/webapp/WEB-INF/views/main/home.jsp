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
		.mainInner .info .profile { width: 10vw; height: 7vw; border-radius: 50px;}
		
	</style>	
<script type="text/javascript">

function ClockIn() {
	const f = document.ClockForm;
	
	f.action = '${pageContext.request.contextPath}/main/clockIn';
	f.submit();
}	
	
</script>

</head>
<body>

	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<main>
		<div class="mainInner home">
            <div class="info">
                <div class="info-inner">
					<form name="ClockForm">
                    	<div class="today">
	                    	<p style = "font-size: 20px; font-weight: 800;">${sysDate}</p>
	                    	<div class="time" style="margin-top: 10px;"><p>${localTime}</p></div>
	                    	<div class="profile">
		                    	<c:choose>
		                    		<c:when test="${dto.saveProfile == null}">
										<img class="userImg">
									</c:when>
									<c:otherwise>
										<img class ="profileImg" src="<c:url value='${dto.saveProfile}'/>">
									</c:otherwise>
								</c:choose>
							</div>
							<input type='hidden' name="empIdx" value="${dto.empIdx}" style="margin-top: 10px;">
	                        <div class="department" style=" margin-top: 10px; font-size: 20px" ><p>${sessionScope.member.deptName}</p></div>
	                        <div class="department" style="font-size: 20px" ><p>${sessionScope.member.teamName}</p></div>
	                        <div class="name" style="font-size: 20px"><p>${sessionScope.member.empName}</p></div>
                   		</div>
                   		<div class="work">
	                        <div class="status">
	                            <ul>
	                                <li>업무 상태</li>
	                                <li>${loginTime == null ? "출근 전" : "출근 완료"}</li>
	                            </ul>
	                            <ul>
	                                <li>출근 시간</li>
	                                <li>${loginTime.loginTime}</li>
	                            </ul>
	                        </div>
                        </div>
	                    <div class="btnWrap">
	                        <button type="button" onclick="ClockIn();" >${loginTime == null ? "출근" : "퇴근"}</button>
	                    </div>
					</form>
                </div>
            </div>
            <div class="calendar">
            	<h2><a href="${pageContext.request.contextPath}/schedule/schedule?categoryIdx=3"> 오늘의 일정</a></h2>
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
                        <li><a href="javscript:;">[공지]<span style="padding-left: 15px;"></span>2024년 연말 결산 및 부서별 실적 보고서 제출 안내 </a></li>
                        <li><a href="javscript:;">[공지]<span style="padding-left: 15px;"></span> &lt;인사부 필독&gt; 2025년 신입 사원 채용 일정 및 절차 안내 </a></li>
                        <li><a href="javscript:;">[공지]<span style="padding-left: 15px;"></span> 설 연휴 기간 사내 출입 및 출입증 사용 안내와 특별 보안 조치 안내 </a></li>
                    	<li><a href="javscript:;">[공지]<span style="padding-left: 15px;"></span> 2025년 설 연휴 중 근무자 및 휴가 신청 관련 공지사항 </a></li>
                        <li><a href="javscript:;">[공지]<span style="padding-left: 15px;"></span> &lt;개발부 필독&gt; 개발부 사무실 이전에 따른 업무 공백 및 협조 사항 </a></li>
                        <li><a href="javscript:;">[공지]<span style="padding-left: 15px;"></span> 2025년 상반기 인사 발령 공고 및 관련 절차 안내 </a></li>
                        <li><a href="javscript:;">[공지]<span style="padding-left: 15px;"></span> 업무 효율성 향상을 위한 새로운 프로젝트 관리 툴 도입 안내 </a></li>
                    	
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