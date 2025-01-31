package com.sp.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mail/*")
public class MailHandlerController {

	// 메일 리스트
	@GetMapping("list")
	public String mailAllList() {
		return "/mail/list";
	}
	
	// 받은 메일
	@GetMapping("receive")
	public String receive() {
		return "/mail/receive";
	}
	
	// 보낸 메일
	@GetMapping("mailSend")
	public String mailSend() {
		return "/mail/mailSend";
	}
	
	// 휴지통
	@GetMapping("trash")
	public String trash() {
		return "/mail/trash";
	}
	
	// 즐겨찾기
	@GetMapping("important")
	public String important() {
		return "/mail/important";
	}
	
	// 메일 읽기
	@GetMapping("read")
	public String read() {
		return "/mail/read";
	}
	
	// 메일 쓰기
	@GetMapping("write")
	public String write() {
		return "/mail/write";
	}
	
}
