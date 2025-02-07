package com.sp.app.controller;


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

import com.sp.app.common.PaginateUtil;
import com.sp.app.model.Member;
import com.sp.app.model.SessionInfo;
import com.sp.app.service.MemberService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/emp/*")
public class EmpController {
	private final MemberService service;
	private final PaginateUtil paginateUtil;
	
	@GetMapping("list")
	public String employeeList(@RequestParam(name="page", defaultValue="1") int current_page,
			@RequestParam(name = "schType", defaultValue = "all") String schType,
			@RequestParam(name = "kwd", defaultValue = "") String kwd,
			Model model, HttpServletRequest req) throws Exception{
		
		try {
			int size = 5;
			int total_page = 0;
			int dataCount = 0;
			
			kwd = URLEncoder.encode(kwd, "UTF-8");
			
			Map<String, Object> map = new HashMap<>();
			map.put("schType", schType);
			map.put("kwd", kwd);
			
			dataCount = service.dataCount(map);
			total_page = paginateUtil.pageCount(dataCount, size);
			
			current_page = Math.min(current_page, total_page);
			
			int offset = (current_page -1) * size;
			if(offset < 0) {
				offset = 0;
			}
			
			map.put("offset", offset);
			map.put("size", size);
					
			List<Member> list = service.listMember(map);
			
			String cp = req.getContextPath();
			String query = "page=" + current_page;
			String listUrl = cp + "/bbs/list";
			String articleUrl = cp + "/bbs/article";

			if (!kwd.isBlank()) {
				String qs = "schType" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");

				listUrl += "?" + qs;
				query += "&" + qs;
			}
			
			String paging = paginateUtil.paging(current_page, total_page, listUrl);

			model.addAttribute("list", list);

			model.addAttribute("dataCount", dataCount);
			model.addAttribute("size", size);
			model.addAttribute("page", current_page);
			model.addAttribute("total_page", total_page);
			model.addAttribute("articleUrl", articleUrl);
			model.addAttribute("paging", paging);

			model.addAttribute("schType", schType);
			model.addAttribute("kwd", kwd);
			model.addAttribute("query", query);
	
		} catch (Exception e) {
			log.info("list : ", e);
		}
		return "/emp/list";
	}
	
	@GetMapping("add")
	public String employeeAddForm(Model model) throws Exception {
		model.addAttribute("mode", "add");
		return "emp/add";
	}
	
	@PostMapping("add")
	public String employeeAddSubmit(Member dto,
			HttpSession session) throws Exception {
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			dto.setEmpIdx(info.getEmpIdx());
			
			service.insertEmployee(dto);
		} catch (Exception e) {
			log.info("employeeAddSubmit : ", e);
		}
				
		return "redirect:/emp/list";
	}
		 
	@GetMapping("print")
	public String print(Model model) {
		List<Member> list = service.listMemberAll();
		
		model.addAttribute("list", list);
		
		return "emp/print";
				
	}
	
}
