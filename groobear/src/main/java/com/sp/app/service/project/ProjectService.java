package com.sp.app.service.project;

import java.util.List;
import java.util.Map;

import com.sp.app.model.core.Member;
import com.sp.app.model.core.OrgUnit;
import com.sp.app.model.project.Project;
import com.sp.app.model.project.ProjectMember;
import com.sp.app.model.project.ProjectTeam;

public interface ProjectService {
	// 개발부의 팀 리스트를 가져오는 메소드. 임시 메소드임. RestAPI로 분리할 예정
	public List<OrgUnit> getDevTeamList(Map<String, Object> map) throws Exception;

	// 개발부 팀으로부터 팀원 리스트를 가져오는 메소드. 임시 메소드임. RestAPI로 분리할 예정
	public List<Member> getEmpNameListFromDevTeam(Map<String, Object> map) throws Exception;

	public List<Member> getEmployList(Map<String, Object> map);

	// < ProjectTeam >
	public List<ProjectTeam> getProjectTeamList(long projIdx);

	// < Project >
	public void insertProject(Project dto) throws Exception;

	public void updateProject(Project dto) throws Exception;

	public void deleteProject(long projIdx) throws Exception;

	public List<Project> getProjectList(Map<String, Object> map) throws Exception;

	public int getProjectCount(Map<String, Object> map);

	public Project getProjectById(long projIdx) throws Exception;

	// < ProjectMember >
	public void insertProjectMember(ProjectMember dto) throws Exception;

	public void updateProjectMember(ProjectMember dto) throws Exception;

	public void deleteProjectMember(long projMemberIdx) throws Exception;

	public List<ProjectMember> getProjectMemberList(Map<String, Object> map);

	public int getProjectMemberCount(Map<String, Object> map);

}
