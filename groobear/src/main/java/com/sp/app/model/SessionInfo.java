package com.sp.app.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

// 세션에 저장할 정보(아이디, 이름, 역할(권한) 등)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SessionInfo {
	private long empIdx;
	private String empCode; // 사번
	private String empName; // 이름
	private String deptIdx; // 부서 코드
	private String deptNamd; // 부서명
	private String teamIdx; // 팀 코드
	private String teamName; // 팀명
	private long positionCode; // 직급 코드
	private String positionName; // 직급명
}
