package com.sp.app.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.model.Member;

@Mapper
public interface MemberMapper {
	
	public Member loginMember(String empCode);
	
	public void insertEmployee(Member dto) throws SQLException;
	public void insertEmployeeDetail(Member dto) throws SQLException;
	public void insertEmployeeHistory(Member dto) throws SQLException;
	
	public void updateLastLogin(String empCode) throws SQLException;
	
	public void updateMemberStatus(Map<String, Object> map) throws SQLException;
	
	public void updateEmployee(Member dto) throws SQLException;
	public void updateEmployeeDetail(Member dto) throws SQLException;
	public void updateEmployeeHistory(Member dto) throws SQLException;
	
	public int checkFailureCount(String empCode);
	public void updateFailureCountReset(String empCode) throws SQLException;
	public void updateFailureCount(String empCode) throws SQLException;
	
	public Member findByEmpIdx(String empIdx);
	
	public List<Member> listMember(Map<String, Object> map);
	public List<Member> listFindMember(Map<String, Object> map);
	public List<Member> listMemberAll();
	
	// public List<Member> getAuthority(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
}
