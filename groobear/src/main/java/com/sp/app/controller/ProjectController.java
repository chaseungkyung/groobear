package com.sp.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.model.Project;
import com.sp.app.service.ProjectService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/project/*")
public class ProjectController {
	private final ProjectService service;

	@GetMapping("list")
	public String projectAllList(Model model) {
		
		return "project/list";
	}
	
	@GetMapping("write")
	public String writeForm() {
		return "project/write";
	}
	
	@PostMapping("write")
	public String writeSubmit(Project dto, HttpSession session) throws Exception {
		
		try {
			service.insertProject(dto);
			
		} catch (Exception e) {
			log.info("writeSubmit : ", e);
		}
		
		return "redirect:/project/list";
	}
	
	@GetMapping("test")
	public String test() {
		return "project/test";
	}
	
	@GetMapping("article")
	public String article() {
		return "project/article";
	}
	
}
