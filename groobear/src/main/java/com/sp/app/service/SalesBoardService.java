package com.sp.app.service;

import java.util.List;
import java.util.Map;

import com.sp.app.model.SalesBoard;

public interface SalesBoardService {
	public void insertBoard(SalesBoard dto, String uploadPath) throws Exception;
	public List<SalesBoard> listBoard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public SalesBoard findById(long num);
	public SalesBoard findByPrev(Map<String, Object> map);
	public SalesBoard findByNext(Map<String, Object> map);
	
	public void updateBoard(SalesBoard dto, String uploadPath) throws Exception;
	public void DeleteBoard(long num, String uploadPath, String empIdx, int userLevel) throws Exception;
	
	public boolean deleteUploadFile(String uploadPath, String filename);
	
	// 댓글
}
