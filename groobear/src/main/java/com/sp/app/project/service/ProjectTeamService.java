package com.sp.app.project.service;

import java.util.List;

import com.sp.app.project.model.ProjectTeam;

public interface ProjectTeamService {

	// < ProjectTeam >
	public void insertProjectTeam(ProjectTeam dto) throws Exception;

	public void updateProjectTeam(ProjectTeam dto) throws Exception;

	public void deleteProjectTeam(long projTeamIdx) throws Exception;
	
	public List<ProjectTeam> getProjectTeamList(long projIdx);	
	
}
