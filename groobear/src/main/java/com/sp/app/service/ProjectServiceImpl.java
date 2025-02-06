package com.sp.app.service;

import org.springframework.stereotype.Service;

import com.sp.app.mapper.ProjectMapper;
import com.sp.app.model.Project;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProjectServiceImpl implements ProjectService {
	private final ProjectMapper mapper;
	
	@Override
	public void insertProject(Project dto) throws Exception {
		try {
			
			Long empIdx = mapper.findByPMname(dto.getEmpName());
			
			if(empIdx == null) {
				throw new IllegalArgumentException("PM 이름에 해당하는 사원을 찾을 수 없습니다.");
			}
			
			dto.setEmpIdx(empIdx);
			
			mapper.insertProject(dto);
		} catch (Exception e) {
			log.info("insertProject 에러 : ", e);
			throw e;
		}
		
	}
	
}
