package daotest;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import dao.LikesDao;
import dto.Likes;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/spring/application-config.xml")
public class LikesDaoTes {

	@Autowired
	LikesDao dao;
	
	@Test
	public void addtest() {
		Likes likes = new Likes("a",1,1);
		dao.insertLikes(likes);
		assertThat(likes.getUserId(), is("a"));
	}

}
