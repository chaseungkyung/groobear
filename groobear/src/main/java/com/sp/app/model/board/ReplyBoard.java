package com.sp.app.model.board;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ReplyBoard {
	
	private long cmtIdx;
	private long postIdx;
	private long empIdx;
	private String regDate;
	private String content;
	
}
