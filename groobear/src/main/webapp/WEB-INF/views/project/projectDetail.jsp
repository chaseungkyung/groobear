<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/layout/project/headerResources.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/project/projectDetail.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/project/inviteModal.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/project/teamModal.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

</head>

<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<jsp:include page="/WEB-INF/views/layout/project/projectHeader2.jsp" />
	<jsp:include page="/WEB-INF/views/project/inviteModal.jsp" />
	<jsp:include page="/WEB-INF/views/project/teamModal.jsp" />

	<main>
		<div class="mainInner">
			<div class="inner-top">
				<span class="projectName">${dto.projName}</span>
				<c:if test="${sessionScope.member.deptIdx == 'F' && sessionScope.member.empIdx == dto.pmEmpIdx}">
					<div class="btn-area">
					    <button id="teamModalBtn" class="team-button">
					        팀 편성
					    </button>
					    <button id="inviteModalBtn" class="invite-button">
					        <i class="bi bi-person-plus"></i> 초대하기
					    </button>
				    </div>
				</c:if>
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
											
						<div class="stage-progress-rate" id="progressContainer">
							<c:forEach var="dto" items="${stageList}">
							    <div class="stage-progress-bar">
							    	<div data-width="${dto.progressRate}">
								        <h3>${dto.stageName}</h3>
								        <span>${dto.progressRate}%</span>
							    	</div>
							    </div>
							</c:forEach>							
						</div>
						
						
						<div class="task-progress-rate">
							<div class="dropdown" id="customDropdown" data-stageIdx="">
								<!-- 드롭다운 토글 버튼 -->
								<div class="dropdown-toggle">
									<span class="dropdown-label">프로젝트 단계 선택</span> <span
										class="dropdown-arrow"></span>
								</div>
								<!-- 드롭다운 옵션 리스트 -->
								<div class="dropdown-menu">
									<c:forEach var="dto" items="${stageList}">
										<div class="dropdown-option" data-stageIdx="${dto.stageIdx}">${dto.stageName}</div>
									</c:forEach>
								</div>
							</div>
							
							<input type="hidden" id="projIdx" value="${projIdx}">
							<input type="hidden" id="status" value="${status}">

							<div class="task-container">
							<div class="task-progress-bar">
									<div data-width="0" style="">
										<span>0%</span>
									</div>
								</div>
							</div>
						</div>
				
					</div>

					<div class="bottom-right">
						<!-- 오른쪽 참여자 목록 -->
						<div class="project-participants">
							<div class="section-title">참여자 ${projectMemberCount}</div>

							<div class="participant-box">

								<!-- 프로젝트 관리자 -->
								<div class="pm-title">프로젝트 관리자</div>
								
								<c:forEach var="dto" items="${projectPmList}">							
									<div class="participant-item">
										<div class="participant-image">
											<img alt="" src="https://cdn-icons-png.flaticon.com/128/847/847969.png">
										</div>
										<div class="participant-info">
											<div class="participant-name">${dto.pmEmpName} </div>
											<div class="participant-department">${dto.projTeamName}</div>
										</div>
										<div class="chat-image">
											<img alt="" src="${pageContext.request.contextPath}/dist/images/project/chat.png">
										</div>
									</div>
								</c:forEach>
								
								<div class="member-title">프로젝트 멤버</div>
								
								<c:forEach var="projMember" items="${nonPmProjectMemberList}">								
									<div class="participant-item">
										<div class="participant-image">
											<div class="participant-image">
												<img alt="" src="https://cdn-icons-png.flaticon.com/128/847/847969.png">
											</div>
										</div>
										<div class="participant-info">
											<div class="participant-name">${projMember.empName} </div>
											<div class="participant-department">${projMember.projTeamName}</div>
										</div>
										<div class="chat-image">
											<img alt="" src="${pageContext.request.contextPath}/dist/images/project/chat.png">
										</div>															
									</div>
								</c:forEach>
								
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

const projIdx = ${projIdx};

/* 차트 */
$(function () {

    if (!projIdx) {
        console.error("projIdx가 없습니다.");
        return;
    }

    $.ajax({
        url: "/project/chart",
        method: "GET",
        data: { projIdx: projIdx },
        success: function (response) {
            let stageList = response.stageList;

            if (!stageList || stageList.length === 0) {
                
                return;
            }

            // 시작 날짜와 종료 날짜 찾기 (데이터 유효성 체크)
            let dateValues = stageList.map(s => new Date(s.startDate).getTime()).concat(
                stageList.map(s => new Date(s.endDate).getTime())
            );
            let minDate = Math.min(...dateValues) || new Date().getTime();
            let maxDate = Math.max(...dateValues) || new Date().getTime();

            // ApexCharts 데이터 변환
            let seriesData = stageList.map(stage => ({
                x: stage.stageName,
                y: [
                    new Date(stage.startDate).getTime(),
                    new Date(stage.endDate).getTime()
                ]
            }));

            let options = {
                series: [{ data: seriesData }],
                chart: {
                    type: "rangeBar",
                    height: 280,
                    animations: {
                        enabled: false // 애니메이션 비활성화 (리렌더링 방지)
                    },
                    toolbar: {
                        show: false
                    },
                    redrawOnParentResize: false, // 부모 크기 변경 시 차트 재렌더링 방지
                    zoom: {
                        enabled: false // 줌 기능 비활성화 (X축 유지)
                    }
                },
                plotOptions: {
                    bar: {
                        horizontal: true,
                        dataLabels: {
                            position: "center"
                        }
                    }
                },
                dataLabels: {
                    enabled: true,
                    formatter: function (val, opts) {
                        return opts.w.config.series[0].data[opts.dataPointIndex].x;
                    },
                    style: {
                        colors: ["#fff"],
                        fontWeight: "bold"
                    }
                },
                fill: {
                    type: "gradient",
                    gradient: {
                        type: "horizontal",
                        shadeIntensity: 0.5,
                        gradientToColors: ["#7B1FA2", "#26C6DA"],
                        inverseColors: false,
                        opacityFrom: 1,
                        opacityTo: 1,
                        stops: [0, 100]
                    }
                },
                xaxis: {
                    type: "datetime",
                    min: minDate, // X축 최소값 고정
                    max: maxDate, // X축 최대값 고정
                    range: maxDate - minDate, // X축 범위를 명확하게 설정
                    tickAmount: 6,
                    labels: {
                        format: "yyyy-MM"
                    }
                },
                yaxis: {
                    labels: {
                        show: false
                    }
                },
                responsive: [{
                    breakpoint: 1000,
                    options: {
                        chart: {
                            height: 320
                        }
                    }
                }]
            };

            let chart = new ApexCharts(document.querySelector("#stage-chart"), options);
            chart.render();
        },
        error: function (error) {
            console.error("Error fetching project stages:", error);
        }
    });
});



	
</script>

<!-- 프로젝트 진행률 -->
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


<script>

$(function() {
    const $dropdown = $('#customDropdown');
    
    $dropdown.on('click', '.dropdown-toggle', function() {
        $dropdown.toggleClass('open');
        return false;
    });
    
    $dropdown.on('click', '.dropdown-option', function() {
        let stageIdx = $(this).data('stageidx'); // 선택한 stageIdx 가져오기
        let stageName = $(this).text(); // 선택한 스테이지 이름 가져오기
        $('.dropdown-label').text(stageName); // 선택한 옵션 표시
        $dropdown.removeClass('open'); // 드롭다운 닫기

        // 동적으로 projIdx, status 가져오기
        let projIdx = $('#projIdx').val(); // Hidden input에서 가져오기
        let status = $('#status').val() || 0; // Hidden input에서 가져오기

        let url = '/project/fetchProjectTaskList';
        let data = { projIdx: projIdx, stageIdx: stageIdx };
        
        const fn = function(data) {
            if(data.taskList) {
                let taskContainer = $('.task-container'); 
                taskContainer.empty();
                
                let stageRate = data.stageRate || 0;
                
                let contentHtml = '';

                // Progress Bar 추가
                contentHtml += '<div class="task-progress-bar">';
                contentHtml += '  <div class="progress-inner" data-width="' + stageRate + '" style="width: 0%;">';
                contentHtml += '    <span>' + stageRate + '%</span>';
                contentHtml += '  </div>';
                contentHtml += '</div>';

                // Task List 추가
                contentHtml += '<ul class="task-list">';
                
                $.each(data.taskList, function(index, task) {
                    let taskIcon = '';

                    // status 값에 따라 이미지 변경
                    switch (task.status) {
                        case 1:
                            taskIcon = 'request.png'; // 요청
                            break;
                        case 2:
                            taskIcon = 'progress.png'; // 진행
                            break;
                        case 3:
                            taskIcon = 'complete.png'; // 완료
                            break;
                        case 4:
                            taskIcon = 'hold.png'; // 보류
                            break;
                        default:
                            taskIcon = 'default.png'; // 기본 아이콘 (예외 처리)
                    }
                	
                    let contextPath = "${pageContext.request.contextPath}";
                	               	
                    contentHtml += '<li class="task-item">';
                    contentHtml += '  <img class="task-icon" alt="" src="' + contextPath + '/dist/images/project/' + taskIcon + '">';
                    contentHtml += '  <span>' + task.taskName + '</span>';
                    contentHtml += '</li>';
                });
                contentHtml += '</ul>';

                // 최종적으로 한 번만 추가
                taskContainer.append(contentHtml);

                adjustTaskContainerHeight();
                
                $('.progress-inner').each(function() {
                    let width = $(this).data('width');
                    $(this).animate({ width: width + '%' }, 50);
                });
            }
        };
        ajaxRequest(url, 'get', data, 'json', fn);
    });
    
    $(document).on('click', function(e) {
        if (!$(e.target).closest('#customDropdown').length) {
            $dropdown.removeClass('open');
        }
    });
    
    function adjustTaskContainerHeight() {
        let taskCount = $(".task-list .task-item").length;
        let newHeight = 100 + (taskCount * 40);
        $(".task-container").css("height", newHeight + "px");
    }    
    
    
});
</script>

</body>
</html>