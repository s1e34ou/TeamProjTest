package dao;

import java.util.List;

import dto.Board;
import dto.Likes;

public interface LikesDao {

	public void insertLikes(Likes likes);
	
	public void deleteLikes(int boardNo);
	
	public void updateLikes(Likes likes);
	
	public Likes selectLikes(String usersId,int boardNo);
	
	public int countLikes(int boardNo,int likes);
	
	public List<Board> selectlikeRankAllBoard(String boardCode);

	public List<Board> getlikerankBoardByPage(int page, String boardCode);
	
	public void insertphotoLikes(Likes likes);
	
	public void deletephotoLikes(int photoNo);
	
	public void updatephotoLikes(Likes likes);
	
	public int countphotoLikes(int photoNo,int likes);
	
	public Likes selectphotoLikes(String usersId,int photoNo);
}
