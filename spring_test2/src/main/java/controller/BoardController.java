package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dto.Board;
import service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService service;

	@RequestMapping(value = "/keyword", method = RequestMethod.GET)
	public String keyword(Model model) {

		return "main/keyword";
	}


	@RequestMapping(value = "/festival_regionboard", method = RequestMethod.GET)
	public String festivalRegionboard(Model model) {

		return "festival/festival_regionboard";
	}

	@RequestMapping(value = "/festival_regionboard_view", method = RequestMethod.GET)
	public String festivalRegionView(Model model, @RequestParam int boardno, Board board) {
		board = service.selectboard(boardno);
		model.addAttribute("currentboard", board);
		return "festival/festival_regionboard_view";
	}

	@RequestMapping(value = "/festival_regionboard_write", method = RequestMethod.GET)
	public String festivalRegionWriteForm(Model model) {
		
		return "festival/festival_regionboard_write";
	}
	
	@RequestMapping(value = "/festival_regionboard_write", method = RequestMethod.POST)
	public String festivalRegionWrite(Model model) {
		return "festival/festival_regionboard";
	}

	@RequestMapping(value = "/festival_seasonboard", method = RequestMethod.GET)
	public String festivalSeasonboard(Model model) {

		return "festival/festival_seasonboard";
	}

	@RequestMapping(value = "/festival_seasonboard_view", method = RequestMethod.GET)
	public String festivalSeasonView(Model model, @RequestParam int boardno, Board board) {
		board = service.selectboard(boardno);
		model.addAttribute("currentboard", board);
		return "festival/festival_seasonboard_view";
	}

	@RequestMapping(value = "/festival_seasonboard_write", method = RequestMethod.GET)
	public String festivalSeasonWriteForm(Model model) {

		return "festival/festival_seasonboard_write";
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
	public String freeboard(Model model, BoardService boardservice, Board board) {
		model.addAttribute("board",board);
		model.addAttribute("boardserivce",boardservice);
		return "community/freeboard";
	}

	@RequestMapping(value = "/freeboard_view", method = RequestMethod.GET)
	public String freeboardView(Model model, @RequestParam int boardno, Board board) {
		board = service.selectboard(boardno);
		model.addAttribute("currentboard", board);
		return "commmunity/freeboard_view";
	}

	@RequestMapping(value = "/freeboard_write", method = RequestMethod.GET)
	public String freeboardWriteForm(Model model) {

		return "commmunity/freeboard_write";
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
