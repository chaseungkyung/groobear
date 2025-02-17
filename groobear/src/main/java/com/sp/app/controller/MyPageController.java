package com.sp.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
			
			List<Member> list = service.workList(map);
			
			model.addAttribute("list", list);
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
    public Map<String, Object> charts(@RequestParam("userId") String userId) {
        Map<String, Object> model = new HashMap<>();
        
        try {
            // SQL 쿼리 실행: 로그인 시간과 현재 시간의 차이 계산
            String sql = "SELECT loginTime, ROUND((SYSDATE - TO_DATE(loginTime, 'HH24:MI')), 2) AS workedHours " +
                         "FROM users WHERE user_id = ?";
            
            Map<String, Object> result = jdbcTemplate.queryForMap(sql, userId);
            
            String loginTime = (String) result.get("loginTime");
            Double workedHours = (Double) result.get("workedHours");
            
            // 근무 시간 계산 (분 단위로 변환)
            long workedMinutes = Math.round(workedHours * 60);
            long hours = workedMinutes / 60;
            long minutes = workedMinutes % 60;
            String workedTime = hours + "h " + minutes + "m";
            
            model.put("state", "true");
            model.put("hours", new String[]{"현재"});
            model.put("hoursWorked", new int[]{(int) workedMinutes});  // 근무 시간(분)
            model.put("workedTime", workedTime);  // 계산된 근무 시간 표시
            
        } catch (Exception e) {
            model.put("state", "false");
            e.printStackTrace();  // 예외 출력 (디버깅 용도)
        }
        
        return model;
    }
	
	
}
