package com.sp.app.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.model.Member;
import com.sp.app.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/emp/*")
public class EmpController {
	private final MemberService service;
	
	@GetMapping("list")
	public String employeeList(Model model) throws Exception{
		
		try {
			Map<String, Object> map = new HashMap<>();
			List<Member> list = service.listMember(map);
			
			model.addAttribute("list", list);
	
		} catch (Exception e) {
			
		}
		
		return "/emp/list";
	}
	
	@GetMapping("add")
	public String employeeAddForm() {
		return "/emp/add";
	}
		 
	
}
