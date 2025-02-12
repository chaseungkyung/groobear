package com.sp.app.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class MyPage {
	
	private long empIdx;
	private String empName;
	private String deptIdx;
	private String deptName;
	private String teamIdx;
	private String teamName;
	private String positionCode;
	
	// 근무현황 : 오늘 출근해서 일하는 거
	private String workIdx;
	private String workDate;	//출근일자
	private String loginTime;
	
	// 근태내역 : 야근 추가근무 주말근무
	private long otReqIdx;		// 추가근무idx
	private long aprIdx;		// 결재서류 idx
	private String overTime;
	private String workDetail;	// 초과근무내용

	// 추가근무, 연차 서류는 docApproval 결재서류보관함 테이블 JOIN 해서 승인상태 보고 출력 ?
	
	// 연차내역
	private String leaveType;
	private String startDate;
	private String endDate;
	private String leaveReason;
	private String remarks;	// 비고
	
}
