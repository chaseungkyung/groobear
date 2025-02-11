package com.sp.app.model.approval;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ApprovalLine {

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
	
}
