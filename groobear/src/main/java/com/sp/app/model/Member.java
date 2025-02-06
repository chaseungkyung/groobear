package com.sp.app.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Member {
	
	// 사원 table
	private long empIdx;
	private String empCode;
	private String empName;
	private String empPwd;
	private String deptIdx;
	private String teamIdx;
	private String empRank;
	private String empTel;
	private String empStatus;
	private String hireDate;
	private String retireDate;
	private String lastLogin;
	private String loginFails;

	// 사원 상세 table
	private String birth;
	private String email;
	private String tel;
	private String zipCode;
	private String addrMain;
	private String addrSub;
	
	// 사원 이력 table
	private long historyIdx;
	private String startDate;
	private String endDate;
	private String deptName;
	private String teamName;
	private String empHistoryRank;
	private String note;
}