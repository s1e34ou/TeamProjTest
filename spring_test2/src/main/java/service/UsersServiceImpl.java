package service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.UsersDao;
import dto.Users;
import exception.ServiceFailException;

@Service
public class UsersServiceImpl implements UsersService{
private static Logger logger = LoggerFactory.getLogger(UsersServiceImpl.class);

	@Autowired
	UsersDao dao;
	
	@Override
	@Transactional
	public void join(Users user) {
		dao.insertUser(user);
	}

	@Override
	public Users login(String userId, String pass) {
		Users selected = dao.selectUser(userId);
		Users user;
		if(selected ==null){
			throw new ServiceFailException(userId+"로 등록된 사용자가 없습니다.");
		}
		if(selected.getUsersPassword().equals(pass)){
			user=selected;
			logger.trace("사용자 조회 {}",user);
		}else{
			throw new ServiceFailException("패스워드를 확인하세요");
		}
			
		return user;
	}

	@Override
	@Transactional
	public void changeInfo(Users user) {
		dao.updateUser(user);
	}

	@Override
	@Transactional
	public void leave(String userId) {
		dao.deleteUser(userId);
	}

}
