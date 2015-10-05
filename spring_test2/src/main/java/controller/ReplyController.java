package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dto.Reply;
import service.ReplyService;

@Controller
public class ReplyController {

	@Autowired
	ReplyService service;
	
	@ModelAttribute("reply")
	public Reply getreply(){
		return new Reply();
	}
	
	@RequestMapping(value = "/reply", method = RequestMethod.GET)
	public String keyword(Model model) {
		model.addAttribute("contentpage", "/WEB-INF/view/festival_regionboard_write.jsp");
		return "start";
	}
}
