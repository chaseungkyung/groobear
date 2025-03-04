package com.sp.app.project.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ProjectPostCmt {
	private long cmtIdx;
	private long postIdx;
	private long projMemberIdx;
	private long empIdx;
	private String empName;
	
	private String regDate;
	private String content;
}
