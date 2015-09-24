package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import dao.BoardDao;
import dto.Board;
import dto.Users;
import service.BoardService;

@Controller
@SessionAttributes({"boardlist","pagelist"})
public class BoardController {
	private static Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	BoardService service;
	

	
	@ModelAttribute("board")
	public Board getboard(){
		
		return new Board();
	}
	
	@RequestMapping(value = "/keyword", method = RequestMethod.GET)
	public String keyword(Model model) {
		return "main/keyword";
	}


	@RequestMapping(value = "/festival_regionboard", method = RequestMethod.GET)
	public String festivalRegionboard(Model model) {
		model.addAttribute("contentpage", "/WEB-INF/view/festival/festival_regionboard.jsp");
		return "start";
	}

	@RequestMapping(value = "/festival_regionboard_view", method = RequestMethod.GET)
	public String festivalRegionView(Model model, @RequestParam int boardno, Board board) {
		board = service.selectboard(boardno);
		model.addAttribute("contentpage", "/WEB-INF/view/festival/festival_regionboard_view.jsp");
		model.addAttribute("currentboard", board);
		return "start";
	}

	@RequestMapping(value = "/festival_regionboard_write", method = RequestMethod.GET)
	public String festivalRegionWriteForm(Model model) {
		model.addAttribute("contentpage", "/WEB-INF/view/festival_regionboard_write.jsp");
		return "start";
	}
	
	@RequestMapping(value = "/festival_regionboard_write", method = RequestMethod.POST)
	public String festivalRegionWrite(Model model,Board board) {
		model.addAttribute("contentpage", "/WEB-INF/view/community/freeboard.jsp");
		service.writeboard(board);
		return "start";
	}

	@RequestMapping(value = "/festival_seasonboard", method = RequestMethod.GET)
	public String festivalSeasonboard(Model model) {
		model.addAttribute("contentpage", "/WEB-INF/view/festival/festival_seasonboard.jsp");
		return "start";
	}

	@RequestMapping(value = "/festival_seasonboard_view", method = RequestMethod.GET)
	public String festivalSeasonView(Model model, @RequestParam int boardno, Board board) {
		board = service.selectboard(boardno);
		model.addAttribute("contentpage", "/WEB-INF/view/festival/festival_seasonboard_view.jsp");
		model.addAttribute("currentboard", board);
		return "start";
	}

	@RequestMapping(value = "/festival_seasonboard_write", method = RequestMethod.GET)
	public String festivalSeasonWriteForm(Model model) {
		model.addAttribute("contentpage", "/WEB-INF/view/festival/festival_seasonboard_write.jsp");
		return "start";
	}

	@RequestMapping(value = "/eventboard", method = RequestMethod.GET)
	public String eventboard(Model model) {
		
		return "event/eventboard";
	}

	@RequestMapping(value = "/eventboard_view", method = RequestMethod.GET)
	public String eventView(Model model, @RequestParam int boardno, Board board) {
		board = service.selectboard(boardno);
		model.addAttribute("currentboard", board);
		return "event/eventboard_view";
	}

	@RequestMapping(value = "/eventboard_write", method = RequestMethod.GET)
	public String eventWriteForm(Model model) {

		return "event/eventboard_write";
	}

	@RequestMapping(value = "/freeboard", method = RequestMethod.GET)
	public String freeboard(Model model,HttpServletRequest req) {
		Object pageObj = req.getAttribute("page");
		
		logger.trace("pageObj : {}",pageObj);
		
		int page;
		if(pageObj!=null){
			page= (int)pageObj;
			
		}else{
			page=Integer.parseInt(req.getParameter("page"));
//			page=1;
		}
		List<Board> plist = service.getBoardByPage(page);
		List<Board> list = service.getAllBoard();
		model.addAttribute("contentpage", "/WEB-INF/view/community/freeboard.jsp");
		model.addAttribute("boardlist", list);
		model.addAttribute("pagelist", plist);
		model.addAttribute("page",page);
		return "start";
	}

	@RequestMapping(value = "/freeboard_view", method = RequestMethod.GET)
	public String freeboardView(Model model, @RequestParam int boardno) {
		Board board = new Board();
		board = service.selectboard(boardno);
		
		model.addAttribute("currentboard", board);
		model.addAttribute("contentpage", "/WEB-INF/view/community/freeboard_view.jsp");
		return "start";
	}

	@RequestMapping(value = "/freeboard_write", method = RequestMethod.GET)
	public String freeboardWriteForm(Model model,Board board,HttpSession sess) {
		 Users users = (Users) sess.getAttribute("loginUser");
		board.setUsersUsersId(users.getUsersId());
		model.addAttribute("contentpage", "/WEB-INF/view/community/freeboard_write.jsp");
		return "start";
	}
	
	@RequestMapping(value = "/freeboard_write", method = RequestMethod.POST)
	public String freeboardWrite(Model model,Board board) {
		model.addAttribute("contentpage", "/WEB-INF/view/community/freeboard.jsp");
		board.setBoardCode(board.getFREE());
		service.writeboard(board);
		
		List<Board> plist = service.getBoardByPage(1);
		List<Board> list = service.getAllBoard();
		model.addAttribute("boardlist", list);
		model.addAttribute("pagelist", plist);
		return "start";
	}
	
	@RequestMapping(value = "/freeboard_change", method = RequestMethod.GET)
	public String freeboardChangeForm(Model model,@RequestParam int boardNo) {
		model.addAttribute("board", service.selectboard(boardNo));
		logger.trace("trace  "+service.selectboard(boardNo));
		
		model.addAttribute("contentpage", "/WEB-INF/view/community/freeboard_change.jsp");
		return "start";
	}

	@RequestMapping(value = "/rankboard", method = RequestMethod.GET)
	public String rankboard(Model model) {
		return "rank/rankboard";
	}

	@RequestMapping(value = "/rankboard_view", method = RequestMethod.GET)
	public String rankView(Model model, @RequestParam int boardno, Board board) {
		board = service.selectboard(boardno);
		model.addAttribute("currentboard", board);
		return "rank/rankboard_view";
	}

	@RequestMapping(value = "/rankboard_write", method = RequestMethod.GET)
	public String rankWriteForm(Model model) {

		return "rank/rankboard_write";
	}

	@RequestMapping(value = "/introduction", method = RequestMethod.GET)
	public String introduction(Model model) {

		return "event/introduction";
	}

	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice(Model model) {

		return "notice";
	}

	@RequestMapping(value = "/notice_view", method = RequestMethod.GET)
	public String noticeView(Model model, @RequestParam int boardno, Board board) {
		board = service.selectboard(boardno);
		model.addAttribute("currentboard", board);
		return "notice_view";
	}

	@RequestMapping(value = "/notice_write", method = RequestMethod.GET)
	public String noticeWriteForm(Model model) {

		return "notice_write";
	}

	@RequestMapping(value = "/qnaboard", method = RequestMethod.GET)
	public String qnaboard(Model model) {

		return "forclient/qnaboard";
	}

	@RequestMapping(value = "/qnaboard_view", method = RequestMethod.GET)
	public String qnaboardView(Model model, @RequestParam int boardno, Board board) {
		board = service.selectboard(boardno);
		model.addAttribute("currentboard", board);
		return "forclient/qnaboard_view";
	}

	@RequestMapping(value = "/qnaboard_write", method = RequestMethod.GET)
	public String qnaSboardWriteForm(Model model) {

		return "forclient/qnaboard_write";
	}
}
