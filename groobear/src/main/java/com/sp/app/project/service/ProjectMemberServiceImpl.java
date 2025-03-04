package com.sp.app.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.project.mapper.ProjectMemberMapper;
import com.sp.app.project.model.ProjectMember;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProjectMemberServiceImpl implements ProjectMemberService {
	private final ProjectMemberMapper projectMemberMapper;
	
	
	@Override
	public void insertProjectMember(ProjectMember dto) throws Exception {
		try {
			projectMemberMapper.insertProjectMember(dto);

		} catch (Exception e) {
			log.info("insertProjectMember : ", e);
			throw e;
		}
	}

	
	@Override
	public void updateProjectMember(ProjectMember dto) throws Exception {
		try {
			projectMemberMapper.updateProjectMember(dto);

		} catch (Exception e) {
			log.info("updateProjectMember : ", e);
			throw e;
		}

	}

	@Override
	public void deleteProjectMember(long projMemberIdx) throws Exception {
		try {

			projectMemberMapper.deleteProjectMember(projMemberIdx);

		} catch (Exception e) {
			log.info("deleteProjectMember : ", e);
		}

	}

	@Override
	public List<ProjectMember> getProjectMemberList(Map<String, Object> map) {
		List<ProjectMember> list = null;

		try {
			list = projectMemberMapper.getProjectMemberList(map);

		} catch (Exception e) {
			log.info("getProjectMemberList : ", e);
		}

		return list;
	}

	@Override
	public int getProjectMemberCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = projectMemberMapper.getProjectMemberCount(map);

		} catch (Exception e) {
			log.info("getProjectMemberCount : ", e);
		}

		return result;
	}

	@Override
	public ProjectMember getProjectMemberById(long projMemberIdx) {
		ProjectMember dto = null;
		
		try {
			dto = projectMemberMapper.getProjectMemberById(projMemberIdx);
			
		} catch (Exception e) {
			log.info("getProjectMemberById : ", e);
		}
		
		return dto;
	}

	
	// 프로젝트 멤버 참여자 목록
	
	@Override
	public List<ProjectMember> getProjectPmList(long projIdx) {
		List<ProjectMember> list = null;
		
		try {
			
			list = projectMemberMapper.getProjectPmList(projIdx);
			
		} catch (Exception e) {
			log.info("getProjectPmList : ", e);
		}
		
		return list;
	}

	@Override
	public List<ProjectMember> getNonPMProjectMemberList(long projIdx) {
		List<ProjectMember> list = null;
		
		try {
			list = projectMemberMapper.getNonPMProjectMemberList(projIdx);
			
		} catch (Exception e) {
			log.info("getNonPMProjectMemberList : ", e);
		}
		
		return list;
	}
	
	
	

}
