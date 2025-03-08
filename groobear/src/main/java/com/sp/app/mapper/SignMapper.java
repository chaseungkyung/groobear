package com.sp.app.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.model.Member;
import com.sp.app.model.approval.ApprovalLine;
import com.sp.app.model.approval.ApprovalRef;
import com.sp.app.model.approval.DocAppFile;
import com.sp.app.model.approval.DocApproval;
import com.sp.app.model.docBox.ApprovalReq;
import com.sp.app.model.docBox.IncidentReport;
import com.sp.app.model.docBox.LeaveRequest;
import com.sp.app.model.docBox.OvertimeRequest;

@Mapper
public interface SignMapper {
	
	public void insertDocApproval(DocApproval dto) throws SQLException;
	public void insertApprovalLine(ApprovalLine dto) throws SQLException;
	public void insertApprovalRef(ApprovalRef dto) throws SQLException;
	public void insertDocAppFile(DocAppFile dto) throws SQLException;
	
	public void insertLeaveRequest(LeaveRequest dto) throws SQLException; // 휴가 신청서
	public void insertOvertimeRequest(OvertimeRequest dto) throws SQLException; // 추가 근무 신청서
	public void insertIncidentReport(IncidentReport dto) throws SQLException; // 시말서
	public void insertApprovalReq(ApprovalReq dto) throws SQLException; // 결재요청서
	
	public List<Member> listMember(Map<String, Object> map); // 결재자 선택 할 당시 사원 list
	
	public List<DocApproval> inProgressList(Map<String, Object> map); // 결재 상신 list
	public List<ApprovalLine> approvalList(Map<String, Object> map); // 결재 라인 list
	
	public ApprovalLine findByEmpIdx(long empIdx);
	
	public DocApproval docApprovalAprIdx(long aprIdx);
	public ApprovalLine approvalLineAprIdx(long aprIdx);
	public ApprovalRef approvalRefAprIdx(long aprIdx);
	public DocAppFile docAppFileAprIdx(long aprIdx);
	
	public LeaveRequest leaveRequestAprIdx(long aprIdx);
	public ApprovalReq approvalReqAprIdx(long aprIdx);
	public IncidentReport incidentReportAprIdx(long aprIdx);
	
	public int dataCount(Map<String, Object> map);
	
	public void updateResult(Map<String, Object> map) throws SQLException; // approvalLine
	public void updatedocApprovalStatus(Map<String, Object> map) throws SQLException; // approval
	
}
