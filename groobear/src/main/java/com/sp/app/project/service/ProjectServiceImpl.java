package com.sp.app.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.model.core.Member;
import com.sp.app.model.core.OrgUnit;
import com.sp.app.project.mapper.ProjectMapper;
import com.sp.app.project.model.Project;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProjectServiceImpl implements ProjectService {
	private final ProjectMapper projectMapper;

	@Override
	public List<OrgUnit> getDevTeamList(Map<String, Object> map) throws Exception {
		List<OrgUnit> list = null;

		try {
			list = projectMapper.getDevTeamList(map);

		} catch (Exception e) {
			log.info("getDevTeamList : ", e);
		}
		return list;
	}

	@Override
	public List<Member> getEmpNameListFromDevTeam(Map<String, Object> map) throws Exception {
		List<Member> list = null;

		try {
			list = projectMapper.getEmpNameListFromDevTeam(map);

		} catch (Exception e) {
			log.info("getEmpNameListFromDevTeam : ", e);
		}
		return list;
	}
	
	
	@Override
	public List<Member> getEmployList(Map<String, Object> map) {
		List<Member> list = null;

		try {
			list = projectMapper.getEmployList(map);

		} catch (Exception e) {
			log.info("getEmployList : ", e);
		}

		return list;
	}
	
	
	// 프로젝트
	
	@Override
	public void insertProject(Project dto) throws Exception {
		try {
			long seq = projectMapper.projectSeq();
			dto.setProjIdx(seq);

			projectMapper.insertProject(dto);

		} catch (Exception e) {
			log.info("insertProject 에러 : ", e);
			throw e;
		}
	}

	@Override
	public void updateProject(Project dto) throws Exception {
		try {
			projectMapper.updateProject(dto);			

		} catch (Exception e) {
			log.info("updateProject : ", e);
		}
	}

	@Override
	public void deleteProject(long projIdx) throws Exception {
		try {
			projectMapper.deleteProject(projIdx);
		} catch (Exception e) {
			log.info("deleteProject : ", e);
		}

	}

	@Override
	public List<Project> getProjectList(Map<String, Object> map) throws Exception {
		List<Project> listProject = null;

		try {
			listProject = projectMapper.getProjectList(map);

		} catch (Exception e) {
			log.info("getProjectList : ", e);
		}

		return listProject;
	}
	
	
	@Override
	public int getProjectCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = projectMapper.getProjectCount(map);
		} catch (Exception e) {
			log.info("dataCount : ", e);
		}

		return result;
	}
	
	
	@Override
	public Project getProjectById(long projIdx) throws Exception {
		Project dto = null;

		try {
			dto = projectMapper.getProjectById(projIdx);

		} catch (Exception e) {
			log.info("getProjectById : ", e);
		}

		return dto;
	}
	
	@Override
	public long getPmEmpIdx(long projIdx) {
		long empIdx = 0;
		
		try {
			empIdx = projectMapper.getPmEmpIdx(projIdx);
			
		} catch (Exception e) {
			log.info("getPmEmpIdx : ", e);
		}
			
		return empIdx;
	}


}
