package com.sp.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/emp/*")
public class EmpController {
	
	@GetMapping("list")
	public String employeeList() {
		return "/demp/list";
	}
	
	@GetMapping("add")
	public String employeeAddForm() {
		return "/emp/add";
	}
	
}
