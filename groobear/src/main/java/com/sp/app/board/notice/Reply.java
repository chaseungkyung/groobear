package com.sp.app.board.notice;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Reply {
	
	private long cmtIdx;
	private long noticeIdx;
	private long empIdx;
	private String empName;
	private String regDate;
	private String content;
}
