package com.sp.app.project.service;

import java.util.List;
import java.util.Map;

import com.sp.app.project.model.ProjectPost;

public interface ProjectPostService {

	// <ProjectPost>
	public void insertProjectPost(ProjectPost dto, String uploadPath) throws Exception;
	
	public long getProjectMemberIdx(Map<String, Object> map);

	public void updateProjectPost(ProjectPost dto) throws Exception;

	public void deleteProjectPost(ProjectPost dto) throws Exception;

	public List<ProjectPost> getProjectPostList(Map<String, Object> map);

	public int getProjectPostCount(Map<String, Object> map);
	
	public ProjectPost getProjectPostById(long postIdx);	
	
}
