package com.sp.app.project.service;

import java.util.List;
import java.util.Map;

import com.sp.app.project.model.ProjectTask;

public interface ProjectTaskService {

	// <ProjectTask>
	public void insertProjectTask(ProjectTask dto) throws Exception;

	public void updateProjectTask(ProjectTask dto) throws Exception;

	public void deleteProjectTask(long taskIdx) throws Exception;

	public List<ProjectTask> getProjectTaskList(Map<String, Object> map);

	public int getProjectTaskCount(Map<String, Object> map);
	
	// 프로젝트 진행률 계산
	public int getProgressRate(long projIdx, long stageIdx);

	public ProjectTask getProjectTaskById(long taskIdx);	
	
}
