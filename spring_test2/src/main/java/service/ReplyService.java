package service;

import java.util.List;
import java.util.Map;

import dto.Reply;

public interface ReplyService {
	List<Reply> selectAllReply();

	Reply selectReply(int no);

	void deleteReply(int no);

	int countReply(int boardNo);
	
	void updateReply(Reply reply);

	void insertBoardReply(Reply reply);

	List<Map<String, Object>> selectReplyByBoardNo(int boardNo);

	void deleteReplyByBoardNo(int boardNo);

	void insertPhotoReply(Reply reply);

	List<Map<String, Object>> selectReplyByPhotoNo(int photoNo);

	void deleteReplyByPhotoNo(int photoNo);
	
	void delete(int boardNo);

	void deletephotoReply(int no);

}
