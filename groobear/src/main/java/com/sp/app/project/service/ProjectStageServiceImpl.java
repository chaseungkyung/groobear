package com.sp.app.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.project.mapper.ProjectStageMapper;
import com.sp.app.project.model.ProjectStage;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProjectStageServiceImpl implements ProjectStageService{
	private final ProjectStageMapper projectStageMapper;
	
	@Override
	public void insertProjectStage(ProjectStage dto) throws Exception {
		try {
			projectStageMapper.insertProjectStage(dto);
		} catch (Exception e) {
			log.info("insertProjectStage : ", e);
		}
		
	}

	@Override
	public void updateProjectStage(ProjectStage dto) throws Exception {
		try {
			projectStageMapper.updateProjectStage(dto);
		} catch (Exception e) {
			log.info("updateProjectStage : ", e);
		}
		
	}

	@Override
	public void deleteProjectStage(long stageIdx) throws Exception {
		try {
			projectStageMapper.deleteProjectStage(stageIdx);
		} catch (Exception e) {
			log.info("deleteProjectStage : ", e);
		}
		
	}

	@Override
	public List<ProjectStage> getProjectStageList(Map<String, Object> map) {
		List<ProjectStage> list = null;
		
		try {
			list = projectStageMapper.getProjectStageList(map);
			
		} catch (Exception e) {
			log.info("getProjectStageList : ", e);
		}
		
		return list;
	}

	@Override
	public int getProjectStageCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = projectStageMapper.getProjectStageCount(map);
			
		} catch (Exception e) {
			log.info("getProjectStageCount : ", e);
		}
		
		return result;
	}

	@Override
	public ProjectStage getProjectStageById(long stageIdx) {
		ProjectStage dto = null;
		
		try {
			
			dto = projectStageMapper.getProjectStageById(stageIdx);
			
		} catch (Exception e) {
			log.info("getProjectStageById : ", e);
		}
		
		return dto;
	}

}
