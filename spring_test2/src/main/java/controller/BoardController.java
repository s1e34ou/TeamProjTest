package controller;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.service.spi.ServiceBinding;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import dto.Board;
import dto.Likes;
import dto.Users;
import service.BoardService;
import service.ReplyService;
import service.LikesService;

@Controller
@SessionAttributes({"boardlist","pagelist"})
public class BoardController {
	private static Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	BoardService service;
	
	@Autowired
	ReplyService rservice;
	@Autowired
	LikesService lservice;
	
	@ModelAttribute("board")
	public Board getboard(){
		
		return new Board();
	}
	
	@RequestMapping(value = "/keyword", method = RequestMethod.GET)
	public String keyword(Model model) {
		return "main/keyword";
	}


	@RequestMapping(value = "/festival_regionboard", method = RequestMethod.GET, produces="application/json;charset=UTF-8")
	public String festivalRegionboard(Model model,HttpServletRequest req) {
		model.addAttribute("region",req.getParameter("region"));
		logger.trace("regi: "+req.getParameter("region"));
		if(req.getParameter("pageno")==null){
			model.addAttribute("pageno",1);
		}else{
			model.addAttribute("pageno",Integer.parseInt(req.getParameter("pageno")));
		}
		model.addAttribute("contentpage", "/WEB-INF/view/festival/festival_regionboard.jsp");
		return "start";
	}

	@RequestMapping(value = "/festival_regionboard_view", method = RequestMethod.GET)
	public String festivalRegionView(Model model,HttpServletRequest req) {
		model.addAttribute("contentid",req.getParameter("contentid"));
		model.addAttribute("contentpage", "/WEB-INF/view/festival/festival_regionboard_view.jsp");
		return "start";
	}

	@RequestMapping(value = "/festival_regionboard_write", method = RequestMethod.GET)
	public String festivalRegionWriteForm(Model model) {
		model.addAttribute("contentpage", "/WEB-INF/view/festival_regionboard_write.jsp");
		return "start";
	}
	
	@RequestMapping(value = "/festival_regionboard_write", method = RequestMethod.POST)
	public String festivalRegionWrite(Model model,Board board,RedirectAttributes redir) {
		redir.addFlashAttribute("contentpage", "/WEB-INF/view/community/freeboard.jsp");
		service.writeboard(board);
		return "redirect:board_prg";
	}

	@RequestMapping(value = "/festival_seasonboard", method = RequestMethod.GET)
	public String festivalSeasonboard(Model model,HttpServletRequest req) {
		model.addAttribute("start",req.getParameter("start"));
		model.addAttribute("end",req.getParameter("end"));
		logger.trace("regi: "+req.getAttribute("region"));
		if(req.getParameter("pageno")==null){
			model.addAttribute("pageno",1);
		}else{
			model.addAttribute("pageno",Integer.parseInt(req.getParameter("pageno")));
		}
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
	public String eventboard(Model model,HttpServletRequest req) {
		Object pageObj = req.getAttribute("page");
		
		logger.trace("pageObj : {}",pageObj);
		
		int page;
		if(pageObj!=null){
			page= (int)pageObj;
			
		}else{
			page=Integer.parseInt(req.getParameter("page"));
		}
		
		Object selectObj = req.getAttribute("select");
		logger.trace("selectObj : {}",selectObj);
		
		String select;
		if(selectObj!=null){
			select = (String)selectObj;
		}else{
			select=req.getParameter("select");
		}
		
		List<Board> plist = service.getBoardByPage(page,select);
		List<Board> list = service.getAllBoard(select);
		int count = service.countboard("EVENT_.*","*");
		model.addAttribute("count", count);
		model.addAttribute("contentpage", "/WEB-INF/view/event/eventboard.jsp");
		model.addAttribute("boardlist", list);
		model.addAttribute("pagelist", plist);
		model.addAttribute("page",page);
		model.addAttribute("select",select);
		model.addAttribute("count",count);
		return "start";
	}

	@RequestMapping(value = "/eventboard_view", method = RequestMethod.GET)
	public String eventView(Model model, @RequestParam int boardNo,HttpSession sess) {
		Board board = new Board();
		List<Map<String, Object>> reply;
		board = service.selectboard(boardNo);
		reply=rservice.selectReplyByBoardNo(boardNo);
		
		int likecount = lservice.count(boardNo,2);
		int unlikcecount = lservice.count(boardNo,1);
		logger.trace("likecount: {}",likecount);
		model.addAttribute("likecount", likecount);
		model.addAttribute("unlikecount", unlikcecount);
		
		model.addAttribute("replylist",reply);
		model.addAttribute("currentboard", board); //사용자 인증 
		
		try{
		Likes likes = new Likes();
		Users users = (Users) sess.getAttribute("loginUser");
		likes = lservice.select(users.getUsersId(), boardNo);
		model.addAttribute("likes", likes);
		}catch(NullPointerException e){
			
		}finally{
			model.addAttribute("currentboard", board); //사용자 인증 
			model.addAttribute("contentpage", "/WEB-INF/view/event/eventboard_view.jsp");
			return "start";
		}
		
	}

	@RequestMapping(value = "/eventboard_write", method = RequestMethod.GET)
	public String eventWriteForm(Model model,Board board, HttpSession sess) {
		Users users = (Users) sess.getAttribute("loginUser");
		board.setUsersUsersId(users.getUsersId());
		model.addAttribute("contentpage", "/WEB-INF/view/event/eventboard_write.jsp");
		return "start"; 
	}
	
	@RequestMapping(value = "/eventboard_write", method = RequestMethod.POST)
	public String eventWrite(Model model,Board board,RedirectAttributes redir) {
		redir.addFlashAttribute("contentpage", "/WEB-INF/view/event/eventboard.jsp");
		service.writeboard(board);
		
		
		List<Board> plist = service.getBoardByPage(1,board.getEVENT());
		List<Board> list = service.getAllBoard(board.getEVENT());
		redir.addFlashAttribute("boardlist", list);
		redir.addFlashAttribute("pagelist", plist);
		return "redirect:board_prg";
	}
	
	@RequestMapping(value = "/eventboard_delete", method = RequestMethod.GET)
	public String eventboardDelete(Model model,@RequestParam int boardNo,RedirectAttributes redir) {
		lservice.delete(boardNo);
		rservice.delete(boardNo);
		service.deleteboard(boardNo);
		redir.addFlashAttribute("contentpage", "/WEB-INF/view/event/eventboard_delete.jsp");
		return "redirect:board_prg";
	}
	
	@RequestMapping(value = "/eventboard_change", method = RequestMethod.GET)
	public String eventboardChange(Model model,@RequestParam int boardNo) {
		model.addAttribute("board", service.selectboard(boardNo));
		model.addAttribute("contentpage", "/WEB-INF/view/event/eventboard_change.jsp");
		return "start";
	}
	
	@RequestMapping(value = "/eventboard_change", method = RequestMethod.POST)
	public String eventboardChangeForm(Model model,Board board,@RequestParam int boardNo,RedirectAttributes redir) {
		
		service.updateboard(board);
		
		board = service.selectboard(boardNo);
		List<Map<String, Object>> reply;
		reply=rservice.selectReplyByBoardNo(boardNo);
		
		redir.addFlashAttribute("replylist",reply);
		
		
		redir.addFlashAttribute("currentboard", board); //사용자 인증 
		redir.addFlashAttribute("contentpage", "/WEB-INF/view/event/eventboard_view.jsp");
		return "redirect:board_prg";
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
		}
		Board b = new Board();
		List<Board> plist = service.getBoardByPage(page,"FREE");
		List<Board> list = service.getAllBoard("FREE");
		int count = service.countboard("FREE","*");
		model.addAttribute("contentpage", "/WEB-INF/view/community/freeboard.jsp");
		model.addAttribute("boardlist", list);
		model.addAttribute("pagelist", plist);
		model.addAttribute("page",page);
		model.addAttribute("count", count);
		return "start";
	}

	@RequestMapping(value = "/freeboard_view", method = RequestMethod.GET)
	public String freeboardView(Model model, @RequestParam int boardNo,HttpSession sess) {
		Board board = new Board();
		List<Map<String, Object>> reply;
		board = service.selectboard(boardNo);
		logger.trace("board :{}",board);
		reply=rservice.selectReplyByBoardNo(boardNo);
		int likecount = lservice.count(boardNo,2);
		int unlikcecount = lservice.count(boardNo,1);
		logger.trace("likecount: {}",likecount);
		model.addAttribute("likecount", likecount);
		model.addAttribute("unlikecount", unlikcecount);
		
		model.addAttribute("replylist",reply);
		model.addAttribute("currentboard", board); //사용자 인증 
		
		try{
		Likes likes = new Likes();
		Users users = (Users) sess.getAttribute("loginUser");
		likes = lservice.select(users.getUsersId(), boardNo);
		logger.trace("likes : {}",likes);
		model.addAttribute("likes", likes);
		}catch(NullPointerException e){
			
		}finally {
			model.addAttribute("currentboard", board); //사용자 인증 
			model.addAttribute("contentpage", "/WEB-INF/view/community/freeboard_view.jsp");
			return "start";
		}
		
	}
	
	

	
	@RequestMapping(value = "/freeboard_write", method = RequestMethod.GET)
	public String freeboardWrite(Model model,Board board,HttpSession sess) {
		 Users users = (Users) sess.getAttribute("loginUser");
		board.setUsersUsersId(users.getUsersId());
		model.addAttribute("contentpage", "/WEB-INF/view/community/freeboard_write.jsp");
		return "start";
	}
	
	@RequestMapping(value = "/freeboard_write", method = RequestMethod.POST)
	public String freeboardWriteForm(Model model,Board board,RedirectAttributes redir) {
	//	model.addAttribute("contentpage", "/WEB-INF/view/community/freeboard.jsp");
		board.setBoardCode(board.getFREE());
		service.writeboard(board);
		redir.addFlashAttribute("contentpage",  "/WEB-INF/view/community/freeboard.jsp");
		
		List<Board> plist = service.getBoardByPage(1,board.getFREE());
		List<Board> list = service.getAllBoard(board.getFREE());
		//model.addAttribute("boardlist", list);
		//model.addAttribute("pagelist", plist);
		redir.addFlashAttribute("boardlist", list);
		redir.addFlashAttribute("pagelist", plist);
		return "redirect:board_prg";
	}
	@RequestMapping(value="/board_prg",method=RequestMethod.GET )
	public String prgfreeboardWrite(Model model){
		return "start";
	}
	@RequestMapping(value = "/freeboard_delete", method = RequestMethod.GET)
	public String freeboardDelete(Model model,@RequestParam int boardNo,RedirectAttributes redir) {
		lservice.delete(boardNo);
		rservice.delete(boardNo);
		service.deleteboard(boardNo);
		redir.addFlashAttribute("contentpage", "/WEB-INF/view/community/freeboard_delete.jsp");
		return "redirect:board_prg";
	}
	
	@RequestMapping(value = "/freeboard_change", method = RequestMethod.GET)
	public String freeboardChange(Model model,@RequestParam int boardNo) {
		model.addAttribute("board", service.selectboard(boardNo));
		
		model.addAttribute("contentpage", "/WEB-INF/view/community/freeboard_change.jsp");
		return "start";
	}
	
	@RequestMapping(value = "/freeboard_change", method = RequestMethod.POST)
	public String freeboardChangeForm(Model model,Board board,@RequestParam int boardNo,RedirectAttributes redir) {
		
		service.updateboard(board);
		
		board = service.selectboard(boardNo);
		List<Map<String, Object>> reply;
		reply=rservice.selectReplyByBoardNo(boardNo);
		
		redir.addFlashAttribute("replylist",reply);
		redir.addFlashAttribute("currentboard", board); //사용자 인증 
		redir.addFlashAttribute("contentpage", "/WEB-INF/view/community/freeboard_view.jsp");
		return "redirect:board_prg";
	}
	
	@RequestMapping(value = "/adad", method = RequestMethod.GET)
	public String adad(Model model) {
		
		model.addAttribute("contentpage", "/WEB-INF/view/adad.jsp");
		return "start";
	}

	@RequestMapping(value = "/rankboard", method = RequestMethod.GET)
	public String rankboard(Model model,HttpServletRequest req) {
		Object pageObj = req.getAttribute("page");
		
		
		int page;
		if(pageObj!=null){
			page= (int)pageObj;
			
		}else{
			page=Integer.parseInt(req.getParameter("page"));
		}
		
		Object selectObj = req.getAttribute("select");
		logger.trace("selectObj : {}",selectObj);
		
		String select;
		if(selectObj!=null){
			select = (String)selectObj;
		}else{
			select=req.getParameter("select");
		}
		List<Board> plist=null;
		List<Board> list=null;
		plist = service.getRankBoardByPage(page,select);
		list = service.getRankAllBoard(select);
		model.addAttribute("contentpage", "/WEB-INF/view/rank/rankboard.jsp");
		model.addAttribute("boardlist", list);
		model.addAttribute("pagelist", plist);
		model.addAttribute("page",page);
		model.addAttribute("select",select);
		
		return "start";
	}

	@RequestMapping(value = "/rankjson", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody String rankjsonForm(Model model,@RequestParam String selected, @RequestParam String type, HttpServletRequest req) {
		Gson gson=new Gson();
		List<Board> mrlist=null;
		if(selected.equals("hit")){
			mrlist= service.getRankBoardByPage(1, type);
			
		}else{
			mrlist= service.getRankrecomBoardByPage(1, type);
			
		}
		
		
		return gson.toJson(mrlist);
	}
	
	@RequestMapping(value = "/rankboard_view", method = RequestMethod.GET)
	public String rankView(Model model, @RequestParam int boardNo,HttpSession sess) {
		Board board = new Board();
		List<Map<String, Object>> reply;
		board = service.selectboard(boardNo);
		reply=rservice.selectReplyByBoardNo(boardNo);
		int likecount = lservice.count(boardNo,2);
		int unlikcecount = lservice.count(boardNo,1);
		logger.trace("likecount: {}",likecount);
		model.addAttribute("likecount", likecount);
		model.addAttribute("unlikecount", unlikcecount);
		
		model.addAttribute("replylist",reply);
		model.addAttribute("currentboard", board); //사용자 인증 
		
		try{
			Likes likes = new Likes();
			Users users = (Users) sess.getAttribute("loginUser");
			likes = lservice.select(users.getUsersId(), boardNo);
			model.addAttribute("likes", likes);
			}catch(NullPointerException e){
				
			}finally {
				
				model.addAttribute("currentboard", board); //사용자 인증 
				model.addAttribute("contentpage", "/WEB-INF/view/rank/rankboard_view.jsp");
				return "start";
			}
	}

	@RequestMapping(value = "/rankboard_write", method = RequestMethod.GET)
	public String rankWriteForm(Model model) {

		return "rank/rankboard_write";
	}

	@RequestMapping(value = "/introduction", method = RequestMethod.GET)
	public String introduction(Model model) {
		model.addAttribute("contentpage", "/WEB-INF/view/forclient/introduction.jsp");
		return "start";
	}

	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice(Model model,HttpServletRequest req) {
		Object pageObj = req.getAttribute("page");
		
		logger.trace("pageObj : {}",pageObj);
		
		int page;
		if(pageObj!=null){
			page= (int)pageObj;
			
		}else{
			page=Integer.parseInt(req.getParameter("page"));
		}
		Board b = new Board();
		List<Board> plist = service.getBoardByPage(1,b.getNOTICE());
		List<Board> list = service.getAllBoard(b.getNOTICE());
		int count = service.countboard(b.getNOTICE(),"*");
		model.addAttribute("count", count);
		model.addAttribute("contentpage", "/WEB-INF/view/forclient/notice.jsp");
		model.addAttribute("boardlist", list);
		model.addAttribute("pagelist", plist);
		model.addAttribute("page",page);
		return "start";
	}

	@RequestMapping(value = "/notice_view", method = RequestMethod.GET)
	public String noticeView(Model model, @RequestParam int boardNo,HttpSession sess) {
		Board board = new Board();
		List<Map<String, Object>> reply;
		board = service.selectboard(boardNo);
		reply=rservice.selectReplyByBoardNo(boardNo);
		int likecount = lservice.count(boardNo,2);
		int unlikcecount = lservice.count(boardNo,1);
		logger.trace("likecount: {}",likecount);
		model.addAttribute("likecount", likecount);
		model.addAttribute("unlikecount", unlikcecount);
		
		model.addAttribute("replylist",reply);
		model.addAttribute("currentboard", board); //사용자 인증 
		
		try{
			Likes likes = new Likes();
			Users users = (Users) sess.getAttribute("loginUser");
			likes = lservice.select(users.getUsersId(), boardNo);
			model.addAttribute("likes", likes);
			}catch(NullPointerException e){
				
			}finally {
				
				model.addAttribute("currentboard", board); //사용자 인증 
				model.addAttribute("contentpage", "/WEB-INF/view/forclient/notice_view.jsp");
				return "start";
			}
			
		}

	@RequestMapping(value = "/notice_write", method = RequestMethod.GET)
	public String noticeWriteForm(Model model,Board board,HttpSession sess) {
		Users users = (Users) sess.getAttribute("loginUser");
		board.setUsersUsersId(users.getUsersId());
		model.addAttribute("contentpage", "/WEB-INF/view/forclient/notice_write.jsp");
		return "start";
	}
	
	@RequestMapping(value = "/notice_write", method = RequestMethod.POST)
	public String noticeWrite(Model model,Board board,RedirectAttributes redir) {
		redir.addFlashAttribute("contentpage", "/WEB-INF/view/forclient/notice.jsp");
		board.setBoardCode(board.getNOTICE());
		service.writeboard(board);
		
		
		List<Board> plist = service.getBoardByPage(1,board.getNOTICE());
		List<Board> list = service.getAllBoard(board.getNOTICE());
		redir.addFlashAttribute("boardlist", list);
		redir.addFlashAttribute("pagelist", plist);
		return "redirect:board_prg";
	}
	@RequestMapping(value = "/notice_delete", method = RequestMethod.GET)
	public String noticeDelete(Model model,@RequestParam int boardNo,RedirectAttributes redir) {
		lservice.delete(boardNo);
		rservice.delete(boardNo);
		service.deleteboard(boardNo);
		redir.addFlashAttribute("contentpage", "/WEB-INF/view/forclient/notice_delete.jsp");
		return "redirect:board_prg";
	}
	
	@RequestMapping(value = "/notice_change", method = RequestMethod.GET)
	public String noticeChange(Model model,@RequestParam int boardNo) {
		model.addAttribute("board", service.selectboard(boardNo));
		model.addAttribute("contentpage", "/WEB-INF/view/forclient/notice_change.jsp");
		return "start";
	}
	
	@RequestMapping(value = "/notice_change", method = RequestMethod.POST)
	public String noticeChangeForm(Model model,Board board,@RequestParam int boardNo,RedirectAttributes redir) {
		
		service.updateboard(board);
		
		board = service.selectboard(boardNo);
		
		redir.addFlashAttribute("currentboard", board); //사용자 인증 
		redir.addFlashAttribute("contentpage", "/WEB-INF/view/forclient/notice_view.jsp");
		return "redirect:board_prg";
	}

	@RequestMapping(value = "/qnaboard", method = RequestMethod.GET)
	public String qnaboard(Model model,HttpServletRequest req) {
		Object pageObj = req.getAttribute("page");
		
		logger.trace("pageObj : {}",pageObj);
		
		int page;
		if(pageObj!=null){
			page= (int)pageObj;
			
		}else{
			page=Integer.parseInt(req.getParameter("page"));
		}
		Board b = new Board();
		List<Board> plist = service.getBoardByPage(1,b.getQNA());
		List<Board> list = service.getAllBoard(b.getQNA());
		int count = service.countboard(b.getQNA(),"*");
		model.addAttribute("count", count);
		model.addAttribute("contentpage", "/WEB-INF/view/forclient/qnaboard.jsp");
		model.addAttribute("boardlist", list);
		model.addAttribute("pagelist", plist);
		model.addAttribute("page",page);
		return "start";
	}

	@RequestMapping(value = "/qnaboard_view", method = RequestMethod.GET)
	public String qnaboardView(Model model, @RequestParam int boardNo) {
		List<Map<String, Object>> reply;
		Board board = new Board();
		board = service.selectboard(boardNo);
		reply=rservice.selectReplyByBoardNo(boardNo);
		
		model.addAttribute("replylist",reply);
		model.addAttribute("currentboard", board); //사용자 인증 
		
		model.addAttribute("contentpage", "/WEB-INF/view/forclient/qnaboard_view.jsp");
		return "start";
	}

	@RequestMapping(value = "/qnaboard_write", method = RequestMethod.GET)
	public String qnaboardWrite(Model model,Board board,HttpSession sess) {
		Users users = (Users) sess.getAttribute("loginUser");
		board.setUsersUsersId(users.getUsersId());
		model.addAttribute("contentpage", "/WEB-INF/view/forclient/qnaboard_write.jsp");
		return "start";
	}
	
	@RequestMapping(value = "/qnaboard_write", method = RequestMethod.POST)
	public String qnaboardWriteForm(Model model,Board board,RedirectAttributes redir) {
		redir.addFlashAttribute("contentpage", "/WEB-INF/view/forclient/qnaboard.jsp");
		board.setBoardCode(board.getQNA());
		service.writeboard(board);
		
		
		List<Board> plist = service.getBoardByPage(1,board.getQNA());
		List<Board> list = service.getAllBoard(board.getQNA());
		redir.addFlashAttribute("boardlist", list);
		redir.addFlashAttribute("pagelist", plist);
		return "redirect:board_prg";
	}
	@RequestMapping(value = "/qnaboard_delete", method = RequestMethod.GET)
	public String qnaboardDelete(Model model,@RequestParam int boardNo,RedirectAttributes redir) {
		lservice.delete(boardNo);
		rservice.delete(boardNo);
		service.deleteboard(boardNo);
		redir.addFlashAttribute("contentpage", "/WEB-INF/view/forclient/qnaboard_delete.jsp");
		return "redirect:board_prg";
	}
	
	@RequestMapping(value = "/qnaboard_change", method = RequestMethod.GET)
	public String qnaboardChange(Model model,@RequestParam int boardNo) {
		model.addAttribute("board", service.selectboard(boardNo));
		model.addAttribute("contentpage", "/WEB-INF/view/forclient/qnaboard_change.jsp");
		return "start";
	}
	
	@RequestMapping(value = "/qnaboard_change", method = RequestMethod.POST)
	public String qnaboardChangeForm(Model model,Board board,@RequestParam int boardNo,RedirectAttributes redir) {
		
		service.updateboard(board);
		
		board = service.selectboard(boardNo);
		
		redir.addFlashAttribute("currentboard", board); //사용자 인증 
		redir.addFlashAttribute("contentpage", "/WEB-INF/view/forclient/qnaboard_view.jsp");
		return "redirect:board_prg";
	}
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String searchboard(Model model,HttpServletRequest req) {
		Object pageObj = req.getAttribute("page");
		logger.trace("pageObj : {}",pageObj);
		
		int page;
		if(pageObj!=null){
			page= (int)pageObj;
			
		}else{
			page=Integer.parseInt(req.getParameter("page"));
		}
		Object selectObj = req.getAttribute("select");
		
		String select;
		if(selectObj!=null){
			select = (String)selectObj;
		}else{
			select=req.getParameter("select");
		}
		
		String sea = req.getParameter("se");
		logger.trace("sea : {}",sea);
		
		String code = "*";
		
		if(sea.equals("free")){
			model.addAttribute("contentpage", "/WEB-INF/view/community/freeboard.jsp");
			code = "FREE";
		}else if(sea.equals("event")){
			model.addAttribute("contentpage", "/WEB-INF/view/event/eventboard.jsp");
			code = "EVENT_.*";
		}else if(sea.equals("qna")){
			model.addAttribute("contentpage", "/WEB-INF/view/forclient/qnaboard.jsp");
			code = "QNA";
		}else{
			model.addAttribute("contentpage", "/WEB-INF/view/search/searchboard.jsp");
		}
		logger.trace("code {}",code);
		List<Board> plist = service.gettAllAllBoardByPage(page,code, select);
		List<Board> list = service.getAllAllBoard(code,select);
		int count = service.countboard(code,select);
		
		model.addAttribute("count", count);
		model.addAttribute("boardlist", list);
		model.addAttribute("pagelist", plist);
		model.addAttribute("page",page);
		model.addAttribute("select",select);
		return "start";
	}
	
	
	
}
