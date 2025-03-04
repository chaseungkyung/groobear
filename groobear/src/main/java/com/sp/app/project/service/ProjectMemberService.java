package com.sp.app.project.service;

import java.util.List;
import java.util.Map;

import com.sp.app.project.model.ProjectMember;

public interface ProjectMemberService {

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
	
}
