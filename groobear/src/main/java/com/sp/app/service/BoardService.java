package com.sp.app.service;

import java.util.List;
import java.util.Map;

import com.sp.app.model.board.Board;
import com.sp.app.model.board.Reply;

public interface BoardService {
	
	//게시판
	public void insertBoard(Board dto, String uploadPath) throws Exception;
	public void updateBoard(Board dto, String uploadPath) throws Exception;
	public void deleteBoard(long postIdx, String uploadPath) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Board> listBoard(Map<String, Object> map);
	
	public Board findById(long postIdx);
	public Board findByPrev(Map<String, Object> map);
	public Board findByNext(Map<String, Object> map);
	
	//댓글
	public void insertReply(Reply dto) throws Exception;
	public void deleteReply(Map<String, Object> map) throws Exception;
	public int replyCount(Map<String, Object> map);
	public List<Reply> listReply(Map<String, Object> map);
	
	//파일
	public List<Board> listFile(long postIdx);
	public Board findByFileId(long fileIdx);
	public void deleteFile(Map<String, Object> map) throws Exception;

	public boolean deleteUploadFile(String uploadPath, String filename);
}
