package com.sp.app.model.approval;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ApprovalLine extends DocApproval {

	private Long aprIdx;
	private Long writerEmp;
	private String writerInfo;
	
	private Long apr1Emp;
	private String apr1Info;
	private int apr1Result;
	private String apr1At;
	
	private Long apr2Emp;
	private String apr2Info;
	private int apr2Result;
	private String apr2At;
	
	private Long apr3Emp;
	private String apr3Info;
	private int apr3Result;
	private String apr3At;
	
//	-----------------
	private String writerName;
	private String writerDeptName;
	private String writerTeamName;
	private String writerPositionName;
	
	private String apr1Name;
	private String apr1DeptName;
	private String apr1TeamName;
	private String apr1PositionName;
	
	private String apr2Name;
	private String apr2DeptName;
	private String apr2TeamName;
	private String apr2PositionName;
	
	private String apr3Name;
	private String apr3DeptName;
	private String apr3TeamName;
	private String apr3PositionName;
	
}
