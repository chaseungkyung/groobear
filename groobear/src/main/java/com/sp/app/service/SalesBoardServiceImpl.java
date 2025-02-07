package com.sp.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.model.SalesBoard;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class SalesBoardServiceImpl implements SalesBoardService{

	@Override
	public void insertBoard(SalesBoard dto, String uploadPath) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<SalesBoard> listBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public SalesBoard findById(long num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SalesBoard findByPrev(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SalesBoard findByNext(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateBoard(SalesBoard dto, String uploadPath) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void DeleteBoard(long num, String uploadPath, String empIdx, int userLevel) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean deleteUploadFile(String uploadPath, String filename) {
		// TODO Auto-generated method stub
		return false;
	}

}
