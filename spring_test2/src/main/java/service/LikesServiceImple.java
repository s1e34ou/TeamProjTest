package service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.LikesDao;
import dto.Likes;

@Service
public class LikesServiceImple implements LikesService {
	private static Logger logger = LoggerFactory.getLogger(LikesServiceImple.class);
	
	@Autowired
	LikesDao dao;
	
	@Override
	@Transactional
	public void insert(Likes likes) {
		dao.insertLikes(likes);

	}

	@Override
	@Transactional
	public void delete(int boardNo) {
		dao.deleteLikes(boardNo);
		
	}
	
	@Override
	@Transactional
	public void update(Likes likes) {
		dao.updateLikes(likes);

	}

	@Override
	public Likes select(String usersId, int boardNo) {
		try{
		Likes likes = dao.selectLikes(usersId, boardNo);
		return likes;
		}catch(NullPointerException e){
			throw e;
		}
		
	}

	@Override
	public int count(int boardNo,int likes) {
		int count = dao.countLikes(boardNo,likes);
		logger.trace("servicecount : {}",count);
		return count;
	}

	@Override
	@Transactional
	public void insertphoto(Likes likes) {
		dao.insertphotoLikes(likes);
	}

	@Override
	@Transactional
	public void deletephoto(int photoNo) {
		dao.deletephotoLikes(photoNo);
	}

	@Override
	@Transactional
	public void updatephoto(Likes likes) {
		dao.updatephotoLikes(likes);
	}

	@Override
	public int countphoto(int photoNo, int likes) {
		int count = dao.countphotoLikes(photoNo, likes);
		return count;
	}

	@Override
	public Likes selectphoto(String usersId, int photoNo) {
		try{
			Likes likes = dao.selectphotoLikes(usersId, photoNo);
			return likes;
			}catch(NullPointerException e){
				throw e;
			}
	}


	

}
