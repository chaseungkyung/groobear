package com.sp.app.project.service;

import java.util.List;
import java.util.Map;

import com.sp.app.project.model.ProjectStage;

public interface ProjectStageService {

	// <ProjectStage>
	public void insertProjectStage(ProjectStage dto) throws Exception;

	public void updateProjectStage(ProjectStage dto) throws Exception;

	public void deleteProjectStage(long stageIdx) throws Exception;

	public List<ProjectStage> getProjectStageList(Map<String, Object> map);

	public int getProjectStageCount(Map<String, Object> map);

	public ProjectStage getProjectStageById(long stageIdx);	
	
}
