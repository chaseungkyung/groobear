package com.sp.app.project.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.app.common.MyUtil;
import com.sp.app.common.StorageService;
import com.sp.app.exception.StorageException;
import com.sp.app.project.mapper.ProjectPostMapper;
import com.sp.app.project.model.ProjectPost;
import com.sp.app.project.model.ProjectPostCmt;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProjectPostServiceImpl implements ProjectPostService{
	private final ProjectPostMapper projectPostMapper;
	private final StorageService storageService;
	private final MyUtil myUtil;
	
	@Override
	public void insertProjectPost(ProjectPost dto, String uploadPath) throws Exception {
		try {
			projectPostMapper.insertProjectPost(dto);
			
			if(! dto.getSelectFile().isEmpty()) {
				insertFile(dto, uploadPath);
			}
			
			
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
	public void updateProjectPost(ProjectPost dto, String uploadPath) throws Exception {
		try {
			projectPostMapper.updateProjectPost(dto);
			
			if(! dto.getSelectFile().isEmpty()) {
				insertFile(dto, uploadPath);
			}
			
		} catch (Exception e) {
			log.info("updateProjectPost : ", e);
			
			throw e;
		}	
	}

	@Override
	public void deleteProjectPost(long postIdx, String uploadPath) throws Exception {
		try {
			List<ProjectPost> listFile = getPostFileList(postIdx);
			if(listFile != null) {
				for(ProjectPost dto : listFile) {
					deleteUploadFile(uploadPath, dto.getSaveFilename());
				}
			}
			
			Map<String, Object> map = new HashMap<>();
			map.put("field", "postIdx");
			map.put("postIdx", postIdx);
			deleteFile(map);
			
			projectPostMapper.deleteProjectPost(postIdx);
			
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
	
	
	@Override
	public ProjectPost getProjectPostByPrev(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProjectPost getProjectPostByNext(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public List<ProjectPost> getPostFileList(long postIdx) {
		List<ProjectPost> listFile = null;
		
		try {
			listFile = projectPostMapper.getPostFileList(postIdx);
		} catch (Exception e) {
			log.info("listFile : ", e);
		}
		return listFile;
	}

	@Override
	public ProjectPost findByFileId(long fileIdx) {
		ProjectPost dto = null;
		
		try {
			dto = projectPostMapper.findByFileId(fileIdx);
		} catch (Exception e) {
			log.info("findByFileId : ", e);
		}
		
		return dto;
	}

	@Override
	public void deleteFile(Map<String, Object> map) throws SQLException {
		try {
			projectPostMapper.deleteFile(map);
		} catch (Exception e) {
			log.info("deleteFile : ", e);
			
			throw e;
		}
		
	}

	@Override
	public boolean deleteUploadFile(String uploadPath, String filename) {
		return storageService.deleteFile(uploadPath, filename);
	}
	
	protected void insertFile(ProjectPost dto, String uploadPath) throws Exception {
		for(MultipartFile mf : dto.getSelectFile()) {
			try {
				String saveFilename = 
						Objects.requireNonNull(storageService.uploadFileToServer(mf, uploadPath));
				String originalFilename = mf.getOriginalFilename();
				
				dto.setOriginalFilename(originalFilename);
				dto.setSaveFilename(saveFilename);
				
				projectPostMapper.insertFile(dto);
				
			} catch (NullPointerException e) {
			} catch (StorageException e) {
			} catch (Exception e) {
				throw e;
			}
		}
	}	
	

	@Override
	public void insertReply(ProjectPostCmt dto) throws Exception {
		try {
			projectPostMapper.insertReply(dto);
		} catch (Exception e) {
			log.info("insertReply : ", e);
			
			throw e;
		}
		
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			projectPostMapper.deleteReply(map);
		} catch (Exception e) {
			log.info("deleteReply : ", e);
			
			throw e;
		}
		
	}

	@Override
	public int getPostReplyCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = projectPostMapper.getPostReplyCount(map);
		} catch (Exception e) {
			log.info("replyCount : ", e);
		}
		
		return result;
	}

	@Override
	public List<ProjectPostCmt> getPostReplyList(Map<String, Object> map) {
		List<ProjectPostCmt> listReply = null;
		
		try {
			listReply = projectPostMapper.getPostReplyList(map);
			
			for(ProjectPostCmt dto : listReply) {
				dto.setContent(myUtil.htmlSymbols(dto.getContent()));
				
				map.put("cmtIdx", dto.getCmtIdx());
			}
			
		} catch (Exception e) {
			log.info("getPostReplyList : ", e);
		}
		
		return listReply;
	}



}
