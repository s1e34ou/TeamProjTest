package servicetest;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import dto.Board;
import dto.Photo;
import service.BoardService;
import service.PhotoService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/spring/application-config.xml")
public class BoardServiceTest {
	private static Logger logger = LoggerFactory.getLogger(BoardServiceTest.class);

	@Autowired
	BoardService bservice;
	@Autowired
	PhotoService pservice;
	@Test
	public void writeTest() {
		Board board = new Board("qqq", "qqq", "qqq", "qqq");
		bservice.writeboard(board);
		
		//Photo photo = new Photo("bbb", "bbb", "bbb", "ee");
		//pservice.writephoto(photo);
		assertThat(board.getBoardContent(), is("bbb"));
	//	assertThat(photo.getPhotoContent(), is("bbb"));
	}
	
	@Test
	public void updateTest() {
		Board board = new Board(16, "ddd", "ddd");
		bservice.updateboard(board);
		
		Photo photo = new Photo(17, "ddd", "ddd");
		pservice.updatephoto(photo);
		
		assertThat(board.getBoardContent(), is("ddd"));
		assertThat(photo.getPhotoContent(), is("ddd"));
	}
	
	@Test
	public void deleteTest() {
		bservice.deleteboard(16);
		pservice.deletephoto(17);
	}
	
	@Test
	public void selectTest() {
		Board board = bservice.selectboard(19);
		logger.trace("board : {}",board);
		
		Photo photo = pservice.selectphoto(20);
		logger.trace("photo : {}",photo);
		assertThat(board.getBoardContent(), is("bbb"));
	}
	
	/*@Test
	public void getBoardByPageTest() {
		List<Board> boards = bservice.getBoardByPage(1);
		logger.trace("boards : {}",boards);
		
		List<Photo> photos = pservice.getPhotoByPage(1);
		logger.trace("boards : {}",photos);
	}
	
	@Test
	public void getAllBoardTest() {
		List<Board> boards = bservice.getAllBoard();
		
		
		List<Photo> photos = pservice.getAllPhoto();
		logger.trace("boards : {}",boards);
		logger.trace("boards : {}",photos);
	}*/
	
}
