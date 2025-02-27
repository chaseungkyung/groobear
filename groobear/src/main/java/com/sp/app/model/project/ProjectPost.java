package com.sp.app.model.project;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ProjectPost {
	private long postIdx;
	private long projIdx;
	
	private long projMemberIdx;
	private long empIdx;
	private String empName;
	
	private String title;
	private String content;
	private String regDate;
	private String updateDate;
	
	// 첨부파일
	private long fileIdx;
	private String originalFilename;
	private String saveFilename;
	

}
