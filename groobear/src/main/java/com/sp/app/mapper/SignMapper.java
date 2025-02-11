package com.sp.app.mapper;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

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
	
	public void insertLeaveRequest(LeaveRequest dto) throws SQLException;
	public void insertOvertimeRequest(OvertimeRequest dto) throws SQLException;
	public void insertIncidentReport(IncidentReport dto) throws SQLException;
	public void insertApprovalReq(ApprovalReq dto) throws SQLException;
	
}
