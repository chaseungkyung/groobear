package com.sp.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.mapper.MemberMapper;
import com.sp.app.model.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class MemberServiceImpl implements MemberService {

	private final MemberMapper mapper;
	
	@Override
	public Member loginMember(String empCode) {
		
		Member dto = null;
		
		try {
			
			dto = mapper.loginMember(empCode);
			
		} catch (Exception e) {
			log.info("loginMember : ", e);
		}
		
		return dto;
	}
	
	@Override
	public void insertEmployee(Member dto) throws Exception {
		
		try {
			
			mapper.insertEmployee(dto);
			
		} catch (Exception e) {
			log.info("insertEmployee : ", e);
			
			throw e;
		}
		
	}

	@Override
	public void insertEmployeeDetail(Member dto) throws Exception {
		
		try {
			
			mapper.insertEmployeeDetail(dto);
			
		} catch (Exception e) {
			log.info("insertEmployeeDetail : ", e);
			
			throw e;
		}
		
	}

	@Override
	public void insertEmployeeHistory(Member dto) throws Exception {
		
	}

	@Override
	public void updateLastLogin(String empCode) throws Exception {
		
	}

	@Override
	public void updateMemberStatus(Map<String, Object> map) throws Exception {
		
	}

	@Override
	public void updateEmployee(Member dto) throws Exception {
		
	}

	@Override
	public void updateEmployeeDetail(Member dto) throws Exception {
		
	}

	@Override
	public void updateEmployeeHistory(Member dto) throws Exception {
		
	}

	@Override
	public int checkFailureCount(String empCode) {
		return 0;
	}

	@Override
	public void updateFailureCountReset(String empCode) throws Exception {
		
	}

	@Override
	public void updateFailureCount(String empCode) throws Exception {
		
	}
	
	

	@Override
	public Member findByEmpIdx(String empIdx) {
		Member dto = null;
		try {
			dto = mapper.findByEmpIdx(empIdx);
		} catch (Exception e) {
			log.info("findByEmpIdx", e);
		}
		return dto;
	}

	@Override
	public List<Member> listFindMember(Map<String, Object> map) {

		return null;
	}

	@Override
	public List<Member> listMember(Map<String, Object> map) {
		List<Member> list = null;
		
		try {
			list = mapper.listMember(map);
			
		} catch (Exception e) {
			log.info("listFindMember : ", e);
		}
		return list;
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
	public List<Member> listMemberAll() {
		List<Member> list = null;
		try {
			list = mapper.listMemberAll();
		} catch (Exception e) {
			log.info("listMemberAll : ", e);
		}
		return list;
	}

	
	
}
