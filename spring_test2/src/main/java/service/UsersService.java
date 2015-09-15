package service;

import dto.Users;

public interface UsersService {
	void join(Users user);

	Users login(String userId, String pass);

	void changeInfo(Users user);

	void leave(String userId);
}
