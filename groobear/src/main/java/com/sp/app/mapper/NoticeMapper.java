package com.sp.app.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.board.notice.Notice;
import com.sp.app.model.board.Reply;

@Mapper
public interface NoticeMapper {
	
	//공지사항
	public long noticeSeq();
	public void insertNotice(Notice dto) throws SQLException;
	public void updatdeNotice(Notice dto) throws SQLException;
	public void deleteBoard(long noticeIdx) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<Notice> listNotice(Map<String, Object> map);
	public List<Notice> listNoticeTop();
	
	public Notice findById(long noticeIdx);
	public Notice findByPrev(Map<String, Object> map);
	public Notice findByNext(Map<String, Object> map);
	
	//댓글
	public void insertReply(Reply dto) throws SQLException;
	public int replyCount(Map<String, Object> map);
	public List<Reply> listReply(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws SQLException;
	
	//파일
	public void insertFile(Notice dto) throws SQLException;
	public List<Notice> listFile(long noticeIdx);
	public Notice findByFileId(long fileIdx);
	public void deleteFile(Map<String, Object> map) throws SQLException;
}
