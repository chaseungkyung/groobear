package com.sp.app.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.model.Member;

@Mapper
public interface MemberMapper {
	public List<Member> listDepartment(Map<String, Object> map);
	public List<Member> listTeam(Map<String, Object> map);
	public List<Member> listPosition(Map<String, Object> map);
	
	// 마지막 사번 가져오기
	public String getLastEmpCode(String empCode);
	
	// 조건 검색
	public List<Member> getStatusList(Map<String, Object> map);
	
	public Long insertEmployee(Member dto) throws SQLException;
	public void insertEmployeeDetail(Member dto) throws SQLException;
	public void insertEmployeeHistory(Member dto) throws SQLException;
	public void insertEmployeeHistory2(Member dto) throws SQLException;
	
	// 마지막 로그인
	public void updateLastLogin(String empCode) throws SQLException;
	
	// 재직상태 업데이트
	public void updateMemberStatus(Map<String, Object> map) throws SQLException;
	
	public void updateEmployee(Member dto) throws SQLException;
	public void updateEmployee2(Member dto) throws SQLException;
	public void updateEmployeeDetail(Member dto) throws SQLException;
	public void updateEmployeeHistory(Member dto) throws SQLException;
	
	// 로그인 
	public int checkFailureCount(String empCode);
	public void updateFailureCountReset(String empCode) throws SQLException;
	public void updateFailureCount(String empCode) throws SQLException;
	 
	// 홈 
	public Member findByProfile(long empIdx);
	public void insertWorklog(long empIdx);
	
	
	public Member findByEmpIdx(long empIdx);
	public List<Member> getEmpRecord(long empIdx) throws SQLException;
	public String getDeptName(String deptIdx) throws SQLException;
	public String getTeamName(String teamIdx) throws SQLException;
	public String getPositionName(long positionCode) throws SQLException;
	public Member lastEmpHistory(long empIdx) throws SQLException;
	
	// 사번 찾기
	public Member findByEmpCode(String emdCode);
	
	public List<Member> listMember(Map<String, Object> map);
	public List<Member> listFindMember(Map<String, Object> map);
	public List<Member> listMemberAll();
	
	public int dataCount(Map<String, Object> map);
}
