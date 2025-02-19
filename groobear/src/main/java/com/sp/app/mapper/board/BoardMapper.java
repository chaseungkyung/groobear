package com.sp.app.mapper.board;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.model.board.Board;
import com.sp.app.model.board.ReplyBoard;

@Mapper
public interface BoardMapper {
	
	public void insertBoard(Board dto, String uploadPath) throws SQLException;
	public void updateBoard(Board dto) throws SQLException;
	public void deleteBoard(long postIdx) throws SQLException;
	
	public List<Board> listBoard(Map<String, Object> map);
	
	public Board findById(long postIdx);
	public Board findByPrev(Map<String, Object> map);
	public Board findByNext(Map<String, Object> map);

	public void insertReply(ReplyBoard dto) throws SQLException;
	public int replyCount(Map<String, Object> map);
	public List<ReplyBoard> listReply(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws SQLException;
}
