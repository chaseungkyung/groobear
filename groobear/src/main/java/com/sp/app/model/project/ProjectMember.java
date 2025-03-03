package com.sp.app.model.project;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ProjectMember extends ProjectTeam {
	private long projMemberIdx;

	// 사원정보
	private long empIdx;
	private String empName;
	private String teamName;
	private String positionName;
	
	private long pmEmpIdx;
	private String pmEmpName;
	private String pmTeamName;

	/* 아래의 내용을 포함하고 있음.
	private long projIdx;
	private Long projTeamIdx;
	private String projTeamName;
	*/
}
