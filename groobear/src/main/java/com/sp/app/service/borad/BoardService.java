package com.sp.app.service.borad;

import java.util.List;
import java.util.Map;

import com.sp.app.model.board.Board;
import com.sp.app.model.board.ReplyBoard;

public interface BoardService {
	
	public void insertBoard(Board dto, String uploadPath) throws Exception;
	public List<Board> listBoard(Map<String, Object> map);
	public Board findById(long postIdx);
	public Board findByPrev(Map<String, Object> map);
	public Board findByNext(Map<String, Object> map);
	public void updateBoard(Board dto, String uploadPath) throws Exception;
	public void deleteBoard(long postIdx, String uploadPath) throws Exception;
	
	public boolean deleteUploadFile(String uploadPath, String filename);
	
	public void insertReply(ReplyBoard dto) throws Exception;
	public int replyCount(Map<String, Object> map);
	public List<ReplyBoard> listReply(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
}
