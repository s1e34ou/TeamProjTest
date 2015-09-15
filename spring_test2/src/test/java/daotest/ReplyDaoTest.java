package daotest;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import dao.ReplyDao;
import dto.Reply;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/spring/application-config.xml")
public class ReplyDaoTest {
	private static Logger logger = LoggerFactory.getLogger(ReplyDaoTest.class);

	@Autowired
	ReplyDao dao;
	
	@Test
	public void addTest() {
		Reply reply = new Reply("dfdf", "ee", 14,14);
		//dao.insertBoardReply(reply);
		dao.insertPhotoReply(reply);
		assertThat(reply.getReplyContent(), is("dfdf"));
	}
	
	@Test
	public void updateTest() {
		Reply reply = new Reply(26, "dddd");
		dao.updateReply(reply);
		assertThat(reply.getReplyContent(), is("dddd"));
	}

	@Test
	public void selectTest() {
		Reply reply = dao.selectReply(26);
		logger.trace("reply : {}",reply);
	}

	@Test
	public void deleteTest() {
		dao.deleteReply(2);
	}
	
	@Test
	public void selectByBoardNoTest() {
		List<Map<String, Object>> replys =dao.selectReplyByBoardNo(11);
		List<Map<String, Object>> replyss =dao.selectReplyByPhotoNo(14);
		logger.trace("replys : {}",replys);
		logger.trace("replys : {}",replyss);
	}
	@Test
	public void deleteByBoardNoTest() {
		dao.deleteReplyByBoardNo(4);
	}
}
