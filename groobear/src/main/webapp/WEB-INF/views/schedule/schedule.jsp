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
		html, body { height: 100%; }
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/scheduleHeader.jsp"/>
	<main>
		<div class="mainInner">
			<div id="calendar">
			</div>
			<!-- 일정 상세 보기 Modal -->
			<div class="modal fade" id="myDialogModal" tabindex="-1" aria-labelledby="myDialogModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myDialogModalLabel">일정 상세 보기</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body pt-1">
							<table class="table">
								<tr>
									<td colspan="2" class="text-center align-middle">
										<p class="form-control-plaintext view-subject"></p>
									</td>
								</tr>
								<tr>
									<td class="bg-light col-2 align-middle">일정분류</td>
									<td>
										<p class="form-control-plaintext view-category"></p>
									</td>
								</tr>
			
								<tr>
									<td class="bg-light col-2 align-middle">날 짜</td>
									<td>
										<p class="form-control-plaintext view-period"></p>
									</td>
								</tr>
			
								<tr>
									<td class="bg-light col-2 align-middle">일정반복</td>
									<td>
										<p class="form-control-plaintext view-repeat"></p>
									</td>
								</tr>
			
			 					<tr>
									<td class="bg-light col-2 align-middle">등록일</td>
									<td>
										<p class="form-control-plaintext view-reg_date"></p>
									</td>
								</tr>
			
			 					<tr>
									<td class="bg-light col-2 align-middle">메 모</td>
									<td>
										<p class="form-control-plaintext view-memo"></p>
									</td>
								</tr>
							</table>
							
							<table class="table table-borderless">
								<tr>
									<td class="text-end">
										<button type="button" class="btn btn-outline-primary btnScheduleUpdate">일정 수정</button>
						    			<button type="button" class="btn btn-outline-danger btnScheduleDelete">일정 삭제</button>
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
					right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
				},
				initialView: 'dayGridMonth', // 처음 화면에 출력할 뷰
				locale: 'ko',
				editable: true,
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
					let url = '${pageContext.request.contextPath}/schedule/month';
					let startDate = info.startStr.substr(0, 10);
					let endDate = info.endStr.substr(0, 10);
					let formData = 'start=' + startDate + '&end=' + endDate;
		            
					const fn = function(data){
						
						// - Fullcalendar에서 startTime과 endTime의 속성명을 가진 객체 배열을 
						//   successCallback() 에 넘기면 시간 일정에서 이상한 현상이 발생한다.
						let arr = []
						for(let item of data.list) {
							let obj = {};
							
							// fullcalendar 속성
							obj.id = item.scheduleIdx;
							obj.title = item.title;
							if( item.startTime ) {
								obj.allDay = false;
							} else {
								obj.allDay = true;
							}
							obj.start = item.start;
							obj.end = item.end;
							obj.color = item.color;
		
							// 기타 속성
							obj.categoryIdx = item.categoryIdx;
							obj.startDate = item.startDate;
							obj.stime = item.startTime;
							obj.endDate = item.endDate;
							obj.etime = item.endTime;
							obj.repeat = item.repeat;
							obj.repeat_cycle = item.repeat_cycle;
							obj.reg_date = item.reg_date;
							obj.memo = item.memo;
							
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
					insertSchedule(info.startStr, info.endStr, info.allDay);
					
					calendar.unselect(); // 현재 선택된 영역을 지움			
				},
				eventClick: function(info) {
					// 일정 제목을 선택한 경우
		
					//  상세 일정 보기
					viewSchedule(info.event);
				},
				eventDrop: function(info) {
					// 일정을 드래그 한 경우
					
					// 수정하기
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
		function insertSchedule(startStr, endStr, allDay) {
			let qs;
			
			if( allDay ) {
				qs = 'startDate=' + startStr;
				if(endStr) {
					endStr = daysLater(endStr, -1); // 종일 일정인 경우 끝나는 날짜가 +1 로 선택 되므로 -1 함 
					qs += '&endDate=' + endStr;
				}
				qs += '&all_day=1';
			} else {
				qs = 'startDate=' + startStr.substr(0, 10);
				qs += '&endDate=' + endStr.substr(0, 10);
				qs += '&startTime=' + startStr.substr(11, 5);
				qs += '&endTime=' + endStr.substr(11, 5);
				qs += '&all_day=0';
			}
		
			location.href = '${pageContext.request.contextPath}/schedule/write?' + qs;
		}
		
		// 일정 상세 보기
		function viewSchedule(calEvent) {
			$('#myDialogModal').modal('show');
			
			// console.log(calEvent);
			
			let num = calEvent.id;
			let title = calEvent.title;
			let color = calEvent.backgroundColor;
			// let start = calEvent.start;
			// let end = calEvent.end;
			let start = calEvent.startStr;
			let end = calEvent.endStr;
			let allDay = calEvent.allDay;
		
			let categoryIdx = calEvent.extendedProps.categoryIdx;
			if(! categoryIdx) categoryIdx = 0;
			let categorys = ['개인일정', '부서일정', '전체일정'];
			
			let startDate = calEvent.extendedProps.startDate;
			let endDate = calEvent.extendedProps.endDate;
			let startTime = calEvent.extendedProps.stime;
			let endTime = calEvent.extendedProps.etime;
			
			let memo = calEvent.extendedProps.memo;
			if(! memo) memo = '';
			let reg_date = calEvent.extendedProps.reg_date;
			let repeat = calEvent.extendedProps.repeat;
			let repeat_cycle = calEvent.extendedProps.repeat_cycle;
			
			$('.btnScheduleUpdate').attr('data-num', num);
			$('.btnScheduleDelete').attr('data-num', num);
			
			let s;
			$('.view-subject').html(title);
			
			s = allDay ? '종일일정' : '시간일정';
			$('.view-category').html(categorys[categoryIdx-1] + ', ' + s);
		
			s = startDate;
			if( startTime ) {
				s += ' ' + startTime;
			}
			if( endDate && allDay ) {
				endDate = daysLater(endDate, -1);
				if(startDate < endDate) {
					s += ' ~ ' + endDate;
				}
			} else if( endDate ) {
				s += ' ~ ' + endDate;
			}
			if( endTime ) s += ' ' + endTime;
			$('.view-period').html(s);
			
			$('.view-reg_date').html(reg_date);
			
			s = repeat != 0 && repeat_cycle != 0 ? '반복일정, 반복주기 ' + repeat_cycle + '년' : '반복안함';
			$('.view-repeat').html(s);
			
			$('.view-memo').html(memo);
		}
		
		$(function(){
			// 일정 수정 화면
			$('.btnScheduleUpdate').click(function(){
				let num = $(this).attr('data-num');
				location.href = '${pageContext.request.contextPath}/schedule/update?num=' + num;
			});
		
			// 일정 삭제
			$('.btnScheduleDelete').click(function(){
				if(! confirm('일정을 삭제 하시겠습니까 ? ')) {
					return false;
				}
				
				const fn = function(data){
					var event = calendar.getEventById(num);
			        event.remove();
			        
			        $('#myDialogModal').modal('hide');
				};
				
				let num = $(this).attr('data-num');
				let formData = 'num=' + num;
				let url = '${pageContext.request.contextPath}/schedule/delete';
		
				ajaxRequest(url, 'post', formData, 'json', fn);
			});
		});
		
		// 일정을 드래그한 경우 일정 수정
		function updateDrag(calEvent) {
			let num = calEvent.id;
			let title = calEvent.title;
			let color = calEvent.backgroundColor;
			let start = calEvent.startStr;
			let end = calEvent.endStr;
			let allDay = calEvent.allDay;
			
			let categoryIdx = calEvent.extendedProps.categoryIdx;
			if(! categoryIdx) categoryIdx = 0;
			
			let memo = calEvent.extendedProps.memo;
			if(! memo) memo = '';
			let repeat = calEvent.extendedProps.repeat;
			let repeat_cycle = calEvent.extendedProps.repeat_cycle;
			
			let startDate='', endDate='', startTime='', endTime='', all_day='';
			if(allDay) {
				startDate = start;
				endDate = end;
				all_day = '1';
			} else {
				startDate = start.substr(0, 10);
				endDate = end.substr(0, 10);
				startTime = start.substr(11, 5);
				endTime = end.substr(11, 5);
			}
			
			let formData = 'scheduleIdx=' + num + '&title=' + title
					+ '&categoryIdx=' + categoryIdx + '&color=' + color
					+ '&all_day=' + all_day
					+ '&startDate=' + startDate + '&endDate=' + endDate
					+ '&startTime=' + startTime + '&endTime=' + endTime
					+ '&repeat=' + repeat + '&repeat_cycle=' + repeat_cycle
					+ '&memo=' + memo;
			
			let url = '${pageContext.request.contextPath}/schedule/updateDrag';
		
			const fn = function(data) {
				// 모든 소스의 이벤트를 다시 가져와 화면에 다시 렌더링
				calendar.refetchEvents();
			};
			
			ajaxRequest(url, 'post', formData, 'json', fn);
		}
		
		$(function(){
			// 모달창이 닫힐때 aria-hidden="true"와 포커스 충돌로 발생하는 에러 해결
			$('#myDialogModal').on('hide.bs.modal', function () {
				$('button, input, select, textarea').each(function () {
			        $(this).blur();
			    });
			});
		});
	</script>
</body>
</html>