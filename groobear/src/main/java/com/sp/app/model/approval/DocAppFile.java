package com.sp.app.model.approval;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class DocAppFile extends DocApproval {

	private Long fileIdx;
	private Long aprIdx;
	private String originalFilename;
	private String saveFilename;
	
}
