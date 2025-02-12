package com.sp.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.mapper.ProjectMapper;
import com.sp.app.model.project.Project;
import com.sp.app.model.project.ProjectMember;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProjectServiceImpl implements ProjectService {
	private final ProjectMapper mapper;
	
	@Override
	public void insertProject(Project dto) throws Exception {
		// long empIdx = 0;
		try {
			
			Long empIdx = mapper.findByEmpName(dto.getEmpName());
			
			// empIdx = mapper.findByEmpName(dto);
			
			dto.setEmpIdx(empIdx);
			
			mapper.insertProject(dto);
			
		} catch (Exception e) {
			log.info("insertProject 에러 : ", e);
			throw e;
		}	
	}

	@Override
	public List<Project> listProject(Map<String, Object> map) {
		List<Project> listProject = null; 
		
		try {
			listProject = mapper.listProject(map);

			
		} catch (Exception e) {
			log.info("listProject : ", e);
		}
		
		return listProject;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			log.info("dataCount : ", e);
		}
		
		return result;
	}

	@Override
	public void insertProjectMember(ProjectMember dto) throws Exception {
		try {
			
			
			
			
			mapper.insertProjectMember(dto);
			
		} catch (Exception e) {
			log.info("insertProjectMember : ", e);
			throw e;
		}
		
	}
	
	
	
}
