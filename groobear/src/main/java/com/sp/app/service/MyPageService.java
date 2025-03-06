package com.sp.app.service;

import java.util.List;
import java.util.Map;

import com.sp.app.model.Member;
import com.sp.app.model.MyPage;

public interface MyPageService {

	public List<Member> workList(Map<String, Object> map) throws Exception;
	public List<Member> timeKeeping(Map<String, Object> map) throws Exception;
	public List<Member> paidOffTime(Map<String, Object> map) throws Exception;
	
	public MyPage getLoginTime(long empIdx) throws Exception;
	public Member getEmpInfo(Map<String, Object> map) throws Exception;
	public void updateEmpInfo(Member dto) throws Exception;
	public List<Member> getEmpRecord(long empIdx) throws Exception;
	
	// 부장급 검색
	public Member findByEmpCode(String empCode);
	
	public String getSysdate();
	public String getLocalTime();
}
