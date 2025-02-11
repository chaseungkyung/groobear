package com.sp.app.model.approval;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ApprovalRef {
	
	private Long aprIdx;
	private Long empIdx;
	private String deptName;
	private String teamName;
	private String empRank;

}
