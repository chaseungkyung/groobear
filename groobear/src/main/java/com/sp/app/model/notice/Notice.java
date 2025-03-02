package com.sp.app.model.notice;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Notice {
	
	//공지사항
	private long noticeIdx;
	private long empIdx;
	private String empName;
	private String title;
	private String content;
	private String regDate;
	private String updateDate;
	private int showNotice;

	//파일
	private long fileIdx;
	private String originalFilename;
	private String saveFilename;
	private int fileCount;
	
	//스프링에서 파일 받기
	private List<MultipartFile> selectFile;
	private long gap;
	
	//댓글
	private int replyCount;
}
