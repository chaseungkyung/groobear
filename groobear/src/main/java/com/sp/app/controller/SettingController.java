package com.sp.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mypage/*")
@Slf4j
@RequiredArgsConstructor
public class SettingController {
	
	@GetMapping("mypage")
	public String mypage() {
		return "/mypage/mypage";
	}
	
	@GetMapping("pwd") 
	public String setting() {
		
		return "/mypage/pwd";
	}
}
