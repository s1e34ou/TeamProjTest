package daotest;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import dao.BoardDao;
import dto.Board;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/spring/application-config.xml")
public class BoardDaoTest {
private static Logger logger = LoggerFactory.getLogger(BoardDaoTest.class);

	@Autowired
	BoardDao dao;
	
	@Test
	public void addTest() {
		Board board = new Board("bbb", "bbb", "bbb", "ee");
		dao.insertBoard(board);
		assertThat(board.getBoardContent(), is("bbb"));
	}
	
	@Test
	public void updateTest() {
		Board board = new Board();
		board.setBoardNo(10);
		board.setBoardName("ccc");
		board.setBoardContent("ccc");
		
		dao.updateBoard(board);
		assertThat(board.getBoardContent(), is("ccc"));
	}

	@Test
	public void selectTest() {
		Board board = dao.selectBoard(10);
		logger.trace("board : {}",board);
	}

	@Test
	public void deleteTest() {
		dao.deleteBoard(10);
	}
	
	/*@Test
	public void test(){
		int a = dao.countBoard("EVENT.*");
		logger.trace("a : {}",a);
	}*/
}
