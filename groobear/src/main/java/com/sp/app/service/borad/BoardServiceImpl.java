package com.sp.app.service.borad;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.model.board.Board;
import com.sp.app.model.board.ReplyBoard;

@Service
public class BoardServiceImpl implements BoardService {

	
	
	@Override
	public void insertBoard(Board dto, String uploadPath) throws Exception {
		
	}

	@Override
	public List<Board> listBoard(Map<String, Object> map) {
		return null;
	}

	@Override
	public Board findById(long postIdx) {
		return null;
	}

	@Override
	public Board findByPrev(Map<String, Object> map) {
		return null;
	}

	@Override
	public Board findByNext(Map<String, Object> map) {
		return null;
	}

	@Override
	public void updateBoard(Board dto, String uploadPath) throws Exception {
		
	}

	@Override
	public void deleteBoard(long postIdx, String uploadPath) throws Exception {
		
	}

	@Override
	public boolean deleteUploadFile(String uploadPath, String filename) {
		return false;
	}

	@Override
	public void insertReply(ReplyBoard dto) throws Exception {
		
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		return 0;
	}

	@Override
	public List<ReplyBoard> listReply(Map<String, Object> map) {
		return null;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		
	}

}
