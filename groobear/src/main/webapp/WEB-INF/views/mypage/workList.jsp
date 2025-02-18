<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/layout/headerResources.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/mypage/list.css"
	type="text/css">
<script src="https://cdn.jsdelivr.net/npm/echarts@5.3.3/dist/echarts.min.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<jsp:include page="/WEB-INF/views/layout/mypageHeader.jsp" />

	<main>
	<h3>근무 현황</h3>
		<div class="mainInner">
			<div>
				<button type="button" class="" onclick="" style="background-color: #2f5ea2; color: white;">근무 현황</button>
				<button type="button" class="" onclick="" style="background-color: #2f5ea2; color: white;">근태 내역</button>
				<button type="button" class="" onclick="" style="background-color: #2f5ea2; color: white;">휴가 내역</button>
			</div>
			<form action="">
				<div class="wlListArea">
					<ul>
						<li class="workTime">8h 12m</li>
					</ul>
					<ul class="timeTable"></ul>
					
					<div class="workChart" style="height:400px;">차트</div>
				</div>
			</form>
		</div>
	</main>

<script type="text/javascript">
$(function(){
    let url = '${pageContext.request.contextPath}/mypage/charts';
    
    function fetchUpdateChart() {
        $.getJSON(url, function(data) {
        	
            if (data.state === 'true') {
                drawWorkChart(data); 
                
                document.getElementById("workTime").textContent = Math.floor(data.secWorked / 60) + "분";
            } else {
                console.log('차트 데이터를 불러오는 데 실패했습니다.');
            }
        });
    }

    setInterval(fetchUpdateChart, 60000);

    function drawWorkChart(data) {
  	
    	var chartDom = document.getElementById('main');
    	var myChart = echarts.init(chartDom);
    	var option;

    	var secondsWorked = data.secWorked;
    	
    	option = {
    	  tooltip: {
    	    formatter: '{a} <br/>{b} : {c}분'
    	  },
    	  series: [
    	    {
    	      name: '근무 시간',
    	      type: 'gauge',
    	      progress: {
    	        show: true
    	      },
    	      detail: {
    	        valueAnimation: true,
    	        formatter: '{value}분'
    	      },
    	      data: [
    	        {
    	          value: Math.floor(secondsWorked / 60),
    	          name: '근무 시간'
    	        }
    	      ]
    	    }
    	  ]
    	};

    	option && myChart.setOption(option);
    }
    fetchUpdateChart();
});
  
</script>

</body>
</html>