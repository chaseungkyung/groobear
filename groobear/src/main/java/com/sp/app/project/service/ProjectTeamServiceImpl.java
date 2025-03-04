package com.sp.app.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sp.app.project.mapper.ProjectTeamMapper;
import com.sp.app.project.model.ProjectTeam;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProjectTeamServiceImpl implements ProjectTeamService {
	private final ProjectTeamMapper projectTeamMapper;
	
	@Override
	public void insertProjectTeam(ProjectTeam dto) throws Exception {
		try {
			projectTeamMapper.insertProjectTeam(dto);
			
		} catch (Exception e) {
			log.info("insertProjectTeam : ", e);
		}
		
	}

	@Override
	public void updateProjectTeam(ProjectTeam dto) throws Exception {
		try {
			projectTeamMapper.updateProjectTeam(dto);
			
		} catch (Exception e) {
			log.info("updateProjectTeam : ", e);
		}
		
	}

	@Override
	public void deleteProjectTeam(long projTeamIdx) throws Exception {
		try {
			projectTeamMapper.deleteProjectTeam(projTeamIdx);
		} catch (Exception e) {
			log.info("deleteProjectTeam : ", e);
		}
		
	}

	@Override
	public List<ProjectTeam> getProjectTeamList(long projIdx) {
		List<ProjectTeam> list = null;

		try {
			list = projectTeamMapper.getProjectTeamList(projIdx);

		} catch (Exception e) {
			log.info("getProjectTeamList : ", e);
		}
		return list;
	}

}
