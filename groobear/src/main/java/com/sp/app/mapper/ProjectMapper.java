package com.sp.app.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.model.Project;
import com.sp.app.model.project.ProjectMember;

@Mapper
public interface ProjectMapper {
	public List<Project> listTeam(Map<String, Object> map) throws SQLException;
	public List<Project> listEmpName(Map<String, Object> map) throws SQLException;
	
	
	public void insertProject(Project dto) throws SQLException;

	public int dataCount(Map<String, Object> map);
	public List<Project> listProject(Map<String, Object> map);
	
	public void updateProject(Project dto) throws SQLException;
	public Project findById(long projIdx) throws SQLException;
	
	
	public void insertProjectMember(ProjectMember dto);
	
	
}
