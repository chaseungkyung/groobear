package com.sp.app.controller.project;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.common.PaginateUtil;
import com.sp.app.model.SessionInfo;
import com.sp.app.model.project.Project;
import com.sp.app.model.project.ProjectMember;
import com.sp.app.service.project.ProjectService;

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

	@GetMapping("")
	public String projectHome() {
		return "redirect:/project/projectList";
	}

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

			dataCount = service.getProjectCount(map);
			total_page = paginateUtil.pageCount(dataCount, size);
			current_page = Math.min(current_page, total_page);

			int offset = (current_page - 1) * size;
			if (offset < 0) {
				offset = 0;
			}

			map.put("offset", offset);
			map.put("size", size);

			List<Project> listProject = service.getProjectList(map);

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
			log.info("projectList : ", e);
		}

		return "project/projectList";
	}

	@GetMapping("create")
	public String projectCreateForm(Model model) {

		try {
			model.addAttribute("mode", "create");
		} catch (Exception e) {
			log.info("projectCreateForm : ", e);
		}

		return "project/projectCreate";
	}
	
	@Transactional
	@PostMapping("create")
	public String projectCreateSubmit(Project projectDto) throws Exception {

		try {

			service.insertProject(projectDto);
			
			ProjectMember memberDto = new ProjectMember();
			memberDto.setProjIdx(projectDto.getProjIdx());
			memberDto.setEmpIdx(projectDto.getPmEmpIdx());

		} catch (Exception e) {
			log.info("projectCreateSubmit : ", e);
		}

		return "redirect:/project/list";
	}

	@GetMapping("update")
	public String projectUpdateForm(
			@RequestParam(name = "projIdx") long projIdx,
			@RequestParam(name = "page", defaultValue = "1") String page,
			Model model,
			HttpSession session) throws Exception {

		try {

			Project dto = Objects.requireNonNull(service.getProjectById(projIdx));
			
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			if(info == null || !"F".equals(info.getDeptIdx()) || info.getPositionCode() != 5) {
				return "redirect:/project/list?page=" + page;
			}

			model.addAttribute("dto", dto);
			model.addAttribute("page", page);
			model.addAttribute("mode", "update");

			return "project/projectCreate";

		} catch (NullPointerException e) {
		} catch (Exception e) {
			log.info("projectUpdateForm : ", e);
		}

		return "redirect:/project/list?page=" + page;
	}

	@PostMapping("update")
	public String projectUpdateSubmit(Project dto,
			@RequestParam(name = "page", defaultValue = "1") String page) {

		try {

			service.updateProject(dto);

		} catch (Exception e) {
			log.info("projectUpdateSubmit : ", e);
		}

		return "redirect:/project/list?page=" + page;
	}
	

	@Transactional
	@GetMapping("delete")
	public String projectDelete(
	        @RequestParam(name = "projIdx") long projIdx,
	        @RequestParam(name = "page", defaultValue = "1") String page,
	        HttpSession session) {
			
	    try {
	        SessionInfo info = (SessionInfo) session.getAttribute("member");

	        if (info == null || !"F".equals(info.getDeptIdx()) || info.getPositionCode() != 5) {
	            return "redirect:/project/list?page=" + page;
	        }

	        service.deleteProject(projIdx);

	    } catch (Exception e) {
	        log.info("projectDelete : ", e);
	    }

	    return "redirect:/project/list?page=" + page;
	}	

	

	// 프로젝트 상세 보기
	@GetMapping("detail/{projIdx}")
	public String projectDetail(
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

			Project dto = Objects.requireNonNull(service.getProjectById(projIdx));

			model.addAttribute("dto", dto);
			model.addAttribute("query", query);

			model.addAttribute("projIdx", projIdx);
			model.addAttribute("page", page);

			return "project/projectDetail";
		} catch (Exception e) {
			log.info("projectDetail : ", e);
		}

		return "redirect:/project/detail?" + query;
	}

	
	@GetMapping("insertProjectMember/{projIdx}")
	public String insertProjectMember(
			@PathVariable("projIdx") long projIdx,
			@RequestParam(name = "page", defaultValue = "1") String page,
			@RequestParam(name = "kwd", defaultValue = "") String kwd,
			Model model) {
		
		String query = "page=" + page;

		try {
			kwd = URLDecoder.decode(kwd, "utf-8");

			if (!kwd.isBlank()) {
				query += "&kwd=" + URLEncoder.encode(kwd, "utf-8");
			}

			
			model.addAttribute("projIdx", projIdx);
			model.addAttribute("page", page);
			model.addAttribute("query", query);

			return "project/projectTask";

		} catch (Exception e) {
			log.info("projectTask : ", e);
		}

		return "redirect:/project/detail?" + query;
	}
	
	

	@GetMapping("task/{projIdx}")
	public String projectTask(
			@PathVariable("projIdx") long projIdx,
			@RequestParam(name = "page", defaultValue = "1") String page,
			@RequestParam(name = "kwd", defaultValue = "") String kwd,
			Model model) {

		String query = "page=" + page;

		try {
			kwd = URLDecoder.decode(kwd, "utf-8");

			if (!kwd.isBlank()) {
				query += "&kwd=" + URLEncoder.encode(kwd, "utf-8");
			}

			Project dto = Objects.requireNonNull(service.getProjectById(projIdx));

			model.addAttribute("dto", dto);
			model.addAttribute("projIdx", projIdx);
			model.addAttribute("page", page);
			model.addAttribute("query", query);

			return "project/projectTask";

		} catch (Exception e) {
			log.info("projectTask : ", e);
		}

		return "redirect:/project/detail?" + query;
	}

}
