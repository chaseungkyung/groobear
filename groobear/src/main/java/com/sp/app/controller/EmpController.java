package com.sp.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/emp/*")
public class EmpController {

	@GetMapping("list")
	public String employeeList() {
		return "/emp/list";
	}
	
	@GetMapping("add")
	public String employeeAddForm() {
		return "/emp/add";
	}
	
}
