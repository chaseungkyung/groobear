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
	public void updateMemberEnabled(Map<String, Object> map) throws Exception;
	public void insertEmployeeDetail(Member dto) throws Exception;
	public void insertEmployeeHistory(Member dto) throws Exception;
	
	public void updateLastLogin(String empCode) throws Exception;
	public void updateMemberStatus(Map<String, Object> map) throws Exception;
	
	public void updateEmployee(Member dto) throws Exception;
	public void updateEmployeeDetail(Member dto) throws Exception;
	public void updateEmployeeHistory(Member dto) throws Exception;
	
	public int checkFailureCount(String empCode);
	public void updateFailureCountReset(String empCode) throws Exception;
	public void updateFailureCount(String empCode) throws Exception;
	
	public Member findByEmpIdx(long empIdx);
	public Member findByEmpCode(String emdCode);
	public Long getMemberIdx(String empCode);
	
	public List<Member> listFindMember(Map<String, Object> map);
	public List<Member> listMember(Map<String, Object> map);
	public List<Member> listMemberAll();
	
	public int dataCount(Map<String, Object> map);
	public boolean isPasswordCheck(String empCode, String empPwd);	
}
