<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/headerResources.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/menu/listMenu.css" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/dist/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>
	<style type="text/css">
		.fc-scrollgrid-sync-table {height: 650px !important;}
		.fc-view-harness {height: 671px !important;}
		html, body { height: 100%; }
		/* 일요일 날짜 빨간색 */
		.fc-day-sun a {
		  color: red;
		  text-decoration: none;
		}
		
		/* 토요일 날짜 파란색 */
		.fc-day-sat a {
		  color: blue;
		  text-decoration: none;
		}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/reservationHeader.jsp"/>
	<main>
		<div class="mainInner">
			<div id="calendar" data-cabinet="${cabinet}">
			</div>
			<!-- 일정 상세 보기 Modal -->
			<div class="modal fade" id="myDialogModal" tabindex="-1" aria-labelledby="myDialogModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myDialogModalLabel">예약 상세 보기</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body pt-1">
							<table class="table">
								<tr>
									<td class="text-center align-middle">제 목</td>
									<td>
										<p class="form-control-plaintext view-subject"></p>
									</td>
								</tr>
								<tr>
									<td class="bg-light col-2 align-middle">장 소</td>
									<td>
										<p class="form-control-plaintext view-cabinet">${cabinet} 회의실</p>
									</td>
								</tr>
			
								<tr>
									<td class="bg-light col-2 align-middle">예약날짜</td>
									<td>
										<p class="form-control-plaintext view-period"></p>
									</td>
								</tr>
			
								<tr>
									<td class="bg-light col-2 align-middle">예약자명</td>
									
									<td>
										<p class="form-control-plaintext view-empName"></p>
									</td>
								</tr>
			
			 					<tr>
									<td class="bg-light col-2 align-middle">등록일</td>
									<td>
										<p class="form-control-plaintext view-regDate"></p>
									</td>
								</tr>
			
			 					<tr>
									<td class="bg-light col-2 align-middle">사용시간</td>
									<td>
										<p class="form-control-plaintext view-time"></p>
										<p class="form-control-plaintext view-empCode"></p>
									</td>
								</tr>
							</table>							
							
							<table class="table table-borderless">								
								<tr>
									<td class="text-end">
						    			<button type="button" class="btn btn-outline-danger btnReservationDelete">예약 취소</button>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<script type="text/javascript" src="${pageContext.request.contextPath}/dist/vendor/fullcalendar6/dist/index.global.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/dist/vendor/fullcalendar6/dist/locales-all.global.min.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/dist/js/dateUtil.js"></script>
	
	<script type="text/javascript">
		var calendar = null; 
			
		document.addEventListener('DOMContentLoaded', function() {
			const calendarEl = document.getElementById('calendar');
		
			calendar = new FullCalendar.Calendar(calendarEl, {
				headerToolbar: {
					left: 'prev,next today',
					center: 'title',
					right: 'dayGridMonth,listWeek'
				},
				buttonText: {
					month: '달력',
					list: '목록'
				},
				initialView: 'dayGridMonth', // 처음 화면에 출력할 뷰
				locale: 'ko',
				navLinks: true, // 일자 클릭 시 일자내 시간 스케줄 화면으로 이동
				dayMaxEvents: true, 
				dayCellContent : function(info) { // 숫자 뒤에 일 삭제
					var number = document.createElement("span");
					number.classList.add("fc-daygrid-day-number");
					number.innerHTML = info.dayNumberText.replace("일", "").replace("日", "");
					if(info.view.type === "dayGridMonth") {
						return {
							html : number.outerHTML
						};
					}
					return {
						domNodes : []
					};
				},
				events: function(info, successCallback, failureCallback) {
					let url = '${pageContext.request.contextPath}/reservation/month';					
					let reservDate = info.startStr.substr(0, 10);
					let startDate = info.startStr.substr(0, 10);
					let endDate = info.endStr.substr(0, 10);
					let cabinet = $('#calendar').attr('data-cabinet');
					let formData = 'start=' + startDate + '&end=' + endDate + '&cabinet=' + cabinet;
		            
					const fn = function(data){
						
						// - Fullcalendar에서 startTime과 endTime의 속성명을 가진 객체 배열을 
						//   successCallback() 에 넘기면 시간 일정에서 이상한 현상이 발생한다.
						let arr = []
						for(let item of data.list) {
							let obj = {};
							
							// fullcalendar 속성
							obj.id = item.reservIdx;
							obj.title = item.title;
							obj.start = item.start;
							obj.end = item.end;
		
							// 기타 속성
							obj.cabinet = item.cabinet;
							obj.empName = item.empName;
							obj.stime = item.startTime;
							obj.etime = item.endTime;
							obj.regDate = item.regDate;
							
							arr.push(obj);
						}
							successCallback(arr);							
					};
		        	
		        	ajaxRequest(url, 'get', formData, 'json', fn);
					
				},
				selectable: true,
				selectMirror: true, // timeView에서 드래그시 상단에 드래그한 시간 출력여부
				select: function(info) {
					// 날짜의 셀을 선택하거나 드래그한 경우(빈 영역)
					// console.log(info);
					
					// 입력 폼 출력
					insertReservation(info.startStr, info.endStr, info.allDay);
					
					calendar.unselect(); // 현재 선택된 영역을 지움			
				},
				eventClick: function(info) {
					// 일정 제목을 선택한 경우
		
					//  상세 일정 보기
					viewReservation(info.event);
				},
				eventDrop: function(info) {
					// 일정을 드래그 한 경우
					updateDrag(info.event);
				},
				eventResize: function(info) {
					// 일정의 크기를 변경 한 경우
					
					// 수정하기
					updateDrag(info.event);
				},
				loading: function(bool) {
				},
				
			});
			calendar.render();
		});
		
		// 일정 등록 폼
		function insertReservation(startStr, endStr) {
			let qs;
			
			if( allDay ) {
				qs = 'reservDate=' + startStr;				
			} else {
				qs = 'reservDate=' + startStr.substr(0, 10);
				qs += '&startTime=' + startStr.substr(11, 5);
				qs += '&endTime=' + endStr.substr(11, 5);
			}
			
			qs += '&cabinet=${cabinet}';
		
			location.href = '${pageContext.request.contextPath}/reservation/write?' + qs;
		}
		
		// 일정 상세 보기
		function viewReservation(calEvent) {
			$('#myDialogModal').modal('show');
			
			console.log(calEvent);
			
			let num = calEvent.id;
			let title = calEvent.title;
			let start = calEvent.startStr;
			let end = calEvent.endStr;
			let empName = calEvent.extendedProps.empName;
			
			let cabinet = calEvent.extendedProps.cabinet;
			if(! cabinet) cabinet = 0;
			let cabinets = ['A회의실', 'B회의실', 'C회의실'];
			let reservDate = calEvent.startStr;						
			let startTime = calEvent.extendedProps.stime;
			let endTime = calEvent.extendedProps.etime;
			
			let regDate = calEvent.extendedProps.regDate;
			
			$('.btnReservationDelete').attr('data-num', num);
			
			let s;
			$('.view-subject').html(title);
			
			$('.view-cabinet').html(cabinets[cabinet]);
		
			let idx = reservDate.indexOf('T');
			s = reservDate;
			if(idx>=10) {
				s = reservDate.substring(0, idx);
			}
			$('.view-period').html(s);
			
			if( startTime ) {
				s += ' ' + startTime;
			}
			if( endTime ) s += ' ~ ' + endTime;
			$('.view-time').html('.view-period').html(s);
			
			$('.view-regDate').html(regDate);
			
			$('.view-empName').html(empName);
		}

		$(function(){		
			// 예약취소
			$('.btnReservationDelete').click(function(){
				if(! confirm('예약을 취소 하시겠습니까 ? ')) {
					return false;
				} 
				
				const fn = function(data){
					var event = calendar.getEventById(num);
			        event.remove();
			        
			        $('#myDialogModal').modal('hide');
				};
				
				let num = $(this).attr('data-num');
				let formData = 'num=' + num;
				let url = '${pageContext.request.contextPath}/reservation/delete';
		
				ajaxRequest(url, 'post', formData, 'json', fn);
			});
		});
		
		$(function(){
			// 모달창이 닫힐때 aria-hidden="true"와 포커스 충돌로 발생하는 에러 해결
			$('#myDialogModal').on('hide.bs.modal', function () {
				$('button, input, select, textarea').each(function () {
			        $(this).blur();
			    });
			});
		});
		
		function cabinetName(type) {
		    $('#calendar').attr('data-cabinet', type);
		    calendar.refetchEvents();
		}
	</script>
</body>
</html>