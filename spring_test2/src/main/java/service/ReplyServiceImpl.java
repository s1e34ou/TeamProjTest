package service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.BoardDao;
import dao.ReplyDao;
import dto.Reply;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	ReplyDao dao;
	
	@Override
	public List<Reply> selectAllReply() {
		 return null;
	}

	@Override
	public Reply selectReply(int no) {
		Reply reply = dao.selectReply(no);
		return reply;
	}

	@Override
	@Transactional
	public void deleteReply(int no) {
		dao.deleteReply(14);
		
	}

	@Override
	@Transactional
	public void updateReply(Reply reply) {
		dao.updateReply(reply);
		
	}

	@Override
	@Transactional
	public void insertBoardReply(Reply reply) {
		dao.insertBoardReply(reply);
		
	}

	@Override
	public List<Map<String, Object>> selectReplyByBoardNo(int boardNo) {
		List<Map<String, Object>> replys = dao.selectReplyByBoardNo(boardNo);
		return replys;
	}

	@Override
	@Transactional
	public void deleteReplyByBoardNo(int boardNo) {
		dao.deleteReplyByBoardNo(boardNo);
		
	}
	
	
	@Override
	@Transactional
	public void insertPhotoReply(Reply reply) {
		dao.insertPhotoReply(reply);
		
	}

	@Override
	public List<Map<String, Object>> selectReplyByPhotoNo(int photoNo) {
		List<Map<String, Object>> replys = dao.selectReplyByPhotoNo(photoNo);
		return replys;
	}

	@Override
	@Transactional
	public void deleteReplyByPhotoNo(int photoNo) {
		dao.deleteReplyByPhotoNo(photoNo);
		
	}
	

}
