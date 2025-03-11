package com.sp.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.common.StorageService;
import com.sp.app.mapper.ClubMapper;
import com.sp.app.model.Club;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ClubServiceImpl implements ClubService {
	private final ClubMapper mapper;
	private final StorageService storageService;
	
	@Override
	public void insertClub(Club dto, String uploadPath) throws Exception {
		try {
			String saveFilename = storageService.uploadFileToServer(dto.getSelectFile(), uploadPath);
			if (saveFilename != null) {
				dto.setImageFilename(saveFilename);

				mapper.insertClub(dto);
			}
		} catch (Exception e) {
			log.info("insertClub : ", e);
			
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
	public List<Club> listClub(Map<String, Object> map) {
		List<Club> list = null;

		try {
			list = mapper.listClub(map);
		} catch (Exception e) {
			log.info("listClub : ", e);
		}

		return list;
	}

	@Override
	public Club findById(long num) {
		Club dto = null;

		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			log.info("findById : ", e);
		}

		return dto;
	}

	@Override
	public Club findByPrev(Map<String, Object> map) {
		Club dto = null;

		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			log.info("findByPrev : ", e);
		}

		return dto;
	}

	@Override
	public Club findByNext(Map<String, Object> map) {
		Club dto = null;

		try {
			dto =  mapper.findByNext(map);
		} catch (Exception e) {
			log.info("findByNext : ", e);
		}

		return dto;
	}

	@Override
	public void updateClub(Club dto, String uploadPath) throws Exception {
		try {
			// 업로드한 파일이 존재한 경우
			if(dto.getSelectFile() != null && ! dto.getSelectFile().isEmpty()) {
				if(! dto.getImageFilename().isBlank()) {
					deleteUploadFile(uploadPath, dto.getImageFilename());
				}
				
				String saveFilename = storageService.uploadFileToServer(dto.getSelectFile(), uploadPath);
				dto.setImageFilename(saveFilename);
			}

			 mapper.updateClub(dto);
		} catch (Exception e) {
			log.info("updateClub : ", e);
			
			throw e;
		}
	}

	@Override
	public void deleteClub(long num, String uploadPath, String filename) throws Exception {
		try {
			if (filename != null) {
				deleteUploadFile(uploadPath, filename);
			}

			 mapper.deleteClub(num);
		} catch (Exception e) {
			log.info("deleteClub : ", e);
			
			throw e;
		}
	}
	
	@Override
	public boolean deleteUploadFile(String uploadPath, String filename) {
		return storageService.deleteFile(uploadPath, filename);
	}	
}
