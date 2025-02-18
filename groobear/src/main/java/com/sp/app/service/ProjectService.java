package com.sp.app.service;

import java.util.List;
import java.util.Map;

import com.sp.app.model.Project;
import com.sp.app.model.project.ProjectMember;

public interface ProjectService {
	public List<Project> listTeam(Map<String, Object> map) throws Exception;
	public List<Project> listEmpName(Map<String, Object> map) throws Exception;
	
	public void insertProject(Project dto) throws Exception;
	public List<Project> listProject(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public void updateProject(Project dto) throws Exception;
	public Project findById(long projIdx) throws Exception;
	
	
	public void insertProjectMember(ProjectMember dto) throws Exception;
	
}
