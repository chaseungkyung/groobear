package com.sp.app.service;

import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sp.app.mapper.SettingMapper;
import com.sp.app.model.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class SettingServiceImpl implements SettingService {
	private final SettingMapper mapper;
	private final PasswordEncoder bcryptEncoder;
	
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public void updateEmployee(Member dto) throws Exception {
		
		try {
			
			mapper.updateEmployeeDetail(dto);
			
		} catch (Exception e) {
			log.info("updateEmployee : ", e);
			
			throw e;
		}
	}
	
	@Override
	public void updateEmpPwd(Member dto) throws Exception {
		
		if(isPasswordCheck(dto.getEmpIdx(), dto.getEmpPwd())) {
			throw new RuntimeException("비밀번호가 기존과 일치합니다.");
		}
		
		try {
			String encEmpPwd = bcryptEncoder.encode(dto.getEmpPwd());
			dto.setEmpPwd(encEmpPwd);
			
			mapper.updateEmpPwd(dto);
		} catch (Exception e) {
			log.info("updateEmpPwd : ", e);
			
			throw e;
		}
	}
	
	@Override
	public Member findByEmpIdx(Long empIdx) {
		Member dto = null;
		
		try {
			dto = Objects.requireNonNull(mapper.findByEmpIdx(empIdx));
		} catch (Exception e) {
			log.info("findByEmpCode : ", e);
		}
		
		return dto;
	}	
	
	@Override
	public String getEmpCode(Long empIdx) {
		try {
			String result = Objects.requireNonNull(mapper.getEmpCode(empIdx));
			return result;
		} catch (Exception e) {
			log.info("getEmpIdx : ", e);
		}
		
		return null;
	}
	
	@Override
	public List<Member> listFindEmployee(Map<Long, Object> map) {
		List<Member> list = null;
		
		try {
			list = mapper.listFindEmployee(map);
		} catch (Exception e) {
			log.info("listFindEmployee : ", e);
		}
		
		return list;
	}
	
	@Override
	public boolean isPasswordCheck(Long empIdx, String empPwd) {
		try {
			Member dto = Objects.requireNonNull(findByEmpIdx(empIdx));
			return bcryptEncoder.matches(empPwd, dto.getEmpPwd());
		} catch (NullPointerException e) {
		} catch (Exception e) {
		}
		
		return false;
	}
	
}