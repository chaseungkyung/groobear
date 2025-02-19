package com.sp.app.model.board;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class FileBoard {

	private long fileIdx;
	private long postIdx;
	private String originalFilename;
	private String saveFilename;
}
