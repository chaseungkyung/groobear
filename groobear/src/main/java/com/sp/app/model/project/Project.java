package com.sp.app.model.project;

import com.sp.app.model.core.OrgUnit;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Project extends OrgUnit {
	private long projIdx; // 프로젝트 idx
	private String projName; // 프로젝트 이름

	private String createdAt; // 프로젝트 생성일
	private String startDate; // 프로젝트 시작일
	private String endDate; // 프로젝트 종료일

	private int status; // 상태 값

	// Project Manager
	private long pmEmpIdx; // 프로젝트 매니저 idx
	private String pmEmpName; // 프로젝트 매니저 이름
}
