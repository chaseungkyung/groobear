package com.sp.app.model.project;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ProjectMember {
	private long projIdx;
	private long empIdx;
	private String empName;
	private String teamName;
	private String role;
}
