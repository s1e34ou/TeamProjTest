package daotest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import dao.UsersDao;
import dto.Users;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/spring/application-config.xml")
public class UserDaoTest {
	private static Logger logger = LoggerFactory.getLogger(UserDaoTest.class);

	@Autowired
	UsersDao dao;

	/*@Test
	public void addTest() {
		Users user= new Users("ee", "ee", "ee", "a", "ee", "ee", "ee",new Date(), "ee");
		dao.insertUser(user);
		assertThat(user.getUsersName(), is("ee"));
	}
	
	@Test
	public void updateTest() {
		Users user= new Users("ee","ee","ee","a","ee","ee","dd",new Date(),"bbb");
		dao.updateUser(user);
		assertThat(user.getUsersName(), is("ee"));
	}*/

	@Test
	public void selectTest() {
		Users user;
		user = dao.selectUser("ee");
		logger.trace("user : {}",user);
	}

	@Test
	public void deleteTest() {
		dao.deleteUser("ee");
	}

}
