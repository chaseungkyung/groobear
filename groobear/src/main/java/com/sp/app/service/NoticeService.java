package com.sp.app.service;
import java.util.List;
import java.util.Map;

import com.sp.app.model.notice.Notice;
import com.sp.app.model.notice.Reply;

public interface NoticeService {
	
	//공지사항
	public void insertNotice(Notice dto, String uploadPath) throws Exception;
	public void updatdeNotice(Notice dto, String uploadPath) throws Exception;
	public void deleteNotice(long noticeIdx, String uploadPath) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Notice> listNotice(Map<String, Object> map);
	public List<Notice> listNoticeTop();
	
	public Notice findById(long noticeIdx);
	public Notice findByPrev(Map<String, Object> map);
	public Notice findByNext(Map<String, Object> map);
	
	//댓글
	public void insertReply(Reply dto) throws Exception;
	public int replyCount(Map<String, Object> map);
	public List<Reply> listReply(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	//파일
	public List<Notice> listFile(long noticeIdx);
	public void deleteFile(Map<String, Object> map) throws Exception;
	public Notice findByFileId(long fileIdx);
	
	public boolean deleteUploadFile(String uploadPath, String filename);
}
