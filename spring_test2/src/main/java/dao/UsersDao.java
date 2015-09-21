package dao;

import dto.Users;

public interface UsersDao {
	void insertUser(Users user);

	void updateUser(Users user);

	void deleteUser(String id);

	Users selectUser(String userId);
	
	Users findUser(String userEmail);
}
