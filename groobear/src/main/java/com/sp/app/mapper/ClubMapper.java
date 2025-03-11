package com.sp.app.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sp.app.model.Club;

@Mapper
public interface ClubMapper {
	public void insertClub(Club dto) throws SQLException;
	public void updateClub(Club dto) throws SQLException;
	public void deleteClub(long num) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<Club> listClub(Map<String, Object> map);

	public Club findById(Long num);
	public Club findByPrev(Map<String, Object> map);
	public Club findByNext(Map<String, Object> map);
}
