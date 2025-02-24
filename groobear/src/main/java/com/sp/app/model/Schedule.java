package com.sp.app.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Schedule {
	private long scheduleIdx;
	private String empCode;
	private String deptCode;
	private String title;
	private int categoryIdx;
	private String color;
	private String startDate;
	private String endDate;
	private String startTime;
	private String endTime;
	private int repeat;
	private int repeat_cycle;
	private String memo;
	private String reg_date;
	private long positionCode;
	
	private String all_day;
	
	// FullCalendar 에서 사용하는 필드
	private String start;
	private String end;
}
