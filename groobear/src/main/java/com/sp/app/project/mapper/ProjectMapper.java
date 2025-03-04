package com.sp.app.project.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.model.core.Member;
import com.sp.app.model.core.OrgUnit;
import com.sp.app.project.model.Project;

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

	// 사원테이블에서 검색한 회원 정보를 가져오는 메소드
	// map.put("projiIdx", projIdx); <- 프로젝트에 참여하는 사원 리스트
	// map.put("searchKwd", searchKwd); <- 검색어에 해당하는 사원 리스트
	public List<Member> getEmployList(Map<String, Object> map);

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
	// map.put("kwd", kwd); <- 프로젝트 이름에 해당하는 프로젝트 리스트
	// map.put("status", status); <- 프로젝트 상태에 해당하는 프로젝트 리스트
	public List<Project> getProjectList(Map<String, Object> map);

	// PROJECT 테이블에서 프로젝트 개수를 가져오는 메소드
	// map.put("kwd", kwd); <- 프로젝트 명에 해당하는 프로젝트 개수
	// map.put("status", status); <- 프로젝트 상태에 해당하는 프로젝트 개수
	public int getProjectCount(Map<String, Object> map);

	// PROJECT 테이블에서 프로젝트를 하나 가져오는 메소드
	public Project getProjectById(long projIdx);
	
	// 프로젝트 매니저의 empIdx 찾는 메소드
	public long getPmEmpIdx(long projIdx);

}
