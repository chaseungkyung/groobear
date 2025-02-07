package com.sp.app.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.model.SalesBoard;

@Mapper
public interface SalesBoardMapper {
	public void insertBoard(SalesBoard dto, String uploadPath) throws SQLException;
	public List<SalesBoard> listBoard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public SalesBoard findById(long num);
	public SalesBoard findByPrev(Map<String, Object> map);
	public SalesBoard findByNext(Map<String, Object> map);
	
	public void updateBoard(SalesBoard dto, String uploadPath) throws SQLException;
	public void DeleteBoard(long num, String uploadPath, String empIdx, int userLevel) throws SQLException;
	
	public boolean deleteUploadFile(String uploadPath, String filename);
}
