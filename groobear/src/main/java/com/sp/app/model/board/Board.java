package com.sp.app.model.board;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Board {

	private long postIdx;
	private long empIdx;
	private String title;
	private String content;
	private String regDate;
	private String updateDate;
}
