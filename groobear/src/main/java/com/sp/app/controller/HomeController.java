package com.sp.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.model.SessionInfo;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/main/*")
public class HomeController {
	
	@GetMapping("home")
	public String handleHome(Model model, HttpSession session) throws Exception {
		
		try {
			
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			model.addAttribute("empName", info.getEmpName());
			
			
		} catch (Exception e) {
			log.info("handleHome : ", e);
		}
		
		return "main/home";
	}
}
