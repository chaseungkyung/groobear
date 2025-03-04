package com.sp.app.project.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.project.model.ProjectTeam;

@Mapper
public interface ProjectTeamMapper {

	/*
	 * PROJECTTEAM 테이블
	 */
	// PROJECTTEAM 테이블에 프로젝트 팀을 등록하는 메소드
	public void insertProjectTeam(ProjectTeam dto) throws SQLException;

	// PROJECTTEAM 테이블에서 프로젝트 팀을 수정하는 메소드
	public void updateProjectTeam(ProjectTeam dto) throws SQLException;

	// PROJECTTEAM 테이블에서 프로젝트 팀을 삭제하는 메소드
	public void deleteProjectTeam(long projTeamIdx) throws SQLException;

	// PROJECTTEAM 테이블에서 프로젝트의 팀 목록을 가져오는 메소드
	public List<ProjectTeam> getProjectTeamList(long projIdx);	
	
}
