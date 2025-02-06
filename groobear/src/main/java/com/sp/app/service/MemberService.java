package com.sp.app.service;

import java.util.List;
import java.util.Map;

import com.sp.app.model.Member;

public interface MemberService {
	
	public Member loginMember(String empCode);
	
	public void insertEmployee(Member dto) throws Exception;
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
	
	public Member findByEmpIdx(String empIdx);
	
	public List<Member> listFindMember(Map<String, Object> map);
	public List<Member> listMember(Map<String, Object> map);
	
}
