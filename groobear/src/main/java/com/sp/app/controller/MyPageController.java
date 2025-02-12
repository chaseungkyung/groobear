package com.sp.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.common.PaginateUtil;
import com.sp.app.model.Member;
import com.sp.app.service.MyPageService;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/mypage/*")
public class MyPageController {
	
	private final MyPageService service;
	private final PaginateUtil paginateUtil;

	@GetMapping("workList")
	public String workList(Model model,  HttpServletRequest req) throws Exception {
		
		try {
			
			Map<String, Object> map = new HashMap<>();
			
			List<Member> list = service.workList(map);
			
			
		} catch (Exception e) {
			log.info("workList : ", e);
		}
		return "/mypage/workList"; 
	}
	
	
	@GetMapping("paidTimeOff")
	public String paidTimeOff(Model model) throws Exception {
		
		try {
			
			Map<String, Object> map = new HashMap<>();
			
			List<Member> list = service.paidTimeOff(map);
			
		} catch (Exception e) {
		}
		
		return "/mypage/paidTimeOff";
	}
	
	
	@GetMapping("timeKeeping")
	public String TimeKeeping(Model model) {
		
		try {
			
			Map<String, Object> map = new HashMap<>();
			
			List<Member> list = service.TimeKeeping(map);
			
		} catch (Exception e) {
		}
		
		return "/mypage/timeKeeping";
	}
}
