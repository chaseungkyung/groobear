package com.sp.app.project.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.sp.app.project.model.ProjectPost;
import com.sp.app.project.model.ProjectPostCmt;

public interface ProjectPostService {

	// <ProjectPost>
	public void insertProjectPost(ProjectPost dto, String uploadPath) throws Exception;
	
	public long getProjectMemberIdx(Map<String, Object> map);

	public void updateProjectPost(ProjectPost dto, String uploadPath) throws Exception;

	public void deleteProjectPost(long postIdx, String uploadPath) throws Exception;

	public List<ProjectPost> getProjectPostList(Map<String, Object> map);

	public int getProjectPostCount(Map<String, Object> map);
	
	public ProjectPost getProjectPostById(long postIdx);
	
	// 파일
	public List<ProjectPost> getPostFileList(long postIdx);
	
	public ProjectPost findByFileId(long fileIdx);
	
	public void deleteFile(Map<String, Object> map) throws SQLException;
	
	public boolean deleteUploadFile(String uploadPath, String filename);
	
	// 댓글
	public void insertReply(ProjectPostCmt dto) throws Exception;
	
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	public int getPostReplyCount(Map<String, Object> map);
	
	public List<ProjectPostCmt> getPostReplyList(Map<String, Object> map);
	
}
