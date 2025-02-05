package com.sp.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/*")
public class SettingController {

	@GetMapping("mypage")
	public String mypage() {
		return "/mypage/mypage";
	}
	
	@GetMapping("setting")
	public String setting() {
		return "/mypage/setting";
	} 
}
