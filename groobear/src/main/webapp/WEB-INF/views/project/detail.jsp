<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/project/headerResources.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/project/detail.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/project/inviteModal.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/project/teamModal.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

</head>

<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<jsp:include page="/WEB-INF/views/project/projectHeader2.jsp" />
	<jsp:include page="/WEB-INF/views/project/inviteModal.jsp" />
	<jsp:include page="/WEB-INF/views/project/teamModal.jsp" />

	<main>
		<div class="mainInner">
			<div class="inner-top">
				<span class="projectName">${dto.projName}</span>
				<div class="btn-area">
				    <button id="teamModalBtn" class="team-button">
				        팀 편성
				    </button>
				    <button id="inviteModalBtn" class="invite-button">
				        <i class="bi bi-person-plus"></i> 초대하기
				    </button>
			    </div>
			</div>

			<div class="inner-middle">
				<div class="middle-top">
					<div id="stage-chart"></div>
				</div>

				<div class="middle-bottom">
					<div class="bottom-left">
					
						<div class="progress-rate-title">
							<span>프로젝트 진행률</span>
						</div>
						
						<div class="stage-progress-rate">
							<div class="stage-progress-bar">
								<div data-width="88" style="">
									<h3> DB 설계 </h3> 
									<span>88%</span>
								</div>
							</div>
							<div class="stage-progress-bar">
								<div data-width="88" style="">
									<h3> 디자인 작업 </h3>
									<span>88%</span>
								</div>
							</div>
							<div class="stage-progress-bar">
								<div data-width="88" style="">
									<h3> 기능 개발 </h3>
									<span>88%</span>
								</div>
							</div>
							<div class="stage-progress-bar">
								<div data-width="88" style="">
									<h3> xptmxm </h3>
									<span>88%</span>
								</div>
							</div>
						</div>
						
						
						<div class="task-progress-rate">
							<div class="dropdown" id="customDropdown">
								<!-- 드롭다운 토글 버튼 -->
								<div class="dropdown-toggle">
									<span class="dropdown-label">단계 선택</span> <span
										class="dropdown-arrow"></span>
								</div>
								<!-- 드롭다운 옵션 리스트 -->
								<div class="dropdown-menu">
									<div class="dropdown-option">DB 설계</div>
									<div class="dropdown-option">디자인 작업</div>
									<div class="dropdown-option">기능 개발</div>
									<div class="dropdown-option">테스트</div>
									<div class="dropdown-option">오류수정</div>
								</div>
							</div>

							<div class="task-container">
								<div class="task-progress-bar">
									<div data-width="50" style="">
										<span>50%</span>
									</div>
								</div>

								<!-- Task 리스트 -->
								<ul class="task-list">
									<li class="task-item">
										<img class="task-icon" alt="" src="${pageContext.request.contextPath}/dist/images/project/request.png">
										<span> 요구사항 정의와 모델링 정리 </span>
									</li>
								</ul>
								<ul class="task-list">
									<li class="task-item">
										<img class="task-icon" alt="" src="${pageContext.request.contextPath}/dist/images/project/hold.png">
										<span> Task1 </span>
									</li>
								</ul>
								<ul class="task-list">
									<li class="task-item">
										<img class="task-icon" alt="" src="${pageContext.request.contextPath}/dist/images/project/complete.png">
										<span> Task1 </span>
									</li>
								</ul>
								<ul class="task-list">
									<li class="task-item">
										<img class="task-icon" alt="" src="${pageContext.request.contextPath}/dist/images/project/progress.png">
										<span> Task1 </span>
									</li>
								</ul>
							</div>
						</div>


					
					</div>

					<div class="bottom-right">
						<!-- 오른쪽 참여자 목록 -->
						<div class="project-participants">
							<div class="section-title">참여자 7</div>

							<div class="participant-box">

								<!-- 프로젝트 관리자 -->
								<div class="pm-title">프로젝트 관리자</div>
								<div class="participant-item">
									<div class="participant-image">
										<img alt="" src="${pageContext.request.contextPath}/dist/images/project/employee_img1.png">
									</div>
									<div class="participant-info">
										<div class="participant-name">박민기</div>
										<div class="participant-department">빠르대숑 경영지원팀</div>
									</div>
									<div class="chat-image">
										<img alt="" src="${pageContext.request.contextPath}/dist/images/project/chat.png">
									</div>
								</div>

								
								<div class="member-title">프로젝트 멤버</div>
								<div class="participant-item">
									<div class="participant-image">
										<div class="participant-image">
											<img alt="" src="${pageContext.request.contextPath}/dist/images/project/employee_img1.png">
										</div>
									</div>
									<div class="participant-info">
										<div class="participant-name">김대희 PD</div>
										<div class="participant-department">필름스튜디오 대표</div>
									</div>
									<div class="chat-image">
										<img alt="" src="${pageContext.request.contextPath}/dist/images/project/chat.png">
									</div>															
								</div>

								<div class="participant-item">
									<div class="participant-image">
										<div class="participant-image">
											<img alt="" src="${pageContext.request.contextPath}/dist/images/project/employee_img1.png">
										</div>									
									</div>
									<div class="participant-info">
										<div class="participant-name">김재우 주임</div>
										<div class="participant-department">닥터미소 코스메틱 마케팅팀</div>
									</div>
									<div class="chat-image">
										<img alt="" src="${pageContext.request.contextPath}/dist/images/project/chat.png">
									</div>									
								</div>
								<div class="participant-item">
									<div class="participant-image">
										<div class="participant-image">
											<img alt="" src="${pageContext.request.contextPath}/dist/images/project/employee_img1.png">
										</div>									
									</div>
									<div class="participant-info">
										<div class="participant-name">김지수 대리</div>
										<div class="participant-department">닥터미소 코스메틱 마케팅팀</div>
									</div>
									<div class="chat-image">
										<img alt="" src="${pageContext.request.contextPath}/dist/images/project/chat.png">
									</div>									
								</div>
								<div class="participant-item">
									<div class="participant-image">
										<div class="participant-image">
											<img alt="" src="${pageContext.request.contextPath}/dist/images/project/employee_img1.png">
										</div>							
									</div>
									<div class="participant-info">
										<div class="participant-name">박보람 주임</div>
										<div class="participant-department">닥터미소 코스메틱 마케팅팀</div>
									</div>
									<div class="chat-image">
										<img alt="" src="${pageContext.request.contextPath}/dist/images/project/chat.png">
									</div>									
								</div>
								<div class="participant-item">
									<div class="participant-image">
										<div class="participant-image">
											<img alt="" src="${pageContext.request.contextPath}/dist/images/project/employee_img1.png">
										</div>									
									</div>
									<div class="participant-info">
										<div class="participant-name">송이현 PD</div>
										<div class="participant-department">필름스튜디오 편집</div>
									</div>
									<div class="chat-image">
										<img alt="" src="${pageContext.request.contextPath}/dist/images/project/chat.png">
									</div>								
								</div>
								<div class="participant-item">
									<div class="participant-image">
										<div class="participant-image">
											<img alt="" src="${pageContext.request.contextPath}/dist/images/project/employee_img1.png">
										</div>									
									</div>
									<div class="participant-info">
										<div class="participant-name">장민준 감독</div>
										<div class="participant-department">필름스튜디오 촬영</div>
									</div>
									<div class="chat-image">
										<img alt="" src="${pageContext.request.contextPath}/dist/images/project/chat.png">
									</div>									
								</div>

								<!-- 하단 버튼 -->
								<div class="participant-actions">
									<button class="chat-btn">💬 채팅</button>
									<button class="meeting-btn">🎥 화상회의</button>
								</div>

							</div>

						</div>

					</div>


				</div>

			</div>

		</div>

	</main>




<script type="text/javascript">


/* 차트 */
var data = [
	{ x: 'DB 설계', y: [new Date('2024-01-02').getTime(), new Date('2024-02-03').getTime()], fillColor: '#FF5733' },
    { x: '디자인 작업', y: [new Date('2024-01-30').getTime(), new Date('2024-02-25').getTime()], fillColor: '#33FF57' },
    { x: '기능 개발', y: [new Date('2024-02-15').getTime(), new Date('2024-03-30').getTime()], fillColor: '#337BFF' },
    { x: '테스트', y: [new Date('2024-03-20').getTime(), new Date('2024-04-10').getTime()], fillColor: '#FF33D4' },
    { x: '오류수정', y: [new Date('2024-04-01').getTime(), new Date('2024-04-29').getTime()], fillColor: '#32174d' },
];

//X축의 최소/최대 날짜 계산
let minDate = Math.min(...data.map(item => item.y[0]));  // 가장 이른 시작 날짜
let maxDate = Math.max(...data.map(item => item.y[1]));  // 가장 늦은 종료 날짜

//X축 눈금 개수 동적 계산 (월 단위 설정)
let monthDiff = Math.ceil((maxDate - minDate) / (1000 * 60 * 60 * 24 * 30)); // 개월 수 계산


var options = {
        chart: {
            type: 'rangeBar',
            height:250,
            toolbar: {
                show: false
            }
        },
        plotOptions: {
            bar: {
                horizontal: true
            }
        },
        series: [{
        	
        	data: data
        }],
        xaxis: {
            type: 'datetime',
            min: minDate, // 시작일 설정
            max: maxDate, // 종료일 설정
            tickAmount: monthDiff,
            labels: {
                formatter: function(value) {
                    let date = new Date(value);
                    return (date.getMonth() + 1) + '월';
                }
            },
            axisBorder: {
                show: false  // X축 선 제거
            },
            axisTicks: {
                show: false  // X축 눈금 제거
            }           
        },
        yaxis: {
            labels: {
            	show: false    
            }
        },
       
        dataLabels: {
            enabled: true,
            formatter: function(value, { dataPointIndex, w }) {
                return w.config.series[0].data[dataPointIndex].x; // X 값을 그대로 표시
            },
            style: {
                fontSize: '14px'
            }
        },   
        
        legend: {
            position: 'bottom'
        }
    };

	var chart = new ApexCharts(document.querySelector("#stage-chart"), options);
	chart.render();
	
</script>


<script type="text/javascript">

document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".task-progress-bar div").forEach(function (bar) {
        let width = bar.getAttribute("data-width"); // data-width 값 가져오기
        bar.style.width = width + "%"; // width 적용
    });
});


</script>


<script>

// 드롭다운 요소 가져오기
const dropdown = document.getElementById('customDropdown');
const toggle = dropdown.querySelector('.dropdown-toggle');
const menu = dropdown.querySelector('.dropdown-menu');
const label = dropdown.querySelector('.dropdown-label');
const opts = dropdown.querySelectorAll('.dropdown-option');

// 드롭다운 열고/닫기
toggle.addEventListener('click', (e) => {
    // 부모 요소에 클래스 'open'을 토글
    dropdown.classList.toggle('open');
});

// 옵션 클릭 시 선택 및 드롭다운 닫기
opts.forEach((option) => {
    option.addEventListener('click', (e) => {
        label.textContent = e.target.textContent; // 선택한 옵션 텍스트 표시
        dropdown.classList.remove('open'); // 드롭다운 닫기
    });
});

// 드롭다운 영역 밖 클릭 시 닫기
window.addEventListener('click', (e) => {
    if (!dropdown.contains(e.target)) {
        dropdown.classList.remove('open');
    }
});
</script>


<!-- stage-progress-bar -->
<script type="text/javascript">
(function( $ ) {
    "use strict";
    $(function() {
        function animated_contents() {
            $(".stage-progress-bar > div ").each(function (i) {
                var $this  = $(this),
                    skills = $this.data('width');

                $this.css({'width' : skills + '%'});

            });
        }
        
        if(jQuery().appear) {
            $('.stage-progress-bar').appear().on('appear', function() {
                animated_contents();
            });
        } else {
            animated_contents();
        }
    });
}(jQuery));
</script>

</body>
</html>