<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/home/home.css" type="text/css">
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
							<input type='hidden' name="empIdx" value="${dto.empIdx}">
	                        <div class="department">
	                        	<span>${sessionScope.member.deptName}</span> ${sessionScope.member.teamName}
                        	</div>
	                        <div class="name" style="font-size: 20px"><p>${sessionScope.member.empName}</p></div>
                   		</div>
                    	<div id="clock"></div>
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
	                    <div class="btnWrap">
	                        <button type="button" onclick="ClockIn();" >${loginTime == null ? "출근" : "퇴근"}</button>
	                    </div>
					</form>
                </div>
            </div>
            <div class="schedule">
            	<div class="calendar">
            		<div id="month-year"></div>
			        <table>
			            <thead>
			                <tr>
			                    <th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
			                </tr>
			            </thead>
			            <tbody id="calendar-body"></tbody>
			        </table>
            	</div>
            	<h2>오늘의 일정</h2>
            	<div class="moveUrl">
                	<a href="${pageContext.request.contextPath}/schedule/schedule?categoryIdx=3">
                		<img alt="" src="${pageContext.request.contextPath}/dist/images/common/plus.png">
                	</a>
                </div>
            	<div class="calendarList">
            		<ul>
		           		<c:forEach var="schedule" items="${list}">
		           			<c:choose>
		           				<c:when test="${schedule.startTime != null}">            				
		           					<li>&#91;${schedule.startTime}&#93; &nbsp; ${schedule.title}</li>
		           				</c:when>
		           				<c:otherwise>
		           					<li>${schedule.title}</li>
		           				</c:otherwise>
		           			</c:choose>
		           		</c:forEach>
	           		</ul>
           		</div>
            </div>
            <div class="notice">
                <h2>공지사항</h2>
                <div class="moveUrl">
                	<a href="${pageContext.request.contextPath}/notice/list">
                		<img alt="" src="${pageContext.request.contextPath}/dist/images/common/plus.png">
                	</a>
                </div>
                <div class="noticeList">
                    <ul>
                        <li><a href="javscript:;">&#91;공지&#93; &nbsp; 2024년 연말 결산 및 부서별 실적 보고서 제출 안내 </a></li>
                        <li><a href="javscript:;">&#91;공지&#93; &nbsp; &lt;인사부 필독&gt; 2025년 신입 사원 채용 일정 및 절차 안내 </a></li>
                        <li><a href="javscript:;">&#91;공지&#93; &nbsp; 설 연휴 기간 사내 출입 및 출입증 사용 안내와 특별 보안 조치 안내 </a></li>
                    	<li><a href="javscript:;">&#91;공지&#93; &nbsp; 2025년 설 연휴 중 근무자 및 휴가 신청 관련 공지사항 </a></li>
                        <li><a href="javscript:;">&#91;공지&#93; &nbsp; &lt;개발부 필독&gt; 개발부 사무실 이전에 따른 업무 공백 및 협조 사항 </a></li>
                        <li><a href="javscript:;">&#91;공지&#93; &nbsp; 2025년 상반기 인사 발령 공고 및 관련 절차 안내 </a></li>
                        <!-- <li><a href="javscript:;">&#91;공지&#93; &nbsp; &nbsp; 업무 효율성 향상을 위한 새로운 프로젝트 관리 툴 도입 안내 </a></li> -->
                    </ul>
                </div>
            </div>
            <div class="dataRoom">
                <h2>자료실</h2>
                <div class="moveUrl">
                	<a href="${pageContext.request.contextPath}/main">
                		<img alt="" src="${pageContext.request.contextPath}/dist/images/common/plus.png">
                	</a>
                </div>
                <div class="dataRoomList">
                    <ul>
                        <li><a href="javscript:;">회의록 템플릿 (업데이트 버전)</a></li>
                        <li><a href="javscript:;">프로젝트 기획서 양식 (Excel & PPT)</a></li>
                        <li><a href="javscript:;">출장비 정산 양식 및 사용법</a></li>
                        <li><a href="javscript:;">VPN 및 원격 접속 방법 안내</a></li>
                        <li><a href="javscript:;">사내 시스템 로그인 오류 해결 방법</a></li>
                        <li><a href="javscript:;">디자인 트렌드 보고서 (2025)</a></li>
                    </ul>
                </div>
            </div>
            <div class="mail">
                <h2>메일</h2>
                <div class="moveUrl">
                	<a href="${pageContext.request.contextPath}/mail/list">
                		<img alt="" src="${pageContext.request.contextPath}/dist/images/common/plus.png">
                	</a>
                </div>
                <div class="acceptMail">
                    <ul>
                    	<!-- 받은 메일만 -->
                        <li><a href="${pageContext.request.contextPath}/mail/list">[급여명세서] 2025 02월 급여명세서</a></li>
                        <li><a href="${pageContext.request.contextPath}/mail/list">[공지] 25년 2월 3주차 회의실 예약 현황</a></li>
                        <li><a href="${pageContext.request.contextPath}/mail/list">[공지] 3층 남자 화장실 시설 점검 안내 </a></li> 
                        <li><a href="${pageContext.request.contextPath}/mail/list">[공지] 설 상여금 지급 관련 공지</a></li> 
                        <li><a href="${pageContext.request.contextPath}/mail/list">[공지] 설 연휴간 추가 근무 안내</a></li> 
                        <li><a href="${pageContext.request.contextPath}/mail/list">[예약] 2025-01-20 10:00 A회의실 예약 완료되었습니다.</a></li> 
                    </ul>
                </div>
            </div>
            <div class="quickLink">
            	<ul>
            		<li>
            			<span><i class="bi bi-calendar-check"></i></span>
            			<a href="${pageContext.request.contextPath}/sign/leaveRequest">연차 신청</a>
            		</li>
            		<li>
            			<span><i class="bi bi-easel"></i></span>
            			<a href="${pageContext.request.contextPath}/reservation/main">회의실 예약</a>
            		</li>
            		<li>
            			<span><i class="bi bi-folder2-open"></i></span>
            			<a href="${pageContext.request.contextPath}/main">공유 문서함</a>
            		</li>
            		<li>
            			<span><i class="bi bi-credit-card"></i></span>
            			<a href="${pageContext.request.contextPath}/main">경비정산</a>
            		</li>
            		<li>
            			<span><i class="bi bi-search"></i></span>
            			<a href="${pageContext.request.contextPath}/emp/list">사원 검색</a>
            		</li>
            	</ul>
            </div>
        </div>
    </main>

</body>
<script type="text/javascript">

	function isLeapYear(year) {
	    return (year % 4 === 0 && year % 100 !== 0) || (year % 400 === 0);
	}
	
	function generateCalendar(year, month, activeDay) {
	    const daysInMonth = [31, isLeapYear(year) ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
	    const firstDay = new Date(year, month, 1).getDay();
	    const days = daysInMonth[month];
	    
	    document.getElementById("month-year").textContent = year + "년 " + (month + 1) + "월";
	    const calendarBody = document.getElementById("calendar-body");
	    calendarBody.innerHTML = "";
	    
	    let row = document.createElement("tr");
	    for (let i = 0; i < firstDay; i++) {
	        let cell = document.createElement("td");
	        row.appendChild(cell);
	    }
	    for (let day = 1; day <= days; day++) {
	        if (row.children.length === 7) {
	            calendarBody.appendChild(row);
	            row = document.createElement("tr");
	        }
	        let cell = document.createElement("td");
	        cell.textContent = day;
	        if (day === activeDay) {
	            cell.classList.add("active");
	        }
	        row.appendChild(cell);
	    }
	    if (row.children.length > 0) {
	        calendarBody.appendChild(row);
	    }
	}
	
	document.addEventListener("DOMContentLoaded", () => {
	    const today = new Date();
	    const currentYear = today.getFullYear();
	    const currentMonth = today.getMonth();
	    const activeDay = today.getDate();
	    generateCalendar(currentYear, currentMonth, activeDay);
	});
	
	function updateClock() {
        var now = new Date();
        var hours = now.getHours().toString().padStart(2, '0');
        var minutes = now.getMinutes().toString().padStart(2, '0');
        var seconds = now.getSeconds().toString().padStart(2, '0');
        
        document.getElementById('clock').textContent = hours + ":" + minutes + ":" + seconds;
    }

    setInterval(updateClock, 1000);
    updateClock(); // 페이지 로드 시 즉시 실행
	
</script>
</html>