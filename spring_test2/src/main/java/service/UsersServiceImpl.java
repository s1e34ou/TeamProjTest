package service;

import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.dao.EmptyResultDataAccessException;
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
		try{
		dao.insertUser(user);
		}catch(DuplicateKeyException e){
			logger.trace("아이디중복");
			e.printStackTrace();
		}
	}

	
	@Override
	public Users login(String userId, String pass) {
		Users user = null;
		try{
		Users selected = dao.selectUser(userId);

		
		String msg;
		if(selected!=null&&selected.getUsersPassword().equals(pass)){
			user=selected;
			logger.trace("사용자 로그인 {}",user);
			return user;
			
		}else{
			msg="비밀번호 확인";
			throw new ServiceFailException(msg);
		}
	}catch(ServiceFailException e){
		logger.trace(e.getMessage());
		throw e;
	}catch(EmptyResultDataAccessException e){
		String msg;
		msg="아이디 확인";
		logger.trace(msg);
		throw e;
	}
		
	
	}
	
	@Override
	public Users selectUser(String userId){
		Users selUser=null;
		try{
			selUser=dao.selectUser(userId);
		}catch(EmptyResultDataAccessException e){
			logger.trace(e.getMessage());
		}
		
		
		return selUser;
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

	@Override
	public Users find(String userEmail, String userName) {
		Users finded = dao.findUser(userEmail);
		Users user;
		if(finded==null){
			throw new ServiceFailException(userEmail+"로 등록된 사용자가 없습니다.");
		}
		if(finded.getUsersName().equals(userName)){
			user=finded;
			logger.trace("사용자 찾기{}",user);
		}else{
			throw new ServiceFailException("이름이 일치하지 않습니다.");
		}
		return user;
	}

	@Override
	public Users findPw(String userId, String userName, String passQues) {
		Users findedPw = dao.selectUser(userId);
		logger.trace("findedPw : {}",findedPw);

		Users user;
		if(findedPw==null){
			throw new ServiceFailException(userId+"로 등록된 사용자가 없습니다.");
		}
		if(findedPw!=null&&findedPw.getUsersName().equals(userName)&&findedPw.getUsersPassques().equals(passQues)){
			user=findedPw;
			logger.trace("비밀번호 찾기{}",user);
		}else{

			throw new ServiceFailException("비밀번호를 찾을수 없습니다.");
		}
		return user;
	}


}
