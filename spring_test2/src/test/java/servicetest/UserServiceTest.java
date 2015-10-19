package servicetest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import service.UsersService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/spring/application-config.xml")
public class UserServiceTest {
private static Logger logger = LoggerFactory.getLogger(UserServiceTest.class);

	@Autowired
	UsersService service;
	
	/*@Test
	public void joinTest() {
		Users user= new Users("qqq", "qqq", "qqq", "a", "qqq", "qq", "qq", new Date(), "qq");
		
		service.join(user);
		
		assertThat(user.getUsersName(), is("qq"));
	}
	
	@Test
	public void loginTest() {
		Users user= new Users("qq", "qq", "qq", "a", "qq", "qq", "qq", new Date(), "qq");
		Users userlogin=new Users();
		
		userlogin=service.login(user.getUsersId(), user.getUsersPassword());
		
		assertThat(userlogin.getUsersName(), is("qq"));
	}
	
	@Test
	public void changeTest() {
		Users user= new Users("qq", "qq", "qq", "a", "qq", "vv", "qq", new Date(), "qq");
		service.changeInfo(user);
	}*/
	
	@Test
	public void leaveTest() {
		service.leave("qq");
	}
}
