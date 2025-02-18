package com.sp.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.mapper.MyPageMapper;
import com.sp.app.model.Member;
import com.sp.app.model.MyPage;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class MyPageServiceImpl implements MyPageService {

	private final MyPageMapper mapper;
	
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
			loginTime = mapper.getLoginTime(empIdx);
			
		} catch (Exception e) {
		
		}
		return loginTime;
	}


}
