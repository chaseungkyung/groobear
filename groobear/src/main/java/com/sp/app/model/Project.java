package com.sp.app.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Project {
	private long projIdx; // 프로젝트 idx
	private String projName; // 프로젝트 이름
	
	private String deptIdx; // 부서 코드 개발부 'F'
	private String teamIdx; // 팀 코드 51 52 53 54 55
	private String teamName; // 개발부 팀 이름
	private long empIdx; // 프로젝트 매니저 idx
	private String empName; // 프로젝트 매니저 이름
	
	private String createdAt; // 프로젝트 생성일
	private String startDate; // 프로젝트 시작일
	private String endDate; // 프로젝트 종료일
	private int status;       // 상태 값
	
}
