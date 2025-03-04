package com.sp.app.project.model;

import com.sp.app.model.board.Board;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ProjectPost extends Board {	
	private long projIdx;	
	private long projMemberIdx;		
	
	/*
	// 게시판
	private long postIdx;
	private long empIdx;
	private String empName;
	private String title;
	private String content;
	private String regDate;
	private String updateDate;

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
	*/
}
