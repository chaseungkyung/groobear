package com.sp.app.mapper;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.model.Project;

@Mapper
public interface ProjectMapper {
	public void insertProject(Project dto) throws SQLException;
	public Long findByPMname(String empName) throws SQLException;
}
