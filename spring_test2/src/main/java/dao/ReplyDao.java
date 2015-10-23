package dao;

import java.util.List;
import java.util.Map;

import dto.Reply;

public interface ReplyDao {

	public Reply selectReply(int no);
	
	public int countReplyByBoardNo(int boardNo);

	public void deleteReply(int no);

	public void updateReply(Reply reply);

	public void insertPhotoReply(Reply reply);

	public List<Map<String, Object>> selectReplyByPhotoNo(int photoNo);

	public void deleteReplyByPhotoNo(int photoNo);
	
	public void insertBoardReply(Reply reply);

	public List<Map<String, Object>> selectReplyByBoardNo(int boardNo);

	public void deleteReplyByBoardNo(int boardNo);
	
	public void delete(int boardNo);

	void deletephotoReply(int replyNo);
}
