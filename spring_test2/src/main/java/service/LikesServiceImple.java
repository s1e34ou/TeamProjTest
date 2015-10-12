package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import dao.LikesDao;
import dto.Likes;

public class LikesServiceImple implements LikesService {

	@Autowired
	LikesDao dao;
	
	@Override
	@Transactional
	public void insert(Likes likes) {
		dao.insertLikes(likes);

	}

	@Override
	@Transactional
	public void delete(int likesNo) {
		dao.deleteLikes(likesNo);
		
	}
	
	@Override
	@Transactional
	public void update(Likes likes) {
		dao.updateLikes(likes);

	}

	@Override
	public Likes select(String usersId, int boardNo) {
		Likes likes = dao.selectLikes(usersId, boardNo);
		return likes;
	}


	

}
