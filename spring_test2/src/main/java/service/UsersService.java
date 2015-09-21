package service;

import dto.Users;

public interface UsersService {
	void join(Users user);

	Users login(String userId, String pass);

	void changeInfo(Users user);

	void leave(String userId);
	
	Users selectUser(String userId);
	
	Users find(String userEmail, String userName);
	
	Users findPw(String userId, String userName, String passQues);
	
}
