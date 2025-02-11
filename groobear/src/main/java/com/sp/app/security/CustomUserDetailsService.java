package com.sp.app.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.sp.app.model.Member;
import com.sp.app.service.MemberService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService{
	private final MemberService memberService;
	
	@Override
	public UserDetails loadUserByUsername(String empCode) throws UsernameNotFoundException {
		Member member = memberService.findByEmpCode(empCode);
		if(member == null) {
			throw new UsernameNotFoundException("아이디가 존재하지 않습니다.");
		}
		
		List<String> authorities = new ArrayList<>(); 
		authorities.add("EMP");
		if(member.getEmpCode().equals("admin") || member.getPositionCode() == 1 || member.getPositionCode() == 2) authorities.add("ADMIN");
		if(member.getDeptIdx() != null) {
			if(member.getDeptIdx().equals("D")) authorities.add("HRM");		
			if(member.getDeptIdx().equals("B") || member.getDeptIdx().equals("F")) authorities.add("PROJECT");	
		}
		
		return toUserDetails(member, authorities);
	}

    private UserDetails toUserDetails(Member member, List<String> authorities) {
    	String[] roles = authorities.toArray(new String[authorities.size()]);
    	
        return User.builder()
                .username(member.getEmpCode())
                .password(member.getEmpPwd()) // 암호화된 패스워드
                .roles(roles)
                .build();
    }
}
