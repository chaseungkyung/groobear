package com.sp.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.model.Member;
import com.sp.app.model.SessionInfo;
import com.sp.app.service.MemberService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class LoginController {

	private final MemberService service;

	@GetMapping("/")
	public String loginForm(Model model) {
		return "login/login";
	}
	
	@PostMapping("login")
	public String loginSubmit(
			@RequestParam(name = "empCode") String empCode,
			@RequestParam(name = "empPwd") String empPwd,
			Model model, HttpSession session) {
		
		Member dto = service.loginMember(empCode);
		
		
		if(dto == null || ! empPwd.equals(dto.getEmpPwd())) {
			model.addAttribute("message", "로그인에 실패했습니다.");
			
			return "login/login";
		}
		
		SessionInfo info = SessionInfo.builder()
				.empCode(dto.getEmpCode())
				.empPwd(dto.getEmpPwd())
				.empName(dto.getEmpName())
				.empRank(dto.getEmpRank())
				.teamIdx(dto.getTeamIdx())
				.build();
		
		session.setMaxInactiveInterval(60 * 60);
		
		session.setAttribute("member", info);
		
		return "main/home";
		
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("member");

		session.invalidate();

		return "login/login";
	}
}
