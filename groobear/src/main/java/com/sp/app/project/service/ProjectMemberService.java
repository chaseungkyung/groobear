package com.sp.app.project.service;

import java.util.List;
import java.util.Map;

import com.sp.app.project.model.ProjectMember;
import com.sp.app.project.model.ProjectTeam;

public interface ProjectMemberService {

	// < ProjectMember >
	public boolean isProjectMemberExists(long projIdx, long empIdx);

	public void insertProjectMember(ProjectMember dto) throws Exception;

	public void updateProjectMember(ProjectMember dto) throws Exception;

	public void deleteProjectMember(long projMemberIdx) throws Exception;

	public List<ProjectMember> getProjectMemberList(Map<String, Object> map);

	public int getProjectMemberCount(Map<String, Object> map);

	public ProjectMember getProjectMemberById(long projMemberIdx);

	// 프로젝트 멤버 참여자 목록
	public List<ProjectMember> getProjectPmList(long projIdx);

	public List<ProjectMember> getNonPMProjectMemberList(long projIdx);

	// < ProjectTeam >
	public void insertProjectTeam(ProjectTeam dto) throws Exception;

	public void updateProjectTeam(ProjectTeam dto) throws Exception;

	public void deleteProjectTeam(long projTeamIdx) throws Exception;

	public List<ProjectTeam> getProjectTeamList(long projIdx);

	public void updateProjectTeamsAndMembers(List<ProjectMember> updatedProjMembers,
			List<ProjectTeam> updatedProjectTeams) throws Exception;

}
