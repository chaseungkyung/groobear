package com.sp.app.service;

import java.util.List;
import java.util.Map;

import com.sp.app.model.Club;

public interface ClubService {
	public void insertClub(Club dto, String uploadPath) throws Exception;
	public int dataCount(Map<String, Object> map);
	public List<Club> listClub(Map<String, Object> map);
	public Club findById(long num);
	public Club findByPrev(Map<String, Object> map);
	public Club findByNext(Map<String, Object> map);
	public void updateClub(Club dto, String uploadPath) throws Exception;
	public void deleteClub(long num, String uploadPath, String filename) throws Exception;
	
	public boolean deleteUploadFile(String uploadPath, String filename);
}
