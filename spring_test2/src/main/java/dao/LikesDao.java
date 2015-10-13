package dao;

import dto.Likes;

public interface LikesDao {

	public void insertLikes(Likes likes);
	
	public void deleteLikes(int likesNo);
	
	public void updateLikes(Likes likes);
	
	public Likes selectLikes(String usersId,int boardNo);
}
