package com.sp.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.common.StorageService;
import com.sp.app.mapper.MyPageMapper;
import com.sp.app.model.Member;
import com.sp.app.model.MyPage;

import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class MyPageServiceImpl implements MyPageService {

	private final MyPageMapper mapper;
	private final StorageService storageService;
	
	private String uploadPath;	
	
	@PostConstruct
	public void init() {
		uploadPath = this.storageService.getRealPath("/uploads/emp");		
	}
		
	@Override
	public List<Member> workList(Map<String, Object> map) throws Exception {
		List<Member> list = null;
		
		try {
			list = mapper.workList(map);
			
		} catch (Exception e) {
			log.info("workList : ", e);
		}
		return list;
	}

	@Override
	public List<Member> timeKeeping(Map<String, Object> map) throws Exception {
		List<Member> list = null;
		
		try {
			list = mapper.timeKeeping(map);
			
		} catch (Exception e) {
			log.info("timeKeeping : ", e);
		}
		return list;
	}

	@Override
	public Member findByEmpCode(String empCode) {
		Member dto = null;
		try {
			dto = mapper.findByEmpCode(empCode);
		} catch (Exception e) {
			log.info("findByEmpCode : ", e);
		}
		
		return dto;
	}

	@Override
	public List<Member> paidOffTime(Map<String, Object> map) throws Exception {
		List<Member> list = mapper.paidOffTime(map);
		try {
			list = mapper.paidOffTime(map);
			
		} catch (Exception e) {
			log.info("paidOffTime : ",e );
		}
		
		return list;
	}

	@Override
	public MyPage getLoginTime(long empIdx) {
		MyPage loginTime = null;
		
		try {
			loginTime = mapper.getLoginTime(empIdx); // 정상
			
			if(loginTime == null) {
				System.out.println("LoginTime데이터 없다" + empIdx);
			} else {
				System.out.println("Login Time: " + loginTime.getLoginTime());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return loginTime;
	}

	
	@Override
	public Member getEmpInfo(Map<String, Object> map) {
		Member empInfo = null;
		try {
			empInfo = mapper.getEmpInfo(map);
			
		} catch (Exception e) {
			log.info("getEmpInfo : ", e);
		}
		return empInfo;
	}
	
	
	@Override
	public void updateEmpInfo(Member dto) throws Exception {
		try {
			String saveFilename = storageService.uploadFileToServer(dto.getSelectFile(), uploadPath);
		
			if(saveFilename != null) {
				dto.setSaveProfile(saveFilename);
			}
			
			// 사진 업데이트
			mapper.updateEmpInfo(dto);
			
		} catch (Exception e) {
			log.info("updateEmpInfo : " , e);
			throw e;
		}
	}
	
	@Override
	public List<Member> getEmpRecord(long empIdx) throws Exception {
		
		List<Member> list = null;
		
		try {
			list = mapper.getEmpRecord(empIdx);
			
		} catch (Exception e) {
			log.info("getEmpRecord : ", e);
		}
		return list;
	}

	@Override
	public String getSysdate() {
		String sysDate = null;
		try {
			sysDate = mapper.getSysdate();
		} catch (Exception e) {
		}
		
		return sysDate;
	}

	@Override
	public String getLocalTime() {
		String localTime = null;
		try {
			localTime = mapper.getLocalTime();
			
		} catch (Exception e) {
		}
		return localTime;
	}
}
