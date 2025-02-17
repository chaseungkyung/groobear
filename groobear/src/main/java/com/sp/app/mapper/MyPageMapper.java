package com.sp.app.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.model.Member;

@Mapper
public interface MyPageMapper {
	public List<Member> workList(Map<String, Object> map) throws SQLException;
	public List<Member> timeKeeping(Map<String, Object> map) throws SQLException;
	public List<Member> paidOffTime(Map<String, Object> map) throws SQLException;
	
	// 부장급 검색
	public Member findByEmpCode(String empCode);
}
