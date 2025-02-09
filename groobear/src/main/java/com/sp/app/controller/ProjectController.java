package com.sp.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.common.PaginateUtil;
import com.sp.app.model.Project;
import com.sp.app.service.ProjectService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/project/*")
public class ProjectController {
	private final ProjectService service;
	private final PaginateUtil paginateUtil;

	@GetMapping("list")
	public String projectAllList(@RequestParam(name = "page", defaultValue = "1") int current_page,
			Model model,
			HttpServletRequest req) {
		
		try {
			int size = 10;
			int total_page = 0;
			int dataCount = 0;
			
			Map<String, Object> map = new HashMap<>();
			
			dataCount = service.dataCount(map);
			total_page = paginateUtil.pageCount(dataCount, size);
			current_page = Math.max(current_page, total_page);
			
			int offset = (current_page - 1) * size;
			if(offset < 0) {
				offset = 0;
			}
			
			map.put("offset", offset);
			map.put("size", size);
			
			List<Project> listProject = service.listProject(map);
			
			String cp = req.getContextPath();
			String query = "page=" + current_page;
			String listUrl = cp + "/project/list";
			String articleUrl = cp + "/project/article";
			
			String paging = paginateUtil.paging(current_page, total_page, listUrl);
				
			model.addAttribute("listProject", listProject);
			model.addAttribute("page", current_page);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("size", size);
			model.addAttribute("total_page", total_page);
			model.addAttribute("articleUrl", articleUrl);
			model.addAttribute("paging", paging);
			
			model.addAttribute("query", query);
					
		} catch (Exception e) {
			log.info("listProject : ", e);
		}
		
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
