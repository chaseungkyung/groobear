package com.sp.app.controller;

import java.util.Objects;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sp.app.model.Member;
import com.sp.app.model.SessionInfo;
import com.sp.app.service.SettingService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/mypage/*")
@Slf4j
@RequiredArgsConstructor
public class SettingController {
	private final SettingService service;
	
	@GetMapping("mypage")
	public String mypage() {
		return "mypage/mypage";
	}
	
	@GetMapping("pwd") 
	public String pwdForm(Model model) {
		return "mypage/pwd"; //처음에 어떻게 pwd 페이지를 띄우더라...
	}
	
	@PostMapping("pwd")
	public String pwdSubmit(@RequestParam(name = "empPwd") String empPwd,
			@RequestParam(name = "mode") String mode, final RedirectAttributes reAttr,
			Model model, HttpSession session) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			Member dto = Objects.requireNonNull(service.findByEmpIdx(info.getEmpIdx()));
			
			boolean bPwd = service.isPasswordCheck(info.getEmpIdx(), empPwd);
			
			if(! bPwd) {
				model.addAttribute("mode", mode);
				model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
				
				return "mypage/pwd";
			}
			
			model.addAttribute("dto", dto);
			model.addAttribute("mode", "update");
			
			return "mypage/setting";
			
		} catch (NullPointerException e) {
			session.invalidate();
		} catch (Exception e) {
		}
		
		return "redirect:/";
	}
	
	@GetMapping("update")
	public String settingForm(Model model) {
		model.addAttribute("mode", "update");
		
		return "mypage/setting";
	}
	
	@PostMapping("update")
	public String settingSubmit(Member dto, final RedirectAttributes reAttr, Model model) {
		
		StringBuilder sb = new StringBuilder();
		try {
			service.updateEmployee(dto);
			
			sb.append(dto.getEmpName() + "님의 환경설정이 재설정되었습니다.");
			sb.append("메인 화면으로 이동하시기 바랍니다.<br>");
		} catch (Exception e) {
			sb.append(dto.getEmpName() + "님의 환경설정 재설정이 실패했습니다.");
			sb.append("잠시후 다시 이용해주시길 바랍니다.");
		}
		
		reAttr.addAttribute("title", "환경 설정 변경");
		reAttr.addAttribute("message", sb.toString());
		
		return "redirect:/mypage/complete";
	}
	
	@GetMapping("updatePwd")
	public String updatPwdForm() {
		return "mypage/updatePwd";
	}
	
	@PostMapping("updatePwd")
	public String updatePwdSubmit(@RequestParam(name = "empPwd") String empPwd,
			Model model, HttpSession session) {
	
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			Member dto = new Member();
			dto.setEmpIdx(info.getEmpIdx());
			dto.setEmpPwd(empPwd);
			
			service.updateEmpPwd(dto);
		} catch (RuntimeException e) {
			model.addAttribute("message", "변경할 패스워드가 기존과 일치합니다.");
			return "mypage/updatePwd";
		} catch (Exception e) {
		}
		
		return "redirect:/";
	}
	
	@GetMapping("complete")
	public String complete(@ModelAttribute("massage") String message) throws Exception {
		
		if(message == null || message.isBlank()) {
			return "redirect:/";
		}
		return "mypage/complete";
	}
}
