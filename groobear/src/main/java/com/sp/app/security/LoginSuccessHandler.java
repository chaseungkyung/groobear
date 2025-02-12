package com.sp.app.security;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.sp.app.model.Member;
import com.sp.app.model.SessionInfo;
import com.sp.app.service.MemberService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {
	private RequestCache requestCache = new HttpSessionRequestCache();
	private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();
	private String defaultUrl;

	@Autowired
	private MemberService memberService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws ServletException, IOException {
		
		HttpSession session = request.getSession();

		// System.out.print(authentication.getName()); // 로그인 아이디

		try {
			// 로그인 날짜 변경
			// memberService.updateLastLogin(authentication.getName());
		} catch (Exception e) {
		}

		// 로그인 정보 저장
		Member member = memberService.findByEmpCode(authentication.getName());

		SessionInfo info = SessionInfo.builder()
				.empIdx(member.getEmpIdx())
				.empCode(member.getEmpCode())
				.empName(member.getEmpName())
				.deptIdx(member.getDeptIdx())
				.deptName(member.getDeptName())
				.teamIdx(member.getTeamIdx())
				.teamName(member.getTeamName())
				.positionCode(member.getPositionCode())
				.positionName(member.getPositionName())
				.teamIdx(member.getTeamIdx())
				.build();
		
		session.setAttribute("member", info);
		
		  // 패스워드 변경이 90일이 자난 경우 패스워드 변경 폼으로 이동 try { DateTimeFormatter formatter =
//		  DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"); LocalDateTime
//		  currentDateTime = LocalDateTime.now(); LocalDateTime targetDateTime =
//		  LocalDateTime.parse(member.getModify_date(), formatter); long daysBetween =
//		  ChronoUnit.DAYS.between(targetDateTime, currentDateTime); if (daysBetween >=
//		  90) { String targetUrl = "/member/updatePwd";
//		  redirectStratgy.sendRedirect(request, response, targetUrl); return; } } catch
//		  (Exception e) { }

		// redirect 설정
		resultRedirectStrategy(request, response, authentication);
	}

	protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		SavedRequest savedRequest = requestCache.getRequest(request, response);

		if (savedRequest != null) {
			// 권한이 필요한 페이지에 접근했을 경우
			String targetUrl = savedRequest.getRedirectUrl();
			redirectStratgy.sendRedirect(request, response, targetUrl);
		} else {
			// 직접 로그인 url로 이동했을 경우
			redirectStratgy.sendRedirect(request, response, defaultUrl);
		}
	}

	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}
}
