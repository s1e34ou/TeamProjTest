package controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dto.Likes;
import service.LikesService;

@Controller
public class LikesController {
	private static Logger logger = LoggerFactory.getLogger(LikesController.class);
	
	@Autowired
	LikesService service;
	
	@RequestMapping(value = "/like", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String like(@RequestParam String usersId,@RequestParam int boardNo,@RequestParam int likes) {
			String msg;
			Likes li = new Likes();
			if(usersId==null){
				msg = "로그인 하여야 가능합니다.";
			}else{
			li.setUserId(usersId);
			li.setBoardNo(boardNo);
			li.setLikes(likes);
			logger.trace("msg : {}",li);
			service.insert(li);
			msg ="추천되었습니다";
			}
			return msg;
		

	}
	
	@RequestMapping(value = "/likechange", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String likechange(@RequestParam String usersId,@RequestParam int boardNo,@RequestParam int likes) {
			String msg;
			Likes li = new Likes();
			if(usersId==null){
				msg = "로그인 하여야 가능합니다.";
			}else{
			li.setUserId(usersId);
			li.setBoardNo(boardNo);
			li.setLikes(likes);
			logger.trace("msg : {}",li);
			service.update(li);
			msg ="추천되었습니다";
			}
			return msg;
	}
}
