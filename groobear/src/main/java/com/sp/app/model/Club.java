package com.sp.app.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Club {
	private long num;
	private String empCode;
	private String empName;
	private String subject;
	private String content;
	private String imageFilename;
	private String reg_date;
	private int block;
	
	private MultipartFile selectFile;
}

