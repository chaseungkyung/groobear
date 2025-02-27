package com.sp.app.controller.project;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sp.app.model.core.Member;
import com.sp.app.model.core.OrgUnit;
import com.sp.app.model.project.ProjectMember;
import com.sp.app.model.project.ProjectTeam;
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
	@GetMapping("fetchEmpList")
	public Map<String, Object> getEmpList(
			@RequestParam(name = "searchKwd", defaultValue = "") String searchKwd,
			@RequestParam(name = "projIdx") long projIdx) {
		Map<String, Object> map = new HashMap<>();
		Map<String, Object> condition = new HashMap<>();
		try {
			condition.put("searchKwd", searchKwd);
			condition.put("projIdx", projIdx);

			List<Member> empList = service.getEmployList(condition);
			map.put("empList", empList);

		} catch (Exception e) {
			log.info("getEmpList : ", e);
		}
		return map;
	}

	@GetMapping("fetchProjectTeams")
	public Map<String, Object> getProjectTeams(
			@RequestParam(name = "projIdx") long projIdx) {
		Map<String, Object> result = new HashMap<>();
		try {
			List<ProjectTeam> projTeamList = service.getProjectTeamList(projIdx);
			result.put("projTeamList", projTeamList);
		} catch (Exception e) {
			log.info("getProjectTeams : ", e);
		}
		return result;
	}

	@GetMapping("fetchProjectMemberList")
	public Map<String, Object> getProjectMmeberList(
			@RequestParam(name = "projIdx") long projIdx) {
		Map<String, Object> result = new HashMap<>();
		Map<String, Object> condition = new HashMap<>();

		try {
			condition.put("projIdx", projIdx);

			List<ProjectMember> list = service.getProjectMemberList(condition);
			result.put("projMemberlist", list);
		} catch (Exception e) {
			log.info("getProjectMmeberList : ", e);
		}
		return result;
	}

	@PostMapping("sendProjectMemberList")
	public Map<String, Object> insertProjectMember(
			@RequestBody List<ProjectMember> selectedUser,
			@RequestParam(name = "projIdx") long projIdx) {
		Map<String, Object> result = new HashMap<>();
		try {
			for (ProjectMember dto : selectedUser) {
				dto.setProjIdx(projIdx);
				service.insertProjectMember(dto);
			}
			result.put("state", "true");
		} catch (Exception e) {
			log.info("insertProjectMember : ", e);
			result.put("state", "false");
		}

		return result;
	}

}
