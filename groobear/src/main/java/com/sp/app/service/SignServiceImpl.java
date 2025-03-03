package com.sp.app.service;

import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.stereotype.Service;

import com.sp.app.mapper.SignMapper;
import com.sp.app.model.Member;
import com.sp.app.model.approval.ApprovalLine;
import com.sp.app.model.approval.ApprovalRef;
import com.sp.app.model.approval.DocAppFile;
import com.sp.app.model.approval.DocApproval;
import com.sp.app.model.docBox.ApprovalReq;
import com.sp.app.model.docBox.IncidentReport;
import com.sp.app.model.docBox.LeaveRequest;
import com.sp.app.model.docBox.OvertimeRequest;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class SignServiceImpl implements SignService {
	
	private final SignMapper mapper;

	@Override
	public void insertDocApproval(DocApproval dto) throws Exception {
		
		try {
			
			mapper.insertDocApproval(dto);
			
		} catch (Exception e) {
			log.info("insertDocApproval : ", e);
		}
		
	}

	@Override
	public void insertApprovalLine(ApprovalLine dto) throws Exception {
		
		try {
			
			mapper.insertApprovalLine(dto);
			
		} catch (Exception e) {
			log.info("insertApprovalLine : ", e);
		}
		
	}

	@Override
	public void insertApprovalRef(ApprovalRef dto) throws Exception {
		
		try {
			
			mapper.insertApprovalRef(dto);
			
		} catch (Exception e) {
			log.info("insertApprovalRef : ", e);
		}
		
	}

	@Override
	public void insertDocAppFile(DocAppFile dto) throws Exception {
		
		try {
			
			mapper.insertDocAppFile(dto);
			
		} catch (Exception e) {
			log.info("insertDocAppFile", e);
		}
		
	}

	@Override
	public void insertLeaveRequest(LeaveRequest dto) throws Exception {
		
		try {
			
			mapper.insertLeaveRequest(dto);
			
		} catch (Exception e) {
			log.info("insertLeaveRequest", e);
		}
		
	}

	@Override
	public void insertOvertimeRequest(OvertimeRequest dto) throws Exception {
		
		try {
			
			mapper.insertOvertimeRequest(dto);
			
		} catch (Exception e) {
			log.info("insertOvertimeRequest", e);
		}
		
	}

	@Override
	public void insertIncidentReport(IncidentReport dto) throws Exception {
		
		try {
			
			mapper.insertIncidentReport(dto);
			
		} catch (Exception e) {
			log.info("insertIncidentReport", e);
		}
		
	}

	@Override
	public void insertApprovalReq(ApprovalReq dto) throws Exception {
		
		try {
			
			mapper.insertApprovalReq(dto);
			
		} catch (Exception e) {
			log.info("insertApprovalReq", e);
		}
		
	}

	@Override
	public List<Member> listMember(Map<String, Object> map) {
		
		List<Member> list = null;
		
		try {
			
			list = mapper.listMember(map);
			
		} catch (Exception e) {
			log.info("listMember : ", e);
		}
		
		return list;
	}

	@Override
	public List<DocApproval> inProgressList(Map<String, Object> map) {
		
		List<DocApproval> list = null;
		
		try {
			
			list = mapper.inProgressList(map);
			
		} catch (Exception e) {
			log.info("signList : ", e);
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		
		int result = 0;
		
		try {
			
			result = mapper.dataCount(map);
			
		} catch (Exception e) {
			log.info("dataCount : ", e);
		}
		
		return result;
	}

	@Override
	public DocApproval docApprovalAprIdx(long aprIdx) {
		
		DocApproval docApproval = null;
		
		try {
			
			docApproval = mapper.docApprovalAprIdx(aprIdx);
			
		} catch (Exception e) {
			log.info("docApprovalAprIdx : ", e);
		}
		
		return docApproval;
	}

	@Override
	public ApprovalLine approvalLineAprIdx(long aprIdx) {
		
		ApprovalLine approvalLine = null;
		
		try {
			
			approvalLine = Objects.requireNonNull(mapper.approvalLineAprIdx(aprIdx));
			
			if(approvalLine.getWriterEmp() != null) {
				Member writer = Objects.requireNonNull(mapper.findByEmpIdx(approvalLine.getWriterEmp()));
				approvalLine.setWriterName(writer.getEmpName());
				approvalLine.setWriterDeptName(writer.getDeptName());
				approvalLine.setWriterTeamName(writer.getTeamName());
				approvalLine.setWriterPositionName(writer.getPositionName());
			}
			
			if(approvalLine.getApr1Emp() != null) {
				Member apr1 = Objects.requireNonNull(mapper.findByEmpIdx(approvalLine.getApr1Emp()));
				approvalLine.setApr1Name(apr1.getEmpName());
				approvalLine.setApr1DeptName(apr1.getDeptName());
				approvalLine.setApr1TeamName(apr1.getTeamName());
				approvalLine.setApr1PositionName(apr1.getPositionName());
			}
			
			if(approvalLine.getApr2Emp() != null) {
				Member apr2 = Objects.requireNonNull(mapper.findByEmpIdx(approvalLine.getApr2Emp()));
				approvalLine.setApr2Name(apr2.getEmpName());
				approvalLine.setApr2DeptName(apr2.getDeptName());
				approvalLine.setApr2TeamName(apr2.getTeamName());
				approvalLine.setApr2PositionName(apr2.getPositionName());
			}
			
			if(approvalLine.getApr3Emp() != null) {
				Member apr3 = Objects.requireNonNull(mapper.findByEmpIdx(approvalLine.getApr3Emp()));
				approvalLine.setApr3Name(apr3.getEmpName());
				approvalLine.setApr3DeptName(apr3.getDeptName());
				approvalLine.setApr3TeamName(apr3.getTeamName());
				approvalLine.setApr3PositionName(apr3.getPositionName());
			}
			
		} catch (NullPointerException e) {
		} catch (Exception e) {
			log.info("approvalLine : ", e);
		}
		
		return approvalLine;
	}

	@Override
	public ApprovalRef approvalRefAprIdx(long aprIdx) {
		
		ApprovalRef approvalRef = null;
		
		try {
			
			approvalRef = mapper.approvalRefAprIdx(aprIdx);
			
		} catch (Exception e) {
			log.info("approvalRef : ", e);
		}
		
		return approvalRef;
	}

	@Override
	public DocAppFile docAppFileAprIdx(long aprIdx) {
		
		DocAppFile docAppFile = null;
		
		try {
			
			docAppFile = mapper.docAppFileAprIdx(aprIdx);
			
		} catch (Exception e) {
			log.info("docAppFile : ", e);
		}
		
		return docAppFile;
	}

	@Override
	public LeaveRequest leaveRequestAprIdx(long aprIdx) {
		
		LeaveRequest leaveRequest = null;
		
		try {
			
			leaveRequest = mapper.leaveRequestAprIdx(aprIdx);
			
		} catch (Exception e) {
			log.info("leaveRequest : ", e);
		}
		
		return leaveRequest;
	}

	@Override
	public List<ApprovalLine> approvalList(Map<String, Object> map) {
		
		List<ApprovalLine> list = null;
		
		try {
			
			list = mapper.approvalList(map);
			
		} catch (Exception e) {
			log.info("approvalList : ", e);
		}
		
		return list;
	}

	@Override
	public void updateResult(Map<String, Object> map) throws Exception {
		
		try {
			
			mapper.updateResult(map);
			
		} catch (Exception e) {
			log.info("updateReulst : ", e);
		}
		
	}

	@Override
	public void updatedocApprovalStatus(Map<String, Object> map) throws Exception {
		
		try {
			
			mapper.updatedocApprovalStatus(map);
			
		} catch (Exception e) {
			log.info("updatedocApprovalStatus : ", e);
		}
		
		
	}

}
