package com.sp.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sign/*")
public class SignController {

	@GetMapping("list")
	public String singAllList() {
		return "/sign/list";
	}
	
	@GetMapping("write")
	public String singWrite() {
		return "/sign/write";
	}
	
}
