package com.sp.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dept/*")
public class DeptController {

	@GetMapping("dept")
	public String dept() {
		return "dept/dept";
	}
	
}
