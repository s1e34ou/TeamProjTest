package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import dto.Board;
import dto.Reply;
import service.BoardService;
import service.ReplyService;

@Controller
public class ReplyController {
private static Logger logger = LoggerFactory.getLogger(ReplyController.class);
	@Autowired
	ReplyService service;
	@Autowired
	BoardService bservice;
	@ModelAttribute("reply")
	public Reply getreply(){
		return new Reply();
	}
	
	@RequestMapping(value = "/replywrite", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody String replyWrite(Model model,@RequestParam String userid,@RequestParam Integer boardno,@RequestParam String replycon) {
		Gson gson= new Gson();
		
		Reply reply = new Reply();
		reply.setReplyContent(replycon);
		reply.setUsersUsersId(userid);
		reply.setBoardBoardNo(boardno);
		logger.trace("reply : {}",reply);
		service.insertBoardReply(reply);
		
		List<Map<String, Object>> replylist = service.selectReplyByBoardNo(boardno);
		
		return gson.toJson(replylist);
	}

	@RequestMapping(value = "/replydelete", method = RequestMethod.GET)
	public String replyDelete(Model model,@RequestParam Integer boardno, @RequestParam Integer replyno) {
		logger.trace("boardno:{}, replyno:{}",boardno,replyno);
		service.deleteReply(replyno);
		
		Board board = new Board();
		List<Map<String, Object>> reply;
		board = bservice.selectboard(boardno);
		
		reply=service.selectReplyByBoardNo(boardno);
		
		model.addAttribute("replylist",reply);
		model.addAttribute("currentboard", board);
		
		model.addAttribute("contentpage", "/WEB-INF/view/community/freeboard_view.jsp");
		return "start";
	}
	
		
}
