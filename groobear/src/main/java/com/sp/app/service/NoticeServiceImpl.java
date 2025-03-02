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
import com.sp.app.mapper.NoticeMapper;
import com.sp.app.model.notice.Notice;
import com.sp.app.model.notice.Reply;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class NoticeServiceImpl implements NoticeService {
	private final NoticeMapper mapper;
	private final StorageService storageService;
	private final MyUtil myUtil;
	
	
	@Override
	public void insertNotice(Notice dto, String uploadPath) throws Exception {
		try {
			long seq = mapper.noticeSeq();
			dto.setNoticeIdx(seq);
			mapper.insertNotice(dto);
			
			if(! dto.getSelectFile().isEmpty()) {
				insertFile(dto, uploadPath);
			}
			
		} catch (Exception e) {
			log.info("insertNotice : ", e);
			
			throw e;
		}
		
	}

	@Override
	public void updatdeNotice(Notice dto, String uploadPath) throws Exception {
		try {
			mapper.updateNotice(dto);
			
			if(! dto.getSelectFile().isEmpty()) {
				insertFile(dto, uploadPath);
			}
		} catch (Exception e) {
			log.info("updatdeNotice : ", e);
			
			throw e;
		}
	}

	@Override
	public void deleteNotice(long noticeIdx, String uploadPath) throws Exception {
		try {
			List<Notice> listFile = listFile(noticeIdx);
			if(listFile != null) {
				for(Notice dto : listFile) {
					deleteUploadFile(uploadPath, dto.getSaveFilename());
				}
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("filed", "noticeIdx");
			map.put("noticeIdx", noticeIdx);
			deleteFile(map);
			
			mapper.deleteNotice(noticeIdx);
			
		} catch (Exception e) {
			log.info("deleteNotice : ", e);
			
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
	public List<Notice> listNotice(Map<String, Object> map) {
		List<Notice> list = null;
		 
		try {
			list = mapper.listNotice(map);
			
			long gap;
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			LocalDateTime today = LocalDateTime.now();
			for(Notice dto : list) {
				LocalDateTime dateTime = LocalDateTime.parse(dto.getRegDate(), formatter);
				gap = dateTime.until(today, ChronoUnit.HOURS);
				dto.setGap(gap);
				
				dto.setRegDate(dto.getRegDate().substring(0, 10));
			}
		} catch (Exception e) {
			log.info("listNotice : ", e);
		}
		
		return list;
	}

	@Override
	public Notice findById(long noticeIdx) {
		Notice dto = null;
		
		try {
			dto = mapper.findById(noticeIdx);
		} catch (Exception e) {
			log.info("findById : ", e);
		}
		
		return dto;
	}

	@Override
	public Notice findByPrev(Map<String, Object> map) {
		Notice dto = null;
		
		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			log.info("findByPrev : ", e);
		}
		
		return dto;
	}

	@Override
	public Notice findByNext(Map<String, Object> map) {
		Notice dto = null;
		
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
				dto.setContent(myUtil.htmlSymbols(dto.getContent()));
				
				map.put("cmtIdx", dto.getCmtIdx());
			}
			
		} catch (Exception e) {
			log.info("listReply : ", e);
		}
		
		return listReply;
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
	public List<Notice> listFile(long noticeIdx) {
		List<Notice> listFile = null;
		
		try {
			listFile = mapper.listFile(noticeIdx);
		} catch (Exception e) {
			log.info("listFile : ", e);
		}
		
		return listFile;
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
	public Notice findByFileId(long fileIdx) {
		Notice dto = null;
		
		try {
			dto = mapper.findByFileId(fileIdx);
		} catch (Exception e) {
			log.info("findByFileId : ", e);
		}
			
		return dto;
	}

	@Override
	public boolean deleteUploadFile(String uploadPath, String filename) {
		return storageService.deleteFile(uploadPath, filename);
	}
	
	protected void insertFile(Notice dto, String uploadPath) throws Exception {
		for (MultipartFile mf : dto.getSelectFile()) {
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

	@Override
	public List<Notice> listNoticeTop() {
		List<Notice> list = null;
		
		try {
			list = mapper.listNoticeTop();
		} catch (Exception e) {
			log.info("listNoticeTop : ", e);
		}
		
		return list;
	}
}
