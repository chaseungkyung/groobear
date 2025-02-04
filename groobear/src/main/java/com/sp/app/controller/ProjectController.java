package com.sp.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/project/*")
public class ProjectController {

	@GetMapping("list")
	public String projectAllList() {
		return "/project/list";
	}
	
	@GetMapping("write")
	public String writeForm() {
		return "/project/write";
	}
	
}
