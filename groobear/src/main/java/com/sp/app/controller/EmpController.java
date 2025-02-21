package com.sp.app.controller;


import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		return "emp/list";
	}
	
	@GetMapping("add")
	public String employeeAddForm(Model model) throws Exception {
		
		try {
			
			Map<String, Object> map = new HashMap<>();
			
			List<Member> departmentList = service.listDepartment(map);
			List<Member> teamList = service.listTeam(map);
			List<Member> positionList = service.listPosition(map);
			
			model.addAttribute("departmentList", departmentList);
			model.addAttribute("teamList", teamList);
			model.addAttribute("positionList", positionList);
			model.addAttribute("mode", "write");
			
		} catch (Exception e) {
			log.info("employeeAddForm : ", e);
		}
		
		model.addAttribute("mode", "add");
		return "emp/add";
	}
	
	@PostMapping("add")
	public String employeeAddSubmit(Member dto, Model model, HttpServletRequest req) throws Exception {
		try {
			
			String[] hireDate = dto.getHireDate().split("-");
			
			String hireDateY = hireDate[0];
			String hireDateM = hireDate[1];
			String hireDateYM = hireDateY + hireDateM;
			
			String lastEmpCode = service.getLastEmpCode(hireDateYM);
			
			int lastNumber = 0;
			
			if(lastEmpCode != null) {
				lastNumber = Integer.parseInt(lastEmpCode.substring(6));
			}
			
			String newHireRank = String.format("%04d", lastNumber + 1);
			
			dto.setEmpCode(hireDateYM + newHireRank);
			dto.setEmail(dto.getEmpCode() + "@groobear.co.kr");
			
			dto.setBirth(dto.getRrn().substring(0, 6));
			// dto.setEmpPwd(dto.getBirth()); // 생년월일로 초기비밀번호 할당
			dto.setEmpPwd("1234"); // test 로그인 편하게 그냥 1234 초기 비밀번호
			
			service.insertEmployee(dto);
			service.insertEmployeeDetail(dto);
			
			
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
	
	@GetMapping("update")
	public String updateForm(
			@RequestParam(name="empIdx") long empIdx,
			Model model, HttpSession session ) throws Exception {
	try {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Member dto = Objects.requireNonNull(service.findByEmpIdx(empIdx));
		
		if( info.getEmpIdx() != dto.getEmpIdx()) {
			return "redirect:/emp/list";
		}
		model.addAttribute("dto", dto);
		model.addAttribute("empIdx", empIdx);
		model.addAttribute("mode", "update");
		
	} catch (NullPointerException e) {
		throw e;
	} catch (Exception e) {
		log.info("updateForm", e);
		throw e;
	}
		
	return "emp/list";
	}
	
	@PostMapping("update")
	public Map<String, ?> updateSubmit(Member dto, HttpSession session ) throws Exception {
		
		Map<String, Object> model = new HashMap<>();
		String state = "false";
		try {
			service.updateEmployee(dto);
			service.updateEmployeeDetail(dto);
			service.updateEmployeeHistory(dto);
			state = "true";
			
		} catch (Exception e) {
			throw e;
		}
		model.put("state", state);
		return model;
	}
}
