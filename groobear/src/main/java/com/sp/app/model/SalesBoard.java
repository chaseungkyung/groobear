package com.sp.app.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class SalesBoard {
	private long postIdx;
	private String empIdx;
	private String title;
	private String content;
	private String regDate; 
	private String updateDate;
	
	private String deptIdx;
	private String empName;
	private String empState;
	
	private String saveFilename;
	private String originalFilename;
	private MultipartFile selectFilename;
	
	private int replyCount;
}
