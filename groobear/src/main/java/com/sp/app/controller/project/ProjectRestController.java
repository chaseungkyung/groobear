package com.sp.app.controller.project;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sp.app.model.core.Member;
import com.sp.app.model.core.OrgUnit;
import com.sp.app.model.project.ProjectMember;
import com.sp.app.service.project.ProjectService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/project/*")
public class ProjectRestController {
	private final ProjectService service;

	// AJAX-JSON
	@GetMapping("getTeam")
	public Map<String, Object> getTeam(
			@RequestParam(name = "deptIdx", defaultValue = "F") String deptIdx) {
		Map<String, Object> map = new HashMap<>();
		Map<String, Object> param = new HashMap<>();
		try {
			param.put("deptIdx", deptIdx);

			List<OrgUnit> teamList = service.getDevTeamList(param);

			map.put("deptIdx", "F");
			map.put("teamList", teamList);
			map.put("state", "true");

		} catch (Exception e) {
			log.info("getTeam : ", e);
			map.put("state", "false");
		}

		return map;
	}

	// AJAX-JSON
	@GetMapping("getEmpName")
	public Map<String, Object> getEmpName(
			@RequestParam(name = "teamIdx") String teamIdx,
			@RequestParam(name = "deptIdx", defaultValue = "F") String deptIdx) {

		Map<String, Object> map = new HashMap<>();
		Map<String, Object> param = new HashMap<>();

		try {
			param.put("teamIdx", teamIdx);
			param.put("deptIdx", deptIdx);

			List<Member> empNameList = service.getEmpNameListFromDevTeam(param);

			map.put("teamIdx", teamIdx);
			map.put("deptIdx", deptIdx);
			map.put("empNameList", empNameList);
			map.put("state", "true");

		} catch (Exception e) {
			log.info("getTeam : ", e);
			map.put("state", "false");
		}

		return map;
	}

	// 프로젝트 참여자
	// 1) 이벤트처리 조건 = < 엔터 or 돋보기 클릭 > -> 서버로 AJAX 요청 보내면 돼.(keyword만 실어서) -> getEmpList
	// 2) 프로젝트 참여자를 검색하고, 그 검색조건에 맞는 참여자를 list로 map에 실어서 map을 리턴 --컨트롤러 끝
	// 3) 주의할 것 : 초대하기 눌러서 DB에 넣을때는 AJAX 아니다. REDIRECT 처리 해야된다.
	// 4) 컨트롤러가 반환한 리스트를 바탕으로 javascript에서 반복문으로 사람들 왼쪽 영역에 추가하기
	// 5) 체크하면 오른쪽 가겠지 (javascript)
	// 6) 사람들 팀 지정하는 selectbox -> 다시 AJAX -> getProjectTeam
	// 7) 초대하기 누르면 -> 그건 그냥 Controller (insertProjectMember) -> redirect:/project/projectDetail

	// AJAX - JSON
	@GetMapping("getEmpList")
	public Map<String, Object> getEmpList(
			@RequestParam(name = "empSearch", defaultValue = "") String empSearch) {
		Map<String, Object> map = new HashMap<>();
		try {
			
			List<Member> empList = service.getEmployList(empSearch);
			map.put("empList", empList);
			
		} catch (Exception e) {
			log.info("getEmpList : ", e);
		}
		return map;
	}

	@GetMapping("getProjectTeams")
	public Map<String, Object> getProjectTeams(@RequestParam long projIdx) {
		Map<String, Object> map = new HashMap<>();
		try {
			// List<ProjectMember> teamList = service.getTeamList(projIdx);
			/*
			 * SELECT projTeamIdx, projTeamName FROM project_team WHERE projIdx= #{projIdx}
			 */
			// map.put("teamList", teamList);
		} catch (Exception e) {
			log.info("getProjectTeams : ", e);
		}
		return map;
	}
	
	// AJAX-JSON
	@GetMapping("insertProjectMember")
	public Map<String, ?> insertProjectMember(ProjectMember dto) throws Exception {
		Map<String, Object> model = new HashMap<>();

		String state = "false";
		try {
			service.insertProjectMember(dto);
			state = "true";
		} catch (Exception e) {
		}

		model.put("state", state);
		return model;
	}
	

}
