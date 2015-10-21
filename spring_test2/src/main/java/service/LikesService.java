package service;

import dto.Likes;

public interface LikesService {

	void insert(Likes likes);
	
	void delete(int boardNo);
	
	void update(Likes likes);
	
	Likes select(String usersId, int boardNo);
	
	int count(int boardNo,int likes);
	
}
