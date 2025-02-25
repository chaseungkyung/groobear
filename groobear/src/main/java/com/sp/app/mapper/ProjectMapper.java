package com.sp.app.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.model.core.Member;
import com.sp.app.model.core.OrgUnit;
import com.sp.app.model.project.Project;
import com.sp.app.model.project.ProjectMember;
import com.sp.app.model.project.ProjectStage;
import com.sp.app.model.project.ProjectTask;

/**
 * 프로젝트 관련 Mapper 인터페이스
 * CRUD 중 Read에 해당하는 메소드는 SQLException을 던지지 않도록 해놓음.
 */
@Mapper
public interface ProjectMapper {
	// 개발부의 팀 리스트를 가져오는 메소드. 임시 메소드임. RestAPI로 분리할 예정
	public List<OrgUnit> getDevTeamList(Map<String, Object> map) throws SQLException;

	// 개발부 팀으로부터 팀원 리스트를 가져오는 메소드. 임시 메소드임. RestAPI로 분리할 예정
	public List<Member> getEmpNameListFromDevTeam(Map<String, Object> map) throws SQLException;

	/*
	 * PROJECT 테이블
	 */
	// PROJECT 테이블에 프로젝트를 등록하는 메소드
	public void insertProject(Project dto) throws SQLException;

	// PROJECT 테이블의 프로젝트를 수정하는 메소드
	public void updateProject(Project dto) throws SQLException;

	// PROJECT 테이블의 프로젝트를 삭제하는 메소드
	public void deleteProject(long projIdx) throws SQLException;

	// PROJECT 테이블에서 프로젝트 목록을 List로 가져오는 메소드
	public List<Project> getProjectList(Map<String, Object> map);

	// PROJECT 테이블에 프로젝트 개수를 가져오는 메소드
	public int getProjectCount(Map<String, Object> map);

	// PROJECT 테이블에서 프로젝트를 하나 가져오는 메소드
	public Project getProjectById(long projIdx);

	/*
	 * PROJECTMEMBER 테이블
	 */
	// PROJECTMEMBER 테이블에 프로젝트 참여자를 등록하는 메소드
	public void insertProjectMember(ProjectMember dto) throws SQLException;

	// PROJECTMEMBER 테이블에서 프로젝트 참여자를 수정하는 메소드
	public void updateProjectMember(ProjectMember dto) throws SQLException;

	// PROJECTMEMBER 테이블에서 프로젝트 참여자를 삭제하는 메소드
	public void deleteProjectMember(long projMemberIdx) throws SQLException;

	// PROJECTMEMBER 테이블에서 프로젝트 참여자 목록을 List로 가져오는 메소드
	public List<ProjectMember> getProjectMemberList(Map<String, Object> map);

	// PROJECTMEMBER 테이블에 프로젝트 참여자 개수를 가져오는 메소드
	public int getProjectMemberCount(Map<String, Object> map);
	
	// 사원테이블에 검색한 회원 정보가 나와야 될때?
	

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
	public List<ProjectStage> getProjectStageList(Map<String, Object> map);

	// PROJECTSTAGE 테이블에 프로젝트 단계 개수를 가져오는 메소드
	public int getProjectStageCount(Map<String, Object> map);

	// PROJECTSTAGE 테이블에서 프로젝트 단계를 하나 가져오는 메소드
	public ProjectStage getProjectStageById(long stageIdx);

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
	public List<ProjectTask> getProjectTaskList(Map<String, Object> map);

	// PROJECTTASK 테이블에 프로젝트 업무 개수를 가져오는 메소드
	public int getProjectTaskCount(Map<String, Object> map);

	// PROJECTTASK 테이블에서 프로젝트 업무를 하나 가져오는 메소드
	public ProjectTask getProjectTaskById(long taskIdx);

}
