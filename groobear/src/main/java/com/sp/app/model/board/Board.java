package com.sp.app.model.board;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Board {

	//게시판
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
}
