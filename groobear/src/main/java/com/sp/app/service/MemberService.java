package com.sp.app.service;

import java.util.List;
import java.util.Map;

import com.sp.app.model.Member;

public interface MemberService {	
	public List<Member> listDepartment(Map<String, Object> map);
	public List<Member> listTeam(Map<String, Object> map);
	public List<Member> listPosition(Map<String, Object> map);
	
	// 마지막 사번 가져오기
	public String getLastEmpCode(String empCode);
	
	public void insertEmployee(Member dto) throws Exception;
	public void insertEmployeeDetail(Member dto) throws Exception;
	public void insertEmployeeHistory(Member dto) throws Exception;
	public void insertEmployeeHistory2(Member dto) throws Exception;
	
	public void updateLastLogin(String empCode) throws Exception;
	
	public void updateEmployee(Member dto) throws Exception;
	public void updateEmployeeDetail(Member dto) throws Exception;
	public void updateEmployeeHistory(Member dto) throws Exception;
	
	public int checkFailureCount(String empCode);
	public void updateFailureCountReset(String empCode) throws Exception;
	public void updateFailureCount(String empCode) throws Exception;
	
	public Member findByEmpIdx(long empIdx);
	public Member findByEmpCode(String emdCode);
	
	// 홈 메인
	public Member findByProfile(long empIdx);
	public void insertWorklog(long empIdx);
	
	// empHistory
	public List<Member> getEmpRecord(long empIdx) throws Exception;
	public String getDeptName(String deptIdx) throws Exception;
	public String getTeamName(String teamIdx) throws Exception;
	public String getPositionName(long positionCode) throws Exception;
	
	// emp list 
	public List<Member> listFindMember(Map<String, Object> map);
	public List<Member> listMember(Map<String, Object> map);
	public List<Member> listMemberAll();
	
	// emp list 카운트
	public int dataCount(Map<String, Object> map);
	
	// 비밀번호 확인
	public boolean isPasswordCheck(String empCode, String empPwd);	
}