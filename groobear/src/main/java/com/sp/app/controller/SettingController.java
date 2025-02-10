package com.sp.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.model.Member;
import com.sp.app.model.SessionInfo;
import com.sp.app.service.MemberService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mypage/*")
@Slf4j
@RequiredArgsConstructor
public class SettingController {
	
	private final MemberService service;
	
	@GetMapping("mypage")
	public String mypage() {
		return "/mypage/mypage";
	}
	
	@GetMapping("setting") // not yet setting page
	public String setting() {
		return "/mypage/setting";
	}
	
	// 비밀번호 확인
	@PostMapping("pwd")
	public String checkPwd(
			@RequestParam(name = "empCode") String empCode,
			@RequestParam(name = "empPwd") String empPwd, 
			Model model, HttpSession session) {
		
		// 1 패스워드 입력과 확인
		Member dto = service.loginMember(empCode);
		
		//로그인된 사번의 패스워드와 입력 패스워드를 비교하는 문장이 필요할듯
		if(dto == null || ! empCode.equals(dto.getEmpCode())) {
			model.addAttribute("message", "비밀번호를 다시 입력해주세요.");
			
			return "/mypage/setting";
		}
		
		SessionInfo info = SessionInfo.builder()
				.empCode(dto.getEmpCode())
				.empName(dto.getEmpName())
				.empRank(dto.getEmpRank())
				.teamIdx(dto.getTeamIdx())
				.build();
		
		session.setMaxInactiveInterval(60 * 60);
		
		session.setAttribute("member", info);
		
		// 설정폼이 뜨는 환경설정 페이지에 넘어감
		return "/mypage/realSetting";
	}
	
	public String settingForm() {
		
		return "redirect:/mypage/";
	}
	

	public String settingSubmit() {
		
		return "redirect:/mypage/";
	}


}
