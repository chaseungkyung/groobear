package com.sp.app.model.docBox;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ApprovalReq {

	private Long aprReqIdx;
	private Long aprIdx;
	private String title;
	private String content;
	private String remarks;
	
}
