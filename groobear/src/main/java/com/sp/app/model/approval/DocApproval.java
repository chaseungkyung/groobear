package com.sp.app.model.approval;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class DocApproval {
	
	private Long aprIdx;
	private Long empIdx;
	private String deptName;
	private String teamName;
	private String positionCode;
	private String docType;
	private String regDate;
	private String paymentStage;
	private int status;
	private String decisionAt;
	private String reason;

}
