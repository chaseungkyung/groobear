package com.sp.app.model.project;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ProjectMember {
	private long projIdx;

	// 사원정보
	private String empIdx;
	private String empName;
	private String teamName;

	// 프로젝트 팀 정보
	private String projTeamIdx;
	private String projTeamName;
}
