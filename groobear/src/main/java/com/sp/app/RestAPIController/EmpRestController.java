package com.sp.app.RestAPIController;


import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sp.app.common.PaginateUtil;
import com.sp.app.model.Member;
import com.sp.app.service.MemberService;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/emp/*")
public class EmpRestController {
	private final MemberService service;
	
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
//			List<Member> positionList = service.listPosition(map);
//			model.addAttribute("positionList", positionList);
			
		} catch (Exception e) {
			log.info("employeeAddForm : ", e);
		}
		
		return map;
	}
	
}
