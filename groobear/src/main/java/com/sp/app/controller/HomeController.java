package com.sp.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sp.app.model.SessionInfo;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class HomeController {
	
	@GetMapping("/main")
	public String handleHome(Model model, HttpSession session) throws Exception {
		
		try {
			
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			model.addAttribute("empName", info.getEmpName());
			model.addAttribute("deptName", info.getDeptName());
			
			
		} catch (Exception e) {
			log.info("handleHome : ", e);
		}
		
		return "main/home";
	}
}
