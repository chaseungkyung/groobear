package com.sp.app.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.model.Member;

@Mapper
public interface SettingMapper {
	public void updateEmpPwd(Member dto) throws SQLException;
	public void updateEmployeeDetail(Member dto) throws SQLException;
	
	public Member findByEmpIdx(Long empIdx);
	public String getEmpCode(Long empIdx);
	
	public List<Member> listFindEmployee(Map<Long, Object> map);
}
