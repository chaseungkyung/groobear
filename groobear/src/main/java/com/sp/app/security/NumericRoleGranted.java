package com.sp.app.security;

public class NumericRoleGranted {
	public final static int EX_EMP = 0;	// 퇴사사원
	public final static int EMP = 10;	// 사원
	public final static int HRM = 20; // 인사부 (사원관리)
	public final static int PROJECT = 30; // 프로젝트
	public final static int ADMIN = 99;	// 관리자
	
	public static int getUserLevel(String authority) {
		try {
			switch (authority) {
			case "EX_EMP" : return EX_EMP;
			case "EMP" : return EMP;
			case "HRM" : return HRM;
			case "PREJECT" : return PROJECT;
			case "ADMIN" : return ADMIN;
			}
		} catch (Exception e) {
		}
		
		return 0;
	}
	
	/*
	    인사 : 사원메뉴
	    영업부, 개발부 : 프로젝트
	    관리자 
	 */
	
}
