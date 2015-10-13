package servicetest;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import dto.Reply;
import service.ReplyService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/spring/application-config.xml")
public class ReplyServiceTest {
	private static Logger logger = LoggerFactory.getLogger(ReplyServiceTest.class);

	@Autowired
	ReplyService service;
	
	@Test
	public void insertTest() {
		Reply reply = new Reply();
		reply.setBoardBoardNo(105);
		reply.setReplyContent("abc");
		reply.setUsersUsersId("q");
		Reply replys = new Reply("abc", "qq", 22,22);
		service.insertBoardReply(reply);
	}
	@Test
	public void selectTest() {
		Reply reply = service.selectReply(29);
		Reply replys = service.selectReply(30);
		logger.trace("reply : {}",reply);
		logger.trace("reply : {}",replys);
	}
	@Test
	public void updateTest() {
		Reply reply = new Reply(29, "ccc");
		Reply replys = new Reply(30, "ccc");
		service.updateReply(reply);
		service.updateReply(replys);
	}
	@Test
	public void deleteTest() {
		service.deleteReply(26);
	}
	@Test
	public void selectReplyByBoardNoTest() {
		List<Map<String, Object>> replys = service.selectReplyByBoardNo(106);
		logger.trace("replys : {}",replys.get(0).get("reply_no"));
	}
	@Test
	public void deleteReplyByBoardNoTest() {
		service.deleteReplyByBoardNo(7);
	}
	
}
