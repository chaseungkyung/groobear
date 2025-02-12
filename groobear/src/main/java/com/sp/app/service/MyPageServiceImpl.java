package com.sp.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.mapper.MyPageMapper;
import com.sp.app.model.Member;

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
	public List<Member> paidTimeOff(Map<String, Object> map) throws Exception {
		List<Member> list = null;
		
		try {
			list = mapper.paidTimeOff(map);
			
		} catch (Exception e) {
			log.info("paidTimeOff : ", e);
		}
		return list;
	}

	@Override
	public List<Member> TimeKeeping(Map<String, Object> map) throws Exception {
		List<Member> list = null;
		
		try {
			list = mapper.TimeKeeping(map);
			
		} catch (Exception e) {
			log.info("TimeKeeping : ", e);
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


	
}
