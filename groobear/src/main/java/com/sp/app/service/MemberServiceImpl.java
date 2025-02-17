package com.sp.app.service;

import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.security.crypto.password.PasswordEncoder;
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
	private final PasswordEncoder bcryptEncoder;	

	
	@Override
	public void insertEmployee(Member dto) throws Exception {
		
		try {
			
			String encPassword = bcryptEncoder.encode(dto.getEmpPwd());
			dto.setEmpPwd(encPassword);
			
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
	public Member findByEmpIdx(long empIdx) {
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

	@Override
	public List<Member> listDepartment(Map<String, Object> map) {
		
		List<Member> list = null;
		
		try {
			
			list = mapper.listDepartment(map);
			
		} catch (Exception e) {
			log.info("listDepartment : ", e);
		}
		
		return list;
	}

	@Override
	public List<Member> listTeam(Map<String, Object> map) {
		
		List<Member> list = null;
		
		try {
			
			list = mapper.listTeam(map);
			
		} catch (Exception e) {
			log.info("listDepartment : ", e);
		}
		
		return list;
		
	}

	@Override
	public List<Member> listPosition(Map<String, Object> map) {
		
		List<Member> list = null;
		
		try {
			
			list = mapper.listPosition(map);
			
		} catch (Exception e) {
			log.info("listDepartment : ", e);
		}
		
		return list;
	}

	@Override
	public String getLastEmpCode(String empCode) {
		
		return mapper.getLastEmpCode(empCode);
	}

	@Override
	public void updateMemberEnabled(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Long getMemberIdx(String empCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Member findByEmpCode(String emdCode) {
		Member dto = null;
		
		try {
			dto = mapper.findByEmpCode(emdCode);
		} catch (Exception e) {
			log.info("findByEmpCode : ", e);
		}
		
		return dto;
	}
	
	@Override
	public boolean isPasswordCheck(String empCode, String empPwd) {
		try {
			// 패스워드 비교(userPwd를 암호화 해서 dto.getUserPwd()와 비교하면 안된다.)
			//                 userPwd를 암호화하면 가입할때의 암호화 값과 다름. 암호화할때 마다 다른 값
			
			Member dto = Objects.requireNonNull(findByEmpCode(empCode));
			
			return bcryptEncoder.matches(empPwd, dto.getEmpPwd());
		} catch (NullPointerException e) {
		} catch (Exception e) {
		}
		
		return false;		
	}
}
