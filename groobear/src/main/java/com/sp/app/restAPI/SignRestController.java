package com.sp.app.restAPI;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sp.app.model.Member;
import com.sp.app.service.MemberService;
import com.sp.app.service.SignService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/sign/*")
public class SignRestController {
	
	private final MemberService service;
	private final SignService signService;
	
	@GetMapping("listEmp")
	public Map<String, Object> listMember(Model model) {
		
		Map<String, Object> map = new HashMap<>();
		
		try {
			
			List<Member> list = signService.listMember(map);
			
			map.put("memberList", list);
			
		} catch (Exception e) {
			log.info("listMember : ", e);
		}
		
		return map;
	}
	
	@GetMapping("getDeptAndPosition")
	public HashMap<String, Object> getDeptAndPosition(Model model) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		try {
		
			List<Member> departmentList = service.listDepartment(map);
			List<Member> positionList = service.listPosition(map);
			
			map.put("dept", departmentList);
			map.put("position", positionList);
			
		} catch (Exception e) {
			log.info("employeeAddForm : ", e);
		}
		
		return map;
	}
	
	@GetMapping("getTeam")
	public HashMap<String, Object> getTeam(@RequestParam(name="deptIdx") String deptIdx) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("deptIdx", deptIdx);
		
		try {
			
			List<Member> teamList = service.listTeam(map);
			
			map.put("team", teamList);
			
		} catch (Exception e) {
			log.info("employeeAddForm : ", e);
		}
		
		return map;
	}
	
	@GetMapping("getEmployees")
	public HashMap<String, Object> getEmployees(
			@RequestParam(name="deptIdx", required = false) String deptIdx,
			@RequestParam(name="teamIdx", required = false) String teamIdx,
			@RequestParam(name="positionCode", required = false) Long positionCode
			) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if (deptIdx != null) map.put("deptIdx", deptIdx);
		
	    if (teamIdx != null) map.put("teamIdx", teamIdx);
	    
	    if (positionCode != null) map.put("positionCode", positionCode);
		
		try {
			
			List<Member> employees = signService.listMember(map);
			map.put("employees", employees);
			
		} catch (Exception e) {
			log.info("employeeAddForm : ", e);
		}
		
		return map;
	}
	
}
