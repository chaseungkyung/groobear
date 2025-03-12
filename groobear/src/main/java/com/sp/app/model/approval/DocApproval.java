package com.sp.app.model.approval;

import com.sp.app.model.Member;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class DocApproval extends Member {
	
	private Long aprIdx;
	private String docType;
	private String regDate;
	private String paymentStage;
	private int status;
	private String decisionAt;
	private String reason;
	private String docUrl;
	
}
