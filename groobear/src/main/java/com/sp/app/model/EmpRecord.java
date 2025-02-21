package com.sp.app.model;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class EmpRecord {

	private long historyIdx;
	private long empIdx;
	private String startDate;
	private String endDate;
	private String deptName;
	private String teamName;
	private String empRank;
	private String note;
}
