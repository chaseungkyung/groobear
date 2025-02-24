package com.sp.app.controller.project;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sp.app.model.core.Member;
import com.sp.app.model.core.OrgUnit;
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
	public HashMap<String, Object> getTeam(
			@RequestParam(name = "deptIdx", defaultValue = "F") String deptIdx) {
		HashMap<String, Object> map = new HashMap<>();
		HashMap<String, Object> param = new HashMap<>();
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
	public HashMap<String, Object> getEmpName(
			@RequestParam(name = "teamIdx") String teamIdx,
			@RequestParam(name = "deptIdx", defaultValue = "F") String deptIdx) {

		HashMap<String, Object> map = new HashMap<>();
		HashMap<String, Object> param = new HashMap<>();

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

}
