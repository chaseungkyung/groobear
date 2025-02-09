package com.sp.app.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.model.project.Project;

@Mapper
public interface ProjectMapper {
	public void insertProject(Project dto) throws SQLException;
	public Long findByEmpName(String empName) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<Project> listProject(Map<String, Object> map);
	
	
}
