package com.sp.app.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.project.mapper.ProjectTaskMapper;
import com.sp.app.project.model.ProjectTask;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProjectTaskServiceImpl implements ProjectTaskService {
	private final ProjectTaskMapper projectTaskMapper;
	
	@Override
	public void insertProjectTask(ProjectTask dto) throws Exception {
		try {
			projectTaskMapper.insertProjectTask(dto);
			
		} catch (Exception e) {
			log.info("insertProjectTask : ", e);
		}
		
	}

	@Override
	public void updateProjectTask(ProjectTask dto) throws Exception {
		try {
			projectTaskMapper.updateProjectTask(dto);
			
		} catch (Exception e) {
			log.info("updateProjectTask : ", e);
		}
		
	}

	@Override
	public void deleteProjectTask(long taskIdx) throws Exception {
		try {
			projectTaskMapper.deleteProjectTask(taskIdx);
			
		} catch (Exception e) {
			log.info("deleteProjectTask : ", e);
		}
		
	}

	@Override
	public List<ProjectTask> getProjectTaskList(Map<String, Object> map) {
		List<ProjectTask> list = null;
		
		try {
			list = projectTaskMapper.getProjectTaskList(map);
			
		} catch (Exception e) {
			log.info("getProjectTaskList : ", e);
		}
		
		return list;
	}

	@Override
	public int getProjectTaskCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = projectTaskMapper.getProjectTaskCount(map);
			
		} catch (Exception e) {
			log.info("getProjectTaskCount : ", e);
		}
		
		return result;
	}

	// 프로젝트 진행률 계산
	@Override
	public int getProgressRate(long projIdx, long stageIdx) {
		int progressRate = 0;
		
		try {
			
			Map<String, Object> totalMap = new HashMap<>();
			totalMap.put("projIdx", projIdx);
			totalMap.put("stageIdx", stageIdx);			
			int totalCount = getProjectTaskCount(totalMap);
						
			Map<String, Object> completedMap = new HashMap<>();
			completedMap.put("projIdx", projIdx);
			completedMap.put("stageIdx", stageIdx);
			completedMap.put("status", 3);
			int completedCount = getProjectTaskCount(completedMap);
			
			if(totalCount > 0) {
				progressRate = (int) Math.round(((double) completedCount / totalCount) * 100);
			}
			
			
		} catch (Exception e) {
			log.info("getProgressRate : ", e);
		}
		
		return progressRate;
	}

	@Override
	public ProjectTask getProjectTaskById(long taskIdx) {
		ProjectTask dto = null;
		
		try {
			dto = projectTaskMapper.getProjectTaskById(taskIdx);
			
		} catch (Exception e) {
			log.info("getProjectTaskById : ", e);
		}
		
		return dto;
	}

}
