package com.sp.app.service;

import java.util.List;
import java.util.Map;

import com.sp.app.model.project.Project;

public interface ProjectService {
	public void insertProject(Project dto) throws Exception;
	public List<Project> listProject(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
}
