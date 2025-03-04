package com.sp.app.project.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.project.model.ProjectTask;

@Mapper
public interface ProjectTaskMapper {

	/*
	 * PROJECTTASK 테이블
	 */
	// PROJECTTASK 테이블에 프로젝트 업무를 등록하는 메소드
	public void insertProjectTask(ProjectTask dto) throws SQLException;

	// PROJECTTASK 테이블에서 프로젝트 업무를 수정하는 메소드
	public void updateProjectTask(ProjectTask dto) throws SQLException;

	// PROJECTTASK 테이블에서 프로젝트 업무를 삭제하는 메소드
	public void deleteProjectTask(long taskIdx) throws SQLException;

	// PROJECTTASK 테이블에서 프로젝트 업무 목록을 List로 가져오는 메소드
	// map.put("projIdx", projIdx); <- 프로젝트에 들어가 있는 모든 업무 리스트
	// map.put("stageIdx", stageIdx); <- 단계에 해당하는 업무 리스트
	// map.put("status", status); <- status에 해당하는 업무 리스트
	public List<ProjectTask> getProjectTaskList(Map<String, Object> map);

	// PROJECTTASK 테이블에 프로젝트 업무 개수를 가져오는 메소드
	// map.put("projIdx", projIdx); <- 프로젝트에 들어가 있는 모든 업무 개수
	// map.put("stageIdx", stageIdx); <- 단계에 해당하는 업무 개수
	// map.put("status", status); <- status에 해당하는 업무 개수
	public int getProjectTaskCount(Map<String, Object> map);

	// PROJECTTASK 테이블에서 프로젝트 업무를 하나 가져오는 메소드
	public ProjectTask getProjectTaskById(long taskIdx);	
	
}
