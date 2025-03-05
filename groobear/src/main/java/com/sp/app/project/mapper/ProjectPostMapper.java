package com.sp.app.project.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.project.model.ProjectPost;
import com.sp.app.project.model.ProjectPostCmt;

@Mapper
public interface ProjectPostMapper {

	/*
	 * projectPost 테이블
	 */
	// projectPost 테이블 게시글 등록
	public void insertProjectPost(ProjectPost dto) throws SQLException;
	
	public long getProjectMemberIdx(Map<String, Object> map);
	
	// projectPost 테이블 게시글 수정
	public void updateProjectPost(ProjectPost dto) throws SQLException;

	// projectPost 테이블 게시글 삭제
	public void deleteProjectPost(long postIdx) throws SQLException;

	// projectPost 테이블 게시글 List 가져오는 메소드
	public List<ProjectPost> getProjectPostList(Map<String, Object> map);

	// projectPost 테이블 게시글 개수
	public int getProjectPostCount(Map<String, Object> map);

	// projectPost 테이블 게시글 하나 가져오는 메소드
	public ProjectPost getProjectPostById(long postIdx);
	
	// 이전글 다음글
	public ProjectPost getProjectPostByPrev(Map<String, Object> map);
	public ProjectPost getProjectPostByNext(Map<String, Object> map);
	

	/*
	 * ProjectPostFile 테이블
	 */
	public void insertFile(ProjectPost dto) throws SQLException;
	
	public List<ProjectPost> getPostFileList(long postIdx);
	
	public ProjectPost findByFileId(long fileIdx);
	
	public void deleteFile(Map<String, Object> map) throws SQLException;
	

	/*
	 * projectPostCmt 테이블
	 */
	
	public long getProjMemberIdx(Map<String, Object> map);
	
	public void insertReply(ProjectPostCmt dto) throws SQLException;
	
	public void deleteReply(Map<String, Object> map) throws SQLException;
	
	public int getPostReplyCount(Map<String, Object> map);
	
	public List<ProjectPostCmt> getPostReplyList(Map<String, Object> map);
	
	
}
