package com.sp.app.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.PaginateUtil;
import com.sp.app.model.project.Project;
import com.sp.app.model.project.ProjectMember;
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
	public String projectAllList(
			@RequestParam(name = "page", defaultValue = "1") int current_page,
			@RequestParam(name = "kwd", defaultValue = "") String kwd,
			Model model,
			HttpServletRequest req, HttpSession session) {

		try {
			int size = 5;
			int total_page = 0;
			int dataCount = 0;

			kwd = URLDecoder.decode(kwd, "utf-8");

			// SessionInfo info = (SessionInfo)session.getAttribute("member");

			Map<String, Object> map = new HashMap<>();
			map.put("kwd", kwd);

			dataCount = service.dataCount(map);
			total_page = paginateUtil.pageCount(dataCount, size);
			current_page = Math.min(current_page, total_page);

			int offset = (current_page - 1) * size;
			if (offset < 0) {
				offset = 0;
			}

			map.put("offset", offset);
			map.put("size", size);

			List<Project> listProject = service.listProject(map);

			String cp = req.getContextPath();
			String query = "page=" + current_page;
			String listUrl = cp + "/project/list";
			String detailUrl = cp + "/project/detail";

			if (!kwd.isBlank()) {
				String qs = "kwd=" + URLEncoder.encode(kwd, "utf-8");

				listUrl += "?" + qs;
				query += "&" + qs;
			}

			String paging = paginateUtil.paging(current_page, total_page, listUrl);

			model.addAttribute("listProject", listProject);
			model.addAttribute("page", current_page);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("size", size);
			model.addAttribute("total_page", total_page);
			model.addAttribute("detailUrl", detailUrl);
			model.addAttribute("paging", paging);

			model.addAttribute("query", query);

		} catch (Exception e) {
			log.info("listProject : ", e);
		}

		return "project/list";
	}

	@GetMapping("write")
	public String writeForm(Model model) {

		try {
			model.addAttribute("mode", "write");
		} catch (Exception e) {
			log.info("writeForm : ", e);
		}

		return "project/write";
	}

	@PostMapping("write")
	public String writeSubmit(Project dto, HttpSession session) throws Exception {

		try {
			// SessionInfo info = (SessionInfo) session.getAttribute("member");

			service.insertProject(dto);

		} catch (Exception e) {
			log.info("writeSubmit : ", e);
		}

		return "redirect:/project/list";
	}
	
	@GetMapping("update")
	public String updateForm(
			@RequestParam(name = "projIdx") long projIdx,
			@RequestParam(name = "page") String page,
			Model model,
			HttpSession session) throws Exception {

		try {
			
			Project dto = Objects.requireNonNull(service.findById(projIdx));

			// if(info.getEmpIdx() != dto.getCrtEmpIdx()) {
			// 	return "redirect:/project/list?page=" + page;
			// }

			model.addAttribute("dto", dto);
			model.addAttribute("page", page);
			model.addAttribute("mode", "update");

			return "project/write";

		} catch (NullPointerException e) {
		} catch (Exception e) {
			log.info("updateForm : ", e);
		}

		return "redirect:/project/list?page=" + page;
	}

	@PostMapping("update")
	public String updateSubmit(Project dto,
			@RequestParam(name = "page") String page) {

		try {
			service.updateProject(dto);
			
		} catch (Exception e) {
			log.info("updateSubmit : ", e);
		}

		return "redirect:/project/list?page=" + page;
	}

	// 프로젝트 상세 보기
	@GetMapping("detail/{projIdx}")
	public String detail(
			@PathVariable("projIdx") long projIdx,
			@RequestParam(name = "page") String page,
			@RequestParam(name = "kwd", defaultValue = "") String kwd,
			Model model,
			HttpSession session) {

		String query = "page=" + page;

		try {
			kwd = URLDecoder.decode(kwd, "utf-8");
			if (!kwd.isBlank()) {
				query += "&kwd=" + URLEncoder.encode(kwd, "utf-8");
			}

			Project dto = Objects.requireNonNull(service.findById(projIdx));

			model.addAttribute("dto", dto);
			model.addAttribute("query", query);

			model.addAttribute("projIdx", projIdx);
			model.addAttribute("page", page);

			return "project/detail";
		} catch (Exception e) {
			log.info("detail : ", e);
		}

		return "redirect:/project/list?" + query;
	}


	// AJAX-JSON
	@ResponseBody
	@PostMapping("insertProjectMember")
	public Map<String, ?> insertProjectMember(ProjectMember dto) throws Exception {
		Map<String, Object> model = new HashMap<>();

		String state = "false";
		try {
			service.insertProjectMember(dto);
			state = "true";
		} catch (Exception e) {
		}

		model.put("state", state);
		return model;
	}
	
	@GetMapping("task/{projIdx}")
	public String task(
			@PathVariable("projIdx") long projIdx,
			@RequestParam(name = "page", defaultValue = "1") String page,
			@RequestParam(name = "kwd", defaultValue = "") String kwd,
			Model model) {
		
		String query = "page="+page;
		
		try {
			kwd = URLDecoder.decode(kwd,"utf-8");
			
			if(!kwd.isBlank()) {
				query += "&kwd=" + URLEncoder.encode(kwd,"utf-8");
			}
			
			Project dto = Objects.requireNonNull(service.findById(projIdx));
			
			model.addAttribute("dto", dto);
			model.addAttribute("projIdx", projIdx);
			model.addAttribute("page", page);
			model.addAttribute("query", query);
			
			return "project/task";
		} catch (Exception e) {
			log.info("task : ", e);
		}
		
		
		return "redirect:/project/list?" + query;
	}
	
	
	@GetMapping("post")
	public String postForm(Model model) throws Exception {

		return "project/postList";
	}

}
