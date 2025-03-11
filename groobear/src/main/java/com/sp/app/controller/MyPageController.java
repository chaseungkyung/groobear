package com.sp.app.controller;

import java.time.LocalDateTime;
import java.time.LocalTime;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
    
	@GetMapping("mypage")
	public String mypage(Model model, HttpServletRequest req) throws Exception {
		return "mypage/workList";
	}
	
	@GetMapping("workList")
	public String workList(Model model,  HttpServletRequest req) throws Exception {
		 
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
	public String paidOffTime (Model model, HttpSession session) throws Exception {
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			long empIdx = info.getEmpIdx();
			Map<String, Object> map = new HashMap<>();
			map.put("empIdx", empIdx);
			List<Member> list = service.paidOffTime(map);
			
			model.addAttribute("list", list);
		} catch (Exception e) {
			log.info("paidOffTime : ", e);
		}
		
		return "mypage/paidOffTime";
	}
	
	
	@GetMapping("modify")
	public String modify(Model model, HttpSession session) throws Exception {
		// 수정할 때. 내 정보가 필요하니까 session 을 인자로 썼어
		
		try {
			// 세션에서 로그인한 사용자 정보를 가져와야하잖아
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			// 세션에서 empIdx 가져와서 map에 저장해야하니까
			Long empIdx = info.getEmpIdx();
			Map<String, Object> map = new HashMap<>();
			map.put("empIdx", empIdx);
			
			// 서비스 이용해서 사원정보를 empInfo에 담고
			Member empInfo = service.getEmpInfo(map);
			List<Member> list = service.getEmpRecord(empIdx);
			
			// 조회한 정보를 뷰에 전달해야지.. 수정할 정보 전달하고 수정 모드 설정하고
			model.addAttribute("empInfo", empInfo);
			model.addAttribute("mode", "modify");
			model.addAttribute("list", list);
			
			return "mypage/me";
			
		} catch (Exception e) {
			log.info("modify GET : ", e);
			return "redirect:/mypage/workList";
		}		
	}
	
	@PostMapping("modify")
	public String modifySubmit(
			@RequestParam(name="empIdx") long empIdx,
			Member dto) throws Exception {
				
		try {	
			
			// 서비스 호출해서 map 보내서 수정하는 거야
			service.updateEmpInfo(dto);
			
		} catch (Exception e) {
			log.info("modifySubmit", e);
			throw e;
			
		}
		return "redirect:/mypage/modify?empIdx=" + empIdx;
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
    			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
    			LocalTime today = LocalTime.now();

    			LocalTime dateTime = LocalTime.parse(loginTime.getLoginTime(), formatter);
    			
    			gap = dateTime.until(today, ChronoUnit.HOURS);
    			
        		model.put("state", "true");
        		model.put("loginTime", loginTime.getLoginTime());
        		model.put("gap", gap);
        		model.put("today", today);
        	}
        	
        } catch (Exception e) {
            model.put("state", "false");
            e.printStackTrace(); 
        }
        return model;
    }
	
}
