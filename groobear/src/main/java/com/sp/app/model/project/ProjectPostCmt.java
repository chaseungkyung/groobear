package com.sp.app.model.project;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ProjectPostCmt {
	private long postIdx;
	private long projMemberIdx;
	private long empIdx;
	private String empName;
	
	private String regDate;
	private String content;
}
