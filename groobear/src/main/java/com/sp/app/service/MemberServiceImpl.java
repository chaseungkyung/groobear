package com.sp.app.service;

import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.sp.app.mapper.MemberMapper;
import com.sp.app.model.EmpRecord;
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
		try {
			mapper.insertEmployeeHistory(dto);
			
		} catch (Exception e) {
			log.info("insertEmployeeHistory : ", e);
			throw e;
		}
	}

	@Override
	public void updateLastLogin(String empCode) throws Exception {
		
	}

	@Override
	public void updateMemberStatus(Map<String, Object> map) throws Exception {
		
	}

	@Override
	public void updateEmployee(Member dto) throws Exception {
	    try {
	        Member emp = findByEmpIdx(dto.getEmpIdx());

	        // 이메일을 추가
	        dto.setEmail(dto.getEmail() + "@groobear.co.kr");

	        // 직원 정보 업데이트
	        mapper.updateEmployee(dto);

	        // Long 타입으로 수정하여 null 값을 처리
	        Long positionCode = emp.getPositionCode();  // Long 타입으로 수정
	        Long dtoPositionCode = dto.getPositionCode();  // Long 타입으로 수정

	        // 조건을 수정하여 null 값을 안전하게 처리
	        if ((emp.getTeamIdx() == null && positionCode == null) || 
	            !emp.getDeptIdx().equals(dto.getDeptIdx()) || 
	            !Objects.equals(positionCode, dtoPositionCode) || 
	            !Objects.equals(emp.getTeamIdx(), dto.getTeamIdx())) {
	            // 위 조건들이 만족되면 실행할 로직을 여기에 추가
	        }

	    } catch (Exception e) {
	        log.info("updateEmployee", e);
	        throw e;
	    }
	}


	@Override
	public void updateEmployeeDetail(Member dto) throws Exception {
		try {
			mapper.updateEmployeeDetail(dto);
		} catch (Exception e) {
			log.info("updateEmployeeDetail", e);
			throw e;
		}
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
			if(dto.getEmail() != null) {
				
				dto.setEmail(dto.getEmail().split("@")[0]);
			}
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
		int dataCount = 0;
		try {
			dataCount = mapper.dataCount(map);
		} catch (Exception e) {
			log.info("dataCount : ", e);
		}
		return dataCount;
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


	@Override
	public List<EmpRecord> getEmpRecord(long empIdx) throws Exception {
		List<EmpRecord> list = null;
		try {
			list = mapper.getEmpRecord(empIdx);
		} catch (Exception e) {
			log.info("getEmpRecord : ", e);
		}
		return list;
	}
}
