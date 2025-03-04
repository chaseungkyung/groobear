package com.sp.app.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.project.mapper.ProjectPostMapper;
import com.sp.app.project.model.ProjectPost;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProjectPostServiceImpl implements ProjectPostService{
	private final ProjectPostMapper projectPostMapper;
	
	@Override
	public void insertProjectPost(ProjectPost dto, String uploadPath) throws Exception {
		try {
			projectPostMapper.insertProjectPost(dto);
			
			/*
			if(! dto.getSelectFile().isEmpty()) {
				insertFile(dto, uploadPath);
			}
			*/
			
		} catch (Exception e) {
			log.info("insertProjectPost : ", e);
			
			throw e;
		}	
	}

	@Override
	public long getProjectMemberIdx(Map<String, Object> map) {
		long projMemberIdx = 0;
		
		try {
			projMemberIdx = projectPostMapper.getProjectMemberIdx(map);
			
		} catch (Exception e) {
			log.info("getProjectMemberIdx : ", e);
		}
		
		return projMemberIdx;
	}

	@Override
	public void updateProjectPost(ProjectPost dto) throws Exception {
		try {
			projectPostMapper.updateProjectPost(dto);
			
		} catch (Exception e) {
			log.info("updateProjectPost : ", e);
			
			throw e;
		}	
	}

	@Override
	public void deleteProjectPost(ProjectPost dto) throws Exception {
		try {
			projectPostMapper.deleteProjectPost(dto);
			
		} catch (Exception e) {
			log.info("deleteProjectPost : ", e);
		}
		
	}

	@Override
	public List<ProjectPost> getProjectPostList(Map<String, Object> map) {
		List<ProjectPost> list = null;
		
		try {
			list = projectPostMapper.getProjectPostList(map);
			
		} catch (Exception e) {
			log.info("getProjectPostList : ", e);
		}
		
		return list;
	}

	@Override
	public int getProjectPostCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = projectPostMapper.getProjectPostCount(map);
			
		} catch (Exception e) {
			log.info("getProjectPostCount : ", e);
		}
		
		return result;
	}

	@Override
	public ProjectPost getProjectPostById(long postIdx) {
		ProjectPost dto = null;
		
		try {
			dto = projectPostMapper.getProjectPostById(postIdx);
			
		} catch (Exception e) {
			log.info("getProjectPostById : ", e);
		}
		
		return dto;
	}

}
