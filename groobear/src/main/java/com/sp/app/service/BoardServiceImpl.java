package com.sp.app.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.app.common.MyUtil;
import com.sp.app.common.StorageService;
import com.sp.app.exception.StorageException;
import com.sp.app.mapper.BoardMapper;
import com.sp.app.model.board.Board;
import com.sp.app.model.board.Reply;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class BoardServiceImpl implements BoardService {
	private final BoardMapper mapper;
	private final StorageService storageService;
	private final MyUtil myUtil;
	
	@Override
	public void insertBoard(Board dto, String uploadPath) throws Exception {
		try {
			long seq = mapper.boardSeq();
			dto.setPostIdx(seq);
			mapper.insertBoard(dto);
			
			if(! dto.getSelectFile().isEmpty()) {
				insertFile(dto, uploadPath);
			}
			
		} catch (Exception e) {
			log.info("insertBoard : ", e);
			
			throw e;
		}
	}
	
	@Override
	public void updateBoard(Board dto, String uploadPath) throws Exception {
		try {
			mapper.updateBoard(dto);
			
			if(! dto.getSelectFile().isEmpty()) {
				insertFile(dto, uploadPath);
			}
			
		} catch (Exception e) {
			log.info("updateBoard : ", e);
			
			throw e;
		}
	}
	
	@Override
	public void deleteBoard(long postIdx, String uploadPath) throws Exception {
		try {
			List<Board> listFile = listFile(postIdx);
			if(listFile != null) {
				for(Board dto : listFile) {
					deleteUploadFile(uploadPath, dto.getSaveFilename());
				}
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "postIdx");
			map.put("postIdx", postIdx);
			deleteFile(map);
			
			mapper.deleteBoard(postIdx);
			
		} catch (Exception e) {
			log.info("deleteBoard : ", e);
			
			throw e;			
		}
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
	public List<Board> listBoard(Map<String, Object> map) {
		List<Board> list = null;
		
		try {
			list = mapper.listBoard(map);
			
			long gap;
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			LocalDateTime today = LocalDateTime.now();
			for(Board dto : list) {
				LocalDateTime dateTime = LocalDateTime.parse(dto.getRegDate(), formatter);
				gap = dateTime.until(today, ChronoUnit.HOURS);
				dto.setGap(gap);
				
				dto.setRegDate(dto.getRegDate().substring(0, 10));
			}
			
		} catch (Exception e) {
			log.info("listBoard : ", e);
		}
		
		return list;
	}
	
	@Override
	public Board findById(long postIdx) {
		Board dto = null;
		
		try {
			dto = mapper.findById(postIdx);
		} catch (Exception e) {
			log.info("findById : ", e);
		}
		
		return dto;
	}
	
	@Override
	public Board findByPrev(Map<String, Object> map) {
		Board dto = null;
		
		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			log.info("findByPrev : ", e);
		}
		
		return dto;
	}
	
	@Override
	public Board findByNext(Map<String, Object> map) {
		Board dto = null;
		
		try {
			dto = mapper.findByNext(map);
		} catch (Exception e) {
			log.info("findByNext : ", e);
		}
		
		return dto;
	}
	
	@Override
	public void insertReply(Reply dto) throws Exception {
		try {
			mapper.insertReply(dto);
		} catch (Exception e) {
			log.info("insertReply : ", e);
			
			throw e;
		}
	}
	
	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteReply(map);
		} catch (Exception e) {
			log.info("deleteReply : ", e);
			
			throw e;			
		}
	}
	
	@Override
	public int replyCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.replyCount(map);
		} catch (Exception e) {
			log.info("replyCount : ", e);
		}
		
		return result;
	}
	
	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> listReply = null;
		
		try {
			listReply = mapper.listReply(map);
			
			for(Reply dto : listReply) {
				dto.setEmpName(myUtil.nameMasking(dto.getEmpName()));
				dto.setContent(myUtil.htmlSymbols(dto.getContent()));
			
				map.put("cmtIdx", dto.getCmtIdx());
			}
			
		} catch (Exception e) {
			log.info("listReply : ", e);
		}
		
		return listReply;
	}
	
	@Override
	public List<Board> listFile(long postIdx) {
		List<Board> listFile = null;
		
		try {
			listFile = mapper.listFile(postIdx);
		} catch (Exception e) {
			log.info("listFile : ", e);
		}
		
		return listFile;
	}
	
	@Override
	public Board findByFileId(long fileIdx) {
		Board dto = null;
		
		try {
			dto = mapper.findByFileId(fileIdx);
		} catch (Exception e) {
			log.info("findByFileId : ", e);
		}
		
		return dto;
	}
	
	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteFile(map);
		} catch (Exception e) {
			log.info("deleteFile : ", e);
			
			throw e;
		}
	}
	
	@Override
	public boolean deleteUploadFile(String uploadPath, String filename) {
		return storageService.deleteFile(uploadPath, filename);
	}
	
	protected void insertFile(Board dto, String uploadPath) throws Exception {
		for(MultipartFile mf : dto.getSelectFile()) {
			try {
				String saveFilename = 
						Objects.requireNonNull(storageService.uploadFileToServer(mf, uploadPath));
				String originalFilename = mf.getOriginalFilename();
				
				dto.setOriginalFilename(originalFilename);
				dto.setSaveFilename(saveFilename);
				
				mapper.insertFile(dto);
				
			} catch (NullPointerException e) {
			} catch (StorageException e) {
			} catch (Exception e) {
				throw e;
			}
		}
	}
}