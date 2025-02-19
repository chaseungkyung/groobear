<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/layout/headerResources.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/project/detail.css"
	type="text/css">

<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

<style type="text/css">
/* 차트 크기 조정 */
#stage-chart {
    width: 100%;
    height: 100%;
}

</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<jsp:include page="/WEB-INF/views/layout/projectHeader2.jsp" />


<main>
	<div class="mainInner">
		<div class="inner-top">
			<span class="projectName">프로젝트1</span>
			<button type="button" class="invite-button">
				<i class="bi bi-person-plus"></i> 초대하기
			</button>
		</div>

		<div class="inner-middle">
			<div class="middle-top">
				<div id="stage-chart"></div>
			</div>
			
			<div class="middle-bottom">
				<div class="bottom-left">
					<div class="left-top">
						<div class="dropdown" id="customDropdown">
					        <!-- 드롭다운 토글 버튼 -->
					        <div class="dropdown-toggle">
					            <span class="dropdown-label">선택해주세요</span>
					            <span class="dropdown-arrow"></span>
					        </div>
					        <!-- 드롭다운 옵션 리스트 -->
					        <div class="dropdown-menu">
					            <div class="dropdown-option">옵션 1</div>
					            <div class="dropdown-option">옵션 2</div>
					            <div class="dropdown-option">옵션 3</div>
					            <div class="dropdown-option">옵션 4</div>
					        </div>
					    </div>
					    

					    
					</div>
					
					<div class="left-bottom">
						
					</div>
				</div>
				
				<div class="bottom-right">
				
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
                    return (date.getMonth() + 1) + '월'; // ✅ "1월, 2월, 3월..." 형식으로 출력
                }
            },
            axisBorder: {
                show: false  // ✅ X축 선 제거
            },
            axisTicks: {
                show: false  // ✅ X축 눈금 제거
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

<script>

// 드롭다운 요소 가져오기
const dropdown = document.getElementById('customDropdown');
const toggle = dropdown.querySelector('.dropdown-toggle');
const menu = dropdown.querySelector('.dropdown-menu');
const label = dropdown.querySelector('.dropdown-label');
const options = dropdown.querySelectorAll('.dropdown-option');

// 드롭다운 열고/닫기
toggle.addEventListener('click', (e) => {
    // 부모 요소에 클래스 'open'을 토글
    dropdown.classList.toggle('open');
});

// 옵션 클릭 시 선택 및 드롭다운 닫기
options.forEach((option) => {
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

</body>
</html>