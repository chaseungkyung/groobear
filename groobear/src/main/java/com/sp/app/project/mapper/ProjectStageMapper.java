package com.sp.app.project.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.project.model.ProjectStage;

@Mapper
public interface ProjectStageMapper {

	/*
	 * PROJECTSTAGE 테이블
	 */
	// PROJECTSTAGE 테이블에 프로젝트 단계를 등록하는 메소드
	public void insertProjectStage(ProjectStage dto) throws SQLException;

	// PROJECTSTAGE 테이블에서 프로젝트 단계를 수정하는 메소드
	public void updateProjectStage(ProjectStage dto) throws SQLException;

	// PROJECTSTAGE 테이블에서 프로젝트 단계를 삭제하는 메소드
	public void deleteProjectStage(long stageIdx) throws SQLException;

	// PROJECTSTAGE 테이블에서 프로젝트 단계 목록을 List로 가져오는 메소드
	// map.put("projIdx", projIdx); <- 프로젝트에 들어가 있는 모든 단계 리스트
	// map.put("status", status); <- status에 해당하는 단계 리스트
	public List<ProjectStage> getProjectStageList(Map<String, Object> map);

	// PROJECTSTAGE 테이블에 프로젝트 단계 개수를 가져오는 메소드 
	// map.put("projIdx", projIdx); <- 프로젝트에 들어가 있는 모든 단계 개수
	// map.put("status", status); <- status에 해당하는 단계 개수
	public int getProjectStageCount(Map<String, Object> map);

	// PROJECTSTAGE 테이블에서 프로젝트 단계를 하나 가져오는 메소드
	public ProjectStage getProjectStageById(long stageIdx);	

}
