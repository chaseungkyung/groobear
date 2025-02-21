package com.sp.app.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.model.board.Board;
import com.sp.app.model.board.Reply;

@Mapper
public interface BoardMapper {
	
	//게시판
	public long boardSeq();
	public void insertBoard(Board dto) throws SQLException;
	public void updateBoard(Board dto) throws SQLException;
	public void deleteBoard(long postIdx) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<Board> listBoard(Map<String, Object> map);
	
	public Board findById(long postIdx);
	public Board findByPrev(Map<String, Object> map);
	public Board findByNext(Map<String, Object> map);
	
	//댓글
	public void insertReply(Reply dto) throws SQLException;
	public int replyCount(Map<String, Object> map);
	public List<Reply> listReply(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws SQLException;
	
	//파일
	public void insertFile(Board dto) throws SQLException;
	public List<Board> listFile(long postIdx);
	public Board findByFileId(long fileIdx);
	public void deleteFile(Map<String, Object> map) throws SQLException;
}
