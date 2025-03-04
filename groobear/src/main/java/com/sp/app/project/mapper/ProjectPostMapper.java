package com.sp.app.project.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.project.model.ProjectPost;

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
	public void deleteProjectPost(ProjectPost dto) throws SQLException;

	// projectPost 테이블 게시글 List 가져오는 메소드
	public List<ProjectPost> getProjectPostList(Map<String, Object> map);

	// projectPost 테이블 게시글 개수
	public int getProjectPostCount(Map<String, Object> map);

	// projectPost 테이블 게시글 하나 가져오는 메소드
	public ProjectPost getProjectPostById(long postIdx);

	public Long getProjectMemberIdx();
	
}
