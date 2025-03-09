package com.sp.app.project.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.project.model.ProjectMember;
import com.sp.app.project.model.ProjectTeam;

@Mapper
public interface ProjectMemberMapper {

	/*
	 * PROJECTMEMBER 테이블
	 */

	// PROJECTMEMBER 테이블에 특정 직원이 이미 등록되어 있는지 확인
	public int countByProjIdxAndEmpIdx(Map<String, Object> map);

	// PROJECTMEMBER 테이블에 프로젝트 참여자를 등록하는 메소드
	public void insertProjectMember(ProjectMember dto) throws SQLException;

	// PROJECTMEMBER 테이블에서 프로젝트 참여자를 수정하는 메소드
	public void updateProjectMember(ProjectMember dto) throws SQLException;

	// PROJECTMEMBER 테이블에서 프로젝트 참여자를 삭제하는 메소드
	public void deleteProjectMember(long projMemberIdx) throws SQLException;

	// PROJECTMEMBER 테이블에서 참여자 목록을 List로 가져오는 메소드
	// map.put("projIdx", projIdx); <- 프로젝트에 참여하는 사원들 리스트
	// map.put("projTeamIdx", projTeamIdx); <- 프로젝트 안에 프로젝트 팀에 소속된 사원들 리스트
	public List<ProjectMember> getProjectMemberList(Map<String, Object> map);

	// PROJECTMEMBER 테이블에서 프로젝트 참여자 수를 가져오는 메소드
	// map.put("projIdx", projIdx); <- 프로젝트에 참여하는 사원 수
	// map.put("projTeamIdx", projTeamIdx); <- 프로젝트 안에 프로젝트 팀에 소속된 사원 수
	public int getProjectMemberCount(Map<String, Object> map);

	// PROJECTMEMBER 테이블에서 프로젝트 참여자 정보를 하나 가져오는 메소드
	public ProjectMember getProjectMemberById(long projMemberIdx);

	// 해당 프로젝트에 프로젝트 매니저 매니저 조회
	public List<ProjectMember> getProjectPmList(long projIdx);

	// 해당 프로젝트에 프로젝트 매니저를 뺀 참여자 목록을 List 로 가져오는 메소드
	public List<ProjectMember> getNonPMProjectMemberList(long projIdx);

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
