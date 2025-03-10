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
	
	@GetMapping("pageSetting")
	public String mypage() {
		return "mypage/pageSetting";
	}
	
	@GetMapping("setting")
	public String setting() {
		return "mypage/setting";
	}
	
	@GetMapping("mypage/pwd") 
	public String pwdForm(
			@RequestParam(name = "mode") String mode,
			Model model) {
		
		model.addAttribute("mode", mode);
		
		return "mypage/pwd"; 
	}
	
	@PostMapping("mypage/pwd")
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
			
			if("update".equals(mode)) {
				model.addAttribute("dto", dto);
				model.addAttribute("mode", mode);
				return "mypage/empSetting";
			} 
			
			if("pwd".equals(mode)) {
				model.addAttribute("dto", dto);
				model.addAttribute("mode", mode);
				return "mypage/pwdSetting";
			}
			
		} catch (NullPointerException e) {
			session.invalidate();
		} catch (Exception e) {
		}
		
		return "redirect:/mypage/main";
	}
	
	@PostMapping("mypage/empSetting")
	public String settingSubmit(Member dto, final RedirectAttributes reAttr, Model model, HttpSession session) {
		
		StringBuilder sb = new StringBuilder();
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			
			dto.setEmpIdx(info.getEmpIdx());
			
			service.updateEmployee(dto);
			
			sb.append(dto.getEmpName() + "님의 환경설정이 변경 되었습니다.<br>");
			sb.append("메인 화면으로 이동하시기 바랍니다.<br>");
		} catch (Exception e) {
			sb.append(dto.getEmpName() + "님의 환경설정 변경이 실패했습니다.<br>");
			sb.append("잠시후 다시 이용해주시길 바랍니다.<br>");
		}
		
		reAttr.addFlashAttribute("title", "환경설정 변경 완료");
		reAttr.addFlashAttribute("message", sb.toString());
		
		return "redirect:/mypage/complete";
	}

	
	@PostMapping("mypage/pwdSetting")
	public String updatePwdSubmit(@RequestParam(name = "empPwd") String empPwd,
			Model model, HttpSession session) throws Exception {
	
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			Member dto = new Member();
			dto.setEmpIdx(info.getEmpIdx());
			dto.setEmpPwd(empPwd);
			
			service.updateEmpPwd(dto);
		} catch (RuntimeException e) {
			model.addAttribute("message", "변경할 패스워드가 기존과 일치합니다.");
			return "mypage/pwdSetting";
		} catch (Exception e) {
		}
		
		return "redirect:/main";
	}
	
	@GetMapping("mypage/alarmSetting")
	public String updateAlarmForm() {
		return "mypage/alarmSetting";
	}
	
	@PostMapping("mypage/alarmSetting")
	public String updateAlarmSubmit() {
		return "redirect:/mypage/complete";
	}
	
	
	@GetMapping("mypage/complete")
	public String complete(@ModelAttribute("message") String message) throws Exception {
		
		if(message == null || message.isBlank()) {
			return "redirect:/";
		}
		return "mypage/complete";
	}
}
