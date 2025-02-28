package com.sp.app.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Reservation {
	private long reservIdx;
	private String empCode;
	private String empName;
	private String title;
	private String cabinet;
	private String regDate;
	private String reservDate;
	private String startTime;
	private String endTime;
	
	// FullCalendar 에서 사용하는 필드
	private String start;
	private String end;
}
