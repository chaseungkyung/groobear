package com.sp.app.service.project;

import java.util.List;
import java.util.Map;

import com.sp.app.model.core.Member;
import com.sp.app.model.core.OrgUnit;
import com.sp.app.model.project.Project;
import com.sp.app.model.project.ProjectMember;
import com.sp.app.model.project.ProjectPost;
import com.sp.app.model.project.ProjectStage;
import com.sp.app.model.project.ProjectTask;
import com.sp.app.model.project.ProjectTeam;

public interface ProjectService {
	// 개발부의 팀 리스트를 가져오는 메소드. 임시 메소드임. RestAPI로 분리할 예정
	public List<OrgUnit> getDevTeamList(Map<String, Object> map) throws Exception;

	// 개발부 팀으로부터 팀원 리스트를 가져오는 메소드. 임시 메소드임. RestAPI로 분리할 예정
	public List<Member> getEmpNameListFromDevTeam(Map<String, Object> map) throws Exception;

	public List<Member> getEmployList(Map<String, Object> map);

	
	// < Project >
	public void insertProject(Project dto) throws Exception;

	public void updateProject(Project dto) throws Exception;

	public void deleteProject(long projIdx) throws Exception;

	public List<Project> getProjectList(Map<String, Object> map) throws Exception;

	public int getProjectCount(Map<String, Object> map);

	public Project getProjectById(long projIdx) throws Exception;
	
	
	// < ProjectTeam >
	public void insertProjectTeam(ProjectTeam dto) throws Exception;

	public void updateProjectTeam(ProjectTeam dto) throws Exception;

	public void deleteProjectTeam(long projTeamIdx) throws Exception;
	
	public List<ProjectTeam> getProjectTeamList(long projIdx);
	


	// < ProjectMember >
	public void insertProjectMember(ProjectMember dto) throws Exception;

	public void updateProjectMember(ProjectMember dto) throws Exception;

	public void deleteProjectMember(long projMemberIdx) throws Exception;

	public List<ProjectMember> getProjectMemberList(Map<String, Object> map);

	public int getProjectMemberCount(Map<String, Object> map);
	
	public ProjectMember getProjectMemberById(long projMemberIdx);
	
	// 프로젝트 멤버 참여자 목록
	public List<ProjectMember> getProjectPmList(long projIdx);
	
	public List<ProjectMember> getNonPMProjectMemberList(long projIdx);
	
	
	// <ProjectStage>
	public void insertProjectStage(ProjectStage dto) throws Exception;

	public void updateProjectStage(ProjectStage dto) throws Exception;

	public void deleteProjectStage(long stageIdx) throws Exception;

	public List<ProjectStage> getProjectStageList(Map<String, Object> map);

	public int getProjectStageCount(Map<String, Object> map);

	public ProjectStage getProjectStageById(long stageIdx);
	
	
	// <ProjectTask>
	public void insertProjectTask(ProjectTask dto) throws Exception;

	public void updateProjectTask(ProjectTask dto) throws Exception;

	public void deleteProjectTask(long taskIdx) throws Exception;

	public List<ProjectTask> getProjectTaskList(Map<String, Object> map);

	public int getProjectTaskCount(Map<String, Object> map);
	
	// 프로젝트 진행률 계산
	public int getProgressRate(long projIdx, long stageIdx);

	public ProjectTask getProjectTaskById(long taskIdx);
	
	
	// <ProjectPost>
	public void insertProjectPost(ProjectPost dto, String uploadPath) throws Exception;
	
	public long getProjectMemberIdx(Map<String, Object> map);

	public void updateProjectPost(ProjectPost dto) throws Exception;

	public void deleteProjectPost(ProjectPost dto) throws Exception;

	public List<ProjectPost> getProjectPostList(Map<String, Object> map);

	public int getProjectPostCount(Map<String, Object> map);
	
	public ProjectPost getProjectPostById(long postIdx);
	
	
	

}
