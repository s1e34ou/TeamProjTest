package controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import dto.Likes;
import service.LikesService;

@Controller
@SessionAttributes
public class LikesController {
	private static Logger logger = LoggerFactory.getLogger(LikesController.class);
	
	@Autowired
	LikesService service;
	
	/*@RequestMapping(value = "/like", method = RequestMethod.GET )
	public String insertlikeForm(Model model,@RequestParam int boardNo,HttpSession sess){
		Likes likes = new Likes();
		Users users = (Users) sess.getAttribute("loginUser");
		likes.setUserId(users.getUsersId());
		likes.setBoardNo(boardNo);
		likes.setLikes(1);
		service.insert(likes);
		return null;
	}*/
	
	@SuppressWarnings("finally")
	@RequestMapping(value = "/like", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String userJoinDupleTest(@RequestParam String usersId) {
			String msg;
			Likes li = new Likes();
			li.setUserId(usersId);
			logger.trace("msg : {}",li);
			service.insert(li);
			msg ="추천되었습니다";
			return msg;
		

	}
}
