package com.sp.app.service.project;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.mapper.ProjectMapper;
import com.sp.app.model.core.Member;
import com.sp.app.model.core.OrgUnit;
import com.sp.app.model.project.Project;
import com.sp.app.model.project.ProjectMember;
import com.sp.app.model.project.ProjectTeam;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProjectServiceImpl implements ProjectService {
	private final ProjectMapper mapper;

	@Override
	public List<OrgUnit> getDevTeamList(Map<String, Object> map) throws Exception {
		List<OrgUnit> list = null;

		try {
			list = mapper.getDevTeamList(map);

		} catch (Exception e) {
			log.info("getDevTeamList : ", e);
		}
		return list;
	}

	@Override
	public List<Member> getEmpNameListFromDevTeam(Map<String, Object> map) throws Exception {
		List<Member> list = null;

		try {
			list = mapper.getEmpNameListFromDevTeam(map);

		} catch (Exception e) {
			log.info("getEmpNameListFromDevTeam : ", e);
		}
		return list;
	}

	@Override
	public void insertProject(Project dto) throws Exception {
		try {

			mapper.insertProject(dto);

		} catch (Exception e) {
			log.info("insertProject 에러 : ", e);
			throw e;
		}
	}

	@Override
	public void updateProject(Project dto) throws Exception {
		try {
			mapper.updateProject(dto);

		} catch (Exception e) {
			log.info("updateProject : ", e);
		}
	}

	@Override
	public void deleteProject(long projIdx) throws Exception {
		try {
			mapper.deleteProject(projIdx);
		} catch (Exception e) {
			log.info("deleteProject : ", e);
		}

	}

	@Override
	public List<Project> getProjectList(Map<String, Object> map) throws Exception {
		List<Project> listProject = null;

		try {
			listProject = mapper.getProjectList(map);

		} catch (Exception e) {
			log.info("getProjectList : ", e);
		}

		return listProject;
	}

	@Override
	public Project getProjectById(long projIdx) throws Exception {
		Project dto = null;

		try {
			dto = mapper.getProjectById(projIdx);

		} catch (Exception e) {
			log.info("getProjectById : ", e);
		}

		return dto;
	}

	@Override
	public int getProjectCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = mapper.getProjectCount(map);
		} catch (Exception e) {
			log.info("dataCount : ", e);
		}

		return result;
	}

	// 프로젝트 멤버

	@Override
	public void insertProjectMember(ProjectMember dto) throws Exception {
		try {
			mapper.insertProjectMember(dto);

		} catch (Exception e) {
			log.info("insertProjectMember : ", e);
			throw e;
		}
	}

	@Override
	public void updateProjectMember(ProjectMember dto) throws Exception {
		try {
			mapper.updateProjectMember(dto);

		} catch (Exception e) {
			log.info("updateProjectMember : ", e);
			throw e;
		}

	}

	@Override
	public void deleteProjectMember(long projMemberIdx) throws Exception {
		try {

			mapper.deleteProjectMember(projMemberIdx);

		} catch (Exception e) {
			log.info("deleteProjectMember : ", e);
		}

	}

	@Override
	public List<ProjectMember> getProjectMemberList(Map<String, Object> map) {
		List<ProjectMember> list = null;

		try {
			list = mapper.getProjectMemberList(map);

		} catch (Exception e) {
			log.info("getProjectMemberList : ", e);
		}

		return list;
	}

	@Override
	public int getProjectMemberCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = mapper.getProjectMemberCount(map);

		} catch (Exception e) {
			log.info("getProjectMemberCount : ", e);
		}

		return result;
	}

	@Override
	public List<Member> getEmployList(Map<String, Object> map) {
		List<Member> list = null;

		try {
			list = mapper.getEmployList(map);

		} catch (Exception e) {
			log.info("getEmployList : ", e);
		}

		return list;
	}

	@Override
	public List<ProjectTeam> getProjectTeamList(long projIdx) {
		List<ProjectTeam> list = null;

		try {
			list = mapper.getProjectTeamList(projIdx);

		} catch (Exception e) {
			log.info("getProjectTeamList : ", e);
		}
		return list;
	}

}
