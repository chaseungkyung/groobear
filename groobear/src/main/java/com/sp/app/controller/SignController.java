package com.sp.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.model.SessionInfo;
import com.sp.app.service.SignService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/sign/*")
public class SignController {

	private final SignService service;
	
	@GetMapping("list")
	public String singAllList() {
		return "sign/list";
	}
	
	@GetMapping("write")
	public String singWriteForm() {
		return "sign/write";
	}
	
	@PostMapping("write")
	public String signSubmit(Model model, HttpSession session) {
		
		try {
			
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			model.addAttribute("empName", info.getEmpName());
			model.addAttribute("deptName", info.getDeptName());
			model.addAttribute("teamName", info.getTeamName());
			model.addAttribute("positionName", info.getPositionName());
			
			
		} catch (Exception e) {
			log.info("handleHome : ", e);
		}
		
		return "sign/write";
	}
	
}
