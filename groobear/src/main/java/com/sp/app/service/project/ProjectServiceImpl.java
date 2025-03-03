package com.sp.app.service.project;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.app.common.StorageService;
import com.sp.app.exception.StorageException;
import com.sp.app.mapper.ProjectMapper;
import com.sp.app.model.board.Board;
import com.sp.app.model.core.Member;
import com.sp.app.model.core.OrgUnit;
import com.sp.app.model.project.Project;
import com.sp.app.model.project.ProjectMember;
import com.sp.app.model.project.ProjectPost;
import com.sp.app.model.project.ProjectStage;
import com.sp.app.model.project.ProjectTask;
import com.sp.app.model.project.ProjectTeam;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProjectServiceImpl implements ProjectService {
	private final ProjectMapper mapper;

	@Override
	public List<OrgUnit> getDevTeamList(Map<String, Object> map) throws Exception {
		List<OrgUnit> list = null;

		try {
			list = mapper.getDevTeamList(map);

		} catch (Exception e) {
			log.info("getDevTeamList : ", e);
		}
		return list;
	}

	@Override
	public List<Member> getEmpNameListFromDevTeam(Map<String, Object> map) throws Exception {
		List<Member> list = null;

		try {
			list = mapper.getEmpNameListFromDevTeam(map);

		} catch (Exception e) {
			log.info("getEmpNameListFromDevTeam : ", e);
		}
		return list;
	}
	
	
	@Override
	public List<Member> getEmployList(Map<String, Object> map) {
		List<Member> list = null;

		try {
			list = mapper.getEmployList(map);

		} catch (Exception e) {
			log.info("getEmployList : ", e);
		}

		return list;
	}
	
	
	// 프로젝트
	
	@Override
	public void insertProject(Project dto) throws Exception {
		try {

			mapper.insertProject(dto);

		} catch (Exception e) {
			log.info("insertProject 에러 : ", e);
			throw e;
		}
	}

	@Override
	public void updateProject(Project dto) throws Exception {
		try {
			mapper.updateProject(dto);

		} catch (Exception e) {
			log.info("updateProject : ", e);
		}
	}

	@Override
	public void deleteProject(long projIdx) throws Exception {
		try {
			mapper.deleteProject(projIdx);
		} catch (Exception e) {
			log.info("deleteProject : ", e);
		}

	}

	@Override
	public List<Project> getProjectList(Map<String, Object> map) throws Exception {
		List<Project> listProject = null;

		try {
			listProject = mapper.getProjectList(map);

		} catch (Exception e) {
			log.info("getProjectList : ", e);
		}

		return listProject;
	}
	
	
	@Override
	public int getProjectCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = mapper.getProjectCount(map);
		} catch (Exception e) {
			log.info("dataCount : ", e);
		}

		return result;
	}
	
	
	@Override
	public Project getProjectById(long projIdx) throws Exception {
		Project dto = null;

		try {
			dto = mapper.getProjectById(projIdx);

		} catch (Exception e) {
			log.info("getProjectById : ", e);
		}

		return dto;
	}

	
	// 프로젝트 팀

	@Override
	public void insertProjectTeam(ProjectTeam dto) throws Exception {
		try {
			mapper.insertProjectTeam(dto);
			
		} catch (Exception e) {
			log.info("insertProjectTeam : ", e);
		}
		
	}

	@Override
	public void updateProjectTeam(ProjectTeam dto) throws Exception {
		try {
			mapper.updateProjectTeam(dto);
			
		} catch (Exception e) {
			log.info("updateProjectTeam : ", e);
		}
		
	}

	@Override
	public void deleteProjectTeam(long projTeamIdx) throws Exception {
		try {
			mapper.deleteProjectTeam(projTeamIdx);
		} catch (Exception e) {
			log.info("deleteProjectTeam : ", e);
		}
		
	}
	
	
	@Override
	public List<ProjectTeam> getProjectTeamList(long projIdx) {
		List<ProjectTeam> list = null;

		try {
			list = mapper.getProjectTeamList(projIdx);

		} catch (Exception e) {
			log.info("getProjectTeamList : ", e);
		}
		return list;
	}	
	
	
	
	// 프로젝트 멤버 참여자 목록
	
	@Override
	public List<ProjectMember> getProjectPmList(long projIdx) {
		List<ProjectMember> list = null;
		
		try {
			
			list = mapper.getProjectPmList(projIdx);
			
		} catch (Exception e) {
			log.info("getProjectPmList : ", e);
		}
		
		return list;
	}

	@Override
	public List<ProjectMember> getNonPMProjectMemberList(long projIdx) {
		List<ProjectMember> list = null;
		
		try {
			list = mapper.getNonPMProjectMemberList(projIdx);
			
		} catch (Exception e) {
			log.info("getNonPMProjectMemberList : ", e);
		}
		
		return list;
	}
	
	

	// 프로젝트 멤버

	@Override
	public void insertProjectMember(ProjectMember dto) throws Exception {
		try {
			mapper.insertProjectMember(dto);

		} catch (Exception e) {
			log.info("insertProjectMember : ", e);
			throw e;
		}
	}

	@Override
	public void updateProjectMember(ProjectMember dto) throws Exception {
		try {
			mapper.updateProjectMember(dto);

		} catch (Exception e) {
			log.info("updateProjectMember : ", e);
			throw e;
		}

	}

	@Override
	public void deleteProjectMember(long projMemberIdx) throws Exception {
		try {

			mapper.deleteProjectMember(projMemberIdx);

		} catch (Exception e) {
			log.info("deleteProjectMember : ", e);
		}

	}

	@Override
	public List<ProjectMember> getProjectMemberList(Map<String, Object> map) {
		List<ProjectMember> list = null;

		try {
			list = mapper.getProjectMemberList(map);

		} catch (Exception e) {
			log.info("getProjectMemberList : ", e);
		}

		return list;
	}

	@Override
	public int getProjectMemberCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = mapper.getProjectMemberCount(map);

		} catch (Exception e) {
			log.info("getProjectMemberCount : ", e);
		}

		return result;
	}
	
	@Override
	public ProjectMember getProjectMemberById(long projMemberIdx) {
		ProjectMember dto = null;
		
		try {
			dto = mapper.getProjectMemberById(projMemberIdx);
			
		} catch (Exception e) {
			log.info("getProjectMemberById : ", e);
		}
		
		return dto;
	}
	
	
	// 프로젝트 stage
	
	@Override
	public void insertProjectStage(ProjectStage dto) throws Exception {
		try {
			mapper.insertProjectStage(dto);
		} catch (Exception e) {
			log.info("insertProjectStage : ", e);
		}
		
	}

	@Override
	public void updateProjectStage(ProjectStage dto) throws Exception {
		try {
			mapper.updateProjectStage(dto);
		} catch (Exception e) {
			log.info("updateProjectStage : ", e);
		}
		
	}
	
	
	@Override
	public void deleteProjectStage(long stageIdx) throws Exception {
		try {
			mapper.deleteProjectStage(stageIdx);
		} catch (Exception e) {
			log.info("deleteProjectStage : ", e);
		}
		
	}

	@Override
	public List<ProjectStage> getProjectStageList(Map<String, Object> map) {
		List<ProjectStage> list = null;
		
		try {
			list = mapper.getProjectStageList(map);
			
		} catch (Exception e) {
			log.info("getProjectStageList : ", e);
		}
		
		return list;
	}

	@Override
	public int getProjectStageCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.getProjectStageCount(map);
			
		} catch (Exception e) {
			log.info("getProjectStageCount : ", e);
		}
		
		return result;
	}
	
	
	@Override
	public ProjectStage getProjectStageById(long stageIdx) {
		ProjectStage dto = null;
		
		try {
			
			dto = mapper.getProjectStageById(stageIdx);
			
		} catch (Exception e) {
			log.info("getProjectStageById : ", e);
		}
		
		return dto;
	}
	
	
	// 프로젝트 taske
	
	@Override
	public void insertProjectTask(ProjectTask dto) throws Exception {
		try {
			mapper.insertProjectTask(dto);
			
		} catch (Exception e) {
			log.info("insertProjectTask : ", e);
		}
		
	}

	@Override
	public void updateProjectTask(ProjectTask dto) throws Exception {
		try {
			mapper.updateProjectTask(dto);
			
		} catch (Exception e) {
			log.info("updateProjectTask : ", e);
		}
		
	}

	@Override
	public void deleteProjectTask(long taskIdx) throws Exception {
		try {
			mapper.deleteProjectTask(taskIdx);
			
		} catch (Exception e) {
			log.info("deleteProjectTask : ", e);
		}
		
	}

	@Override
	public List<ProjectTask> getProjectTaskList(Map<String, Object> map) {
		List<ProjectTask> list = null;
		
		try {
			list = mapper.getProjectTaskList(map);
			
		} catch (Exception e) {
			log.info("getProjectTaskList : ", e);
		}
		
		return list;
	}

	@Override
	public int getProjectTaskCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.getProjectTaskCount(map);
			
		} catch (Exception e) {
			log.info("getProjectTaskCount : ", e);
		}
		
		return result;
	}
	
	
	// 프로젝트 진행률 계산
	@Override
	public int getProgressRate(long projIdx, long stageIdx) {
		int progressRate = 0;
		
		try {
			
			Map<String, Object> totalMap = new HashMap<>();
			totalMap.put("projIdx", projIdx);
			totalMap.put("stageIdx", stageIdx);			
			int totalCount = getProjectTaskCount(totalMap);
						
			Map<String, Object> completedMap = new HashMap<>();
			completedMap.put("projIdx", projIdx);
			completedMap.put("stageIdx", stageIdx);
			completedMap.put("status", 3);
			int completedCount = getProjectTaskCount(completedMap);
			
			if(totalCount > 0) {
				progressRate = (int) Math.round(((double) completedCount / totalCount) * 100);
			}
			
			
		} catch (Exception e) {
			log.info("getProgressRate : ", e);
		}
		
		return progressRate;
	}
	

	@Override
	public ProjectTask getProjectTaskById(long taskIdx) {
		ProjectTask dto = null;
		
		try {
			dto = mapper.getProjectTaskById(taskIdx);
			
		} catch (Exception e) {
			log.info("getProjectTaskById : ", e);
		}
		
		return dto;
	}

	
	// 프로젝트 Post
	
	@Override
	public void insertProjectPost(ProjectPost dto, String uploadPath) throws Exception {
		try {
			mapper.insertProjectPost(dto);
			
			/*
			if(! dto.getSelectFile().isEmpty()) {
				insertFile(dto, uploadPath);
			}
			*/
			
		} catch (Exception e) {
			log.info("insertProjectPost : ", e);
			
			throw e;
		}	
	}
	
	
	@Override
	public long getProjectMemberIdx(Map<String, Object> map) {
		long projMemberIdx = 0;
		
		try {
			projMemberIdx = mapper.getProjectMemberIdx(map);
			
		} catch (Exception e) {
			log.info("getProjectMemberIdx : ", e);
		}
		
		return projMemberIdx;
	}
	

	@Override
	public void updateProjectPost(ProjectPost dto) throws Exception {
		try {
			mapper.updateProjectPost(dto);
			
		} catch (Exception e) {
			log.info("updateProjectPost : ", e);
			
			throw e;
		}	
	}

	@Override
	public void deleteProjectPost(ProjectPost dto) throws Exception {
		try {
			mapper.deleteProjectPost(dto);
			
		} catch (Exception e) {
			log.info("deleteProjectPost : ", e);
		}
		
	}

	@Override
	public List<ProjectPost> getProjectPostList(Map<String, Object> map) {
		List<ProjectPost> list = null;
		
		try {
			list = mapper.getProjectPostList(map);
			
		} catch (Exception e) {
			log.info("getProjectPostList : ", e);
		}
		
		return list;
	}

	@Override
	public int getProjectPostCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.getProjectPostCount(map);
			
		} catch (Exception e) {
			log.info("getProjectPostCount : ", e);
		}
		
		return result;
	}

	@Override
	public ProjectPost getProjectPostById(long postIdx) {
		ProjectPost dto = null;
		
		try {
			dto = mapper.getProjectPostById(postIdx);
			
		} catch (Exception e) {
			log.info("getProjectPostById : ", e);
		}
		
		return dto;
	}











}
