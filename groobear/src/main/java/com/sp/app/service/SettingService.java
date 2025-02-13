package com.sp.app.service;

import java.util.List;
import java.util.Map;

import com.sp.app.model.Member;

public interface SettingService {
	public void updateEmployee(Member dto) throws Exception;
	public void updateEmpPwd(Member dto) throws Exception;
	
	public Member findByEmpIdx(Long empIdx);
	public String getEmpCode(Long empIdx);
	public List<Member> listFindEmployee(Map<Long, Object> map);
	
	public boolean isPasswordCheck(Long empIdx, String empPwd);
}
