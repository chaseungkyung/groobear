package com.sp.app.project.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sp.app.project.mapper.ProjectMemberMapper;
import com.sp.app.project.model.ProjectMember;
import com.sp.app.project.model.ProjectTeam;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProjectMemberServiceImpl implements ProjectMemberService {
	private final ProjectMemberMapper projectMemberMapper;

	@Override
	public boolean isProjectMemberExists(long projIdx, long empIdx) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("projIdx", projIdx);
		paramMap.put("empIdx", empIdx);

		return projectMemberMapper.countByProjIdxAndEmpIdx(paramMap) > 0;
	}

	@Override
	public void insertProjectMember(ProjectMember dto) throws Exception {
		try {
			if (!isProjectMemberExists(dto.getProjIdx(), dto.getEmpIdx())) {
				projectMemberMapper.insertProjectMember(dto);
			}

		} catch (Exception e) {
			log.info("insertProjectMember : ", e);
			throw e;
		}
	}

	@Override
	public void updateProjectMember(ProjectMember dto) throws Exception {
		try {
			projectMemberMapper.updateProjectMember(dto);

		} catch (Exception e) {
			log.info("updateProjectMember : ", e);
			throw e;
		}
	}

	@Override
	public void deleteProjectMember(long projMemberIdx) throws Exception {
		try {

			projectMemberMapper.deleteProjectMember(projMemberIdx);

		} catch (Exception e) {
			log.info("deleteProjectMember : ", e);
		}

	}

	@Override
	public List<ProjectMember> getProjectMemberList(Map<String, Object> map) {
		List<ProjectMember> list = null;

		try {
			list = projectMemberMapper.getProjectMemberList(map);

		} catch (Exception e) {
			log.info("getProjectMemberList : ", e);
		}

		return list;
	}

	@Override
	public int getProjectMemberCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = projectMemberMapper.getProjectMemberCount(map);

		} catch (Exception e) {
			log.info("getProjectMemberCount : ", e);
		}

		return result;
	}

	@Override
	public ProjectMember getProjectMemberById(long projMemberIdx) {
		ProjectMember dto = null;

		try {
			dto = projectMemberMapper.getProjectMemberById(projMemberIdx);

		} catch (Exception e) {
			log.info("getProjectMemberById : ", e);
		}

		return dto;
	}

	// 프로젝트 멤버 참여자 목록

	@Override
	public List<ProjectMember> getProjectPmList(long projIdx) {
		List<ProjectMember> list = null;

		try {

			list = projectMemberMapper.getProjectPmList(projIdx);

		} catch (Exception e) {
			log.info("getProjectPmList : ", e);
		}

		return list;
	}

	@Override
	public List<ProjectMember> getNonPMProjectMemberList(long projIdx) {
		List<ProjectMember> list = null;

		try {
			list = projectMemberMapper.getNonPMProjectMemberList(projIdx);

		} catch (Exception e) {
			log.info("getNonPMProjectMemberList : ", e);
		}

		return list;
	}

	@Override
	public void insertProjectTeam(ProjectTeam dto) throws Exception {
		try {
			projectMemberMapper.insertProjectTeam(dto);

		} catch (Exception e) {
			log.info("insertProjectTeam : ", e);
		}

	}

	@Override
	public void updateProjectTeam(ProjectTeam dto) throws Exception {
		try {
			projectMemberMapper.updateProjectTeam(dto);

		} catch (Exception e) {
			log.info("updateProjectTeam : ", e);
		}

	}

	@Override
	public void deleteProjectTeam(long projTeamIdx) throws Exception {
		try {
			projectMemberMapper.deleteProjectTeam(projTeamIdx);
		} catch (Exception e) {
			log.info("deleteProjectTeam : ", e);
		}

	}

	@Override
	public List<ProjectTeam> getProjectTeamList(long projIdx) {
		List<ProjectTeam> list = null;

		try {
			list = projectMemberMapper.getProjectTeamList(projIdx);

		} catch (Exception e) {
			log.info("getProjectTeamList : ", e);
		}
		return list;
	}

	@Transactional
	@Override
	public void updateProjectTeamsAndMembers(List<ProjectMember> updatedProjMembers,
			List<ProjectTeam> updatedProjectTeams) throws Exception {
		try {
			// 팀 업데이트 및 생성
			for (ProjectTeam team : updatedProjectTeams) {
				if (Objects.isNull(team.getProjTeamName()))
					team.setProjTeamName("");
				if (team.getProjTeamIdx() > 0) { // 기존에 존재하던 팀이므로 팀 업데이트
					projectMemberMapper.updateProjectTeam(team);
				} else { // 새로운 팀 생성
					long tempProjTeamIdx = team.getProjTeamIdx();
					projectMemberMapper.insertProjectTeam(team);
					long newProjTeamIdx = team.getProjTeamIdx();

					// 생성한 팀에 해당하는 멤버들을 업데이트
					Iterator<ProjectMember> iterator = updatedProjMembers.iterator();
					while (iterator.hasNext()) {
						ProjectMember member = iterator.next();
						if (Objects.equals(member.getProjTeamIdx(), tempProjTeamIdx)) {
							member.setProjTeamIdx(newProjTeamIdx);
							projectMemberMapper.updateProjectMember(member);
							iterator.remove();
						}
					}
				}
			}

			// 나머지 멤버 업데이트
			for (ProjectMember member : updatedProjMembers) {
				projectMemberMapper.updateProjectMember(member);
			}

		} catch (Exception e) {
			log.info("updateProjectTeamsAndMembers : ", e);
			throw e;
		}
	}

}
