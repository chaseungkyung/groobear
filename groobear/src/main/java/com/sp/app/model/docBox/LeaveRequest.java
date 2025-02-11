package com.sp.app.model.docBox;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class LeaveRequest {

	private Long lvReqIdx;
	private Long aprIdx;
	private int leaveType;
	private String startDate;
	private String endDate;
	private String leaveDays;
	private String leaveReason;
	private String remarks;
	
}
