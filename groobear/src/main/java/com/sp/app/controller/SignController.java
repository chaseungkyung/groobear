package com.sp.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.model.SessionInfo;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/sign/*")
public class SignController {
	
	private String uploadPath;

	@GetMapping("list")
	public String singAllList() {
		return "sign/list";
	}
	
	@GetMapping("write")
	public String singWriteForm() {
		
		return "sign/write";
	}
	
	@PostMapping("write")
	public String singSubmit(HttpSession session) {
		
		try {
			
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			
		} catch (Exception e) {
			log.info("handleHome : ", e);
		}
		
		return "sign/write";
	}
	
}
