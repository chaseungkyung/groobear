package com.sp.app.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.PaginateUtil;
import com.sp.app.model.Member;
import com.sp.app.model.MyPage;
import com.sp.app.model.SessionInfo;
import com.sp.app.service.MyPageService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/mypage/*")
public class MyPageController {
	
	private final MyPageService service;
	private final PaginateUtil paginateUtil;
	
    @Autowired
    private final JdbcTemplate jdbcTemplate;  // JdbcTemplate 사용
    
    
	@GetMapping("mypage")
	public String mypage(Model model, HttpServletRequest req) throws Exception {
		return "mypage/mypage";
	}
	
	@GetMapping("workList")
	public String workList(Model model,  HttpServletRequest req) throws Exception {
		
		try {
			
			Map<String, Object> map = new HashMap<>();
			
			
		} catch (Exception e) {
			log.info("workList : ", e);
		}
		return "mypage/workList"; 
	}
	
	
	
	@GetMapping("timeKeeping")
	public String timeKeeping(Model model) {
		
		try {
			Map<String, Object> map = new HashMap<>();
			List<Member> list = service.timeKeeping(map);
			
			model.addAttribute("list", list);
		} catch (Exception e) {
		}
		
		return "mypage/timeKeeping";
	}
	
	
	@GetMapping("paidOffTime")
	public String paidOffTime (Model model) throws Exception {
		try {
			Map<String, Object> map = new HashMap<>();
			List<Member> list = service.paidOffTime(map);
			
			model.addAttribute("list", list);
		} catch (Exception e) {
			log.info("paidOffTime : ", e);
		}
		
		return "mypage/paidOffTime";
	}
	
	

	
	
    @ResponseBody
    @GetMapping("charts")
    public Map<String, Object> charts(
    		@ModelAttribute MyPage myPage,
    		HttpSession session) {
    	
        Map<String, Object> model = new HashMap<>();
        
        try {
        	SessionInfo info = (SessionInfo)session.getAttribute("member");
        	MyPage loginTime = service.getLoginTime(info.getEmpIdx());
        	
        	if (loginTime == null) {
                model.put("state", "false");    
        	} else {
    			long gap;
    			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    			LocalDateTime today = LocalDateTime.now();

    			LocalDateTime dateTime = LocalDateTime.parse(loginTime.getLoginTime(), formatter);
    			
    			gap = dateTime.until(today, ChronoUnit.HOURS);
    			
        		model.put("state", "true");
        		model.put("loginTime", loginTime.getLoginTime());
        		model.put("gap", gap);
        	}
        	
        } catch (Exception e) {
            model.put("state", "false");
            e.printStackTrace(); 
        }
        return model;
    }
	
}
