package com.sp.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping(value = "/")
public class LoginController {

	@RequestMapping(method = {RequestMethod.GET, RequestMethod.POST})
	public String loginForm(@RequestParam(name = "login_error", required = false) String login_error, Model model) {
		
		if(login_error != null) {
			model.addAttribute("message", "사번 또는 패스워드가 일치하지 않습니다.");
		}
		
		return "login/login";
	}
	
	
	@GetMapping("noAuthorized")
	public String noAuthorized(Model model) {
		return "login/noAuthorized";
	}
	
	@GetMapping("expired")
	public String expired() throws Exception {
		// 세션이 익스파이어드(만료) 된 경우
		return "login/expired";
	}	
	
}
