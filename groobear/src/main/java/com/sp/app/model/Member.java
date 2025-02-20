package com.sp.app.model;

import org.springframework.web.multipart.MultipartFile;

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
	private long positionCode;
	private String empTel;
	private String empStatus;
	private String hireDate;
	private String retireDate;
	private String lastLogin;
	private String loginFails;
	private String origProfile;
	private String saveProfile;

	// 사원 상세 table
	private String birth;
	private String email;
	private String tel;
	private String zipCode;
	private String addrMain;
	private String addrSub;
	private String rrn;
	
	// 사원 이력 table
	private long historyIdx;
	private String startDate;
	private String endDate;
	private String historyDeptName;
	private String historyTeamName;
	private String empHistoryRank;
	private String note;
	
	// 부서 table
	private String deptName;
	
	// 팀 table
	private String teamName;
	
	// 직책 table
	private String positionName;
	private String parentCode;
	
	private MultipartFile selectFile;
}