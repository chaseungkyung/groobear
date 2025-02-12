package com.sp.app.service;

import java.util.List;
import java.util.Map;

import com.sp.app.model.Member;

public interface MyPageService {

	public List<Member> workList(Map<String, Object> map) throws Exception;
	public List<Member> timeKeeping(Map<String, Object> map) throws Exception;
	
	// 부장급 검색
	public Member findByEmpCode(String empCode);
	
}
