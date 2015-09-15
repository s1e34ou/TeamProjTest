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
	
	@RequestMapping(value="/freeboard",method=RequestMethod.GET)
	public String freeboard(Model model){
		
		return "commmunity/freeboard";
	}
	
	@RequestMapping(value="/freeboard_view",method=RequestMethod.GET)
	public String freeboardView(Model model, @RequestParam int boardno, Board board){
		board=service.selectboard(boardno);
				
		return "commmunity/freeboard_view";
	}
	
	@RequestMapping(value="/freeboard_write",method=RequestMethod.GET)
	public String freeboardWrite(Model model){
		
		return "commmunity/freeboard_write";
	}
	
}
