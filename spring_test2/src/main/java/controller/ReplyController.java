package controller;

import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import dto.Board;
import dto.Likes;
import dto.Photo;
import dto.Reply;
import dto.Users;
import service.BoardService;
import service.LikesService;
import service.PhotoService;
import service.ReplyService;

@Controller
public class ReplyController {
	private static Logger logger = LoggerFactory.getLogger(ReplyController.class);
	@Autowired
	ReplyService service;
	@Autowired
	BoardService bservice;

	@Autowired
	PhotoService pservice;
	@Autowired
	LikesService lservice;

	@ModelAttribute("reply")
	public Reply getreply() {

		return new Reply();
	}

	@RequestMapping(value = "/replywrite", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody String replyWrite(Model model, @RequestParam String userid, @RequestParam Integer boardno,
			@RequestParam String replycon) {
		Gson gson = new Gson();

		Reply reply = new Reply();
		reply.setReplyContent(replycon);
		reply.setUsersUsersId(userid);
		reply.setBoardBoardNo(boardno);
		logger.trace("reply : {}", reply);
		service.insertBoardReply(reply);

		List<Map<String, Object>> replylist = service.selectReplyByBoardNo(boardno);

		return gson.toJson(replylist);
	}

	@RequestMapping(value = "/replyphotowrite", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody String replyphotoWrite(Model model, @RequestParam String userid, @RequestParam Integer boardno,
			@RequestParam String replycon) {
		Gson gson = new Gson();

		Reply reply = new Reply();
		reply.setReplyContent(replycon);
		reply.setUsersUsersId(userid);
		reply.setPhotoPhotoNo(boardno);
		logger.trace("reply : {}", reply);
		service.insertPhotoReply(reply);

		List<Map<String, Object>> replylist = service.selectReplyByPhotoNo(boardno);

		return gson.toJson(replylist);
	}

	@SuppressWarnings("finally")
	@RequestMapping(value = "/replydelete", method = RequestMethod.GET)
	public String replyDelete(Model model, @RequestParam int replyno, HttpServletRequest req, RedirectAttributes redir,
			HttpSession sess) {
		Object photonoObj = req.getParameter("photono");
		Object boardnoObj = req.getParameter("boardno");
		
		logger.trace(boardnoObj + "," + photonoObj);

		Board board = new Board();
		Photo photo = new Photo();
		List<Map<String, Object>> reply;

		if (boardnoObj != null) {
			service.deleteReply(replyno);
			int boardno = Integer.parseInt((String) boardnoObj);
			int likecount = lservice.count(boardno, 2);
			int unlikcecount = lservice.count(boardno, 1);
			
			redir.addFlashAttribute("likecount", likecount);
			redir.addFlashAttribute("unlikecount", unlikcecount);

			board = bservice.selectboard(boardno);
			reply = service.selectReplyByBoardNo(boardno);
			logger.trace(board + "");
			redir.addFlashAttribute("currentboard", board);
			try {
				Likes likes = new Likes();
				Users users = (Users) sess.getAttribute("loginUser");
				likes = lservice.select(users.getUsersId(), boardno);
				redir.addFlashAttribute("likes", likes);
				logger.trace(board.getBoardCode().substring(0,5));
			} catch (NullPointerException e) {

			} finally {

				if (board.getBoardCode().equals("FREE")) {

					redir.addFlashAttribute("contentpage", "/WEB-INF/view/community/freeboard_view.jsp");
				}  else if (board.getBoardCode().equals("QNA")) {
					redir.addFlashAttribute("contentpage", "/WEB-INF/view/forclient/qnaboard_view.jsp");
				} else if (board.getBoardCode().equals("NOTICE")){
					redir.addFlashAttribute("contentpage", "/WEB-INF/view/forclient/notice_view.jsp");
				} else if (board.getBoardCode().substring(0,5).equals("EVENT")) {
					redir.addFlashAttribute("contentpage", "/WEB-INF/view/event/eventboard_view.jsp");
				}else{
					redir.addFlashAttribute("contentpage", "/WEB-INF/view/rank/rankboard_view.jsp");
				}
				redir.addFlashAttribute("replylist", reply);

				return "redirect:replygo";
			}
			

		} else {
			service.deletephotoReply(replyno);
			int photono = Integer.parseInt((String) photonoObj);
			int likecount = lservice.countphoto(photono, 2);
			int unlikcecount = lservice.countphoto(photono, 1);
			redir.addFlashAttribute("likecount", likecount);
			redir.addFlashAttribute("unlikecount", unlikcecount);

			photo = pservice.selectphoto(photono);
			reply = service.selectReplyByPhotoNo(photono);
			redir.addFlashAttribute("currentboard", photo);
			try {
				Likes likes = new Likes();
				Users users = (Users) sess.getAttribute("loginUser");
				likes = lservice.selectphoto(users.getUsersId(), photono);
				redir.addFlashAttribute("likes", likes);
			} catch (NullPointerException e) {

			} finally {
				redir.addFlashAttribute("contentpage", "/WEB-INF/view/album/albumboard_view.jsp");
				redir.addFlashAttribute("replylist", reply);

				return "redirect:replygo";
			}

		}

	}

	@RequestMapping(value = "/replygo", method = RequestMethod.GET)
	public String replyDelete(Model model) {
		return "start";
	}

}
