package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import dto.Board;
import dto.Users;
import service.BoardService;
import service.UsersService;

@Controller
@SessionAttributes({ "loginUser", "seluser","mainranklist","maineventlist" })
public class UserController {
	private static Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	UsersService service;
	
	@Autowired
	BoardService serviceb;
	
	@ModelAttribute("users")
	public Users getusers() {
		
		return new Users();
	}
	
	
		
	@RequestMapping(value = "/go", method = RequestMethod.GET)
	public String userPGR(Model model) {
		return "start";
	}
	@InitBinder
	public void bindData(WebDataBinder binder) {
		SimpleDateFormat format = new SimpleDateFormat("yyMMdd");
		binder.registerCustomEditor(Date.class, "usersBirth", new CustomDateEditor(format, true));
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainForm(Model model,HttpServletRequest req) {
		List<Board> mrlist= serviceb.getRankBoardByPage(1, "*");
		model.addAttribute("mainranklist",mrlist);
		
		List<Board> melist=serviceb.getBoardByPage(1, "*");
		model.addAttribute("maineventlist",melist);
		return "start";
	}

	@RequestMapping(value = "/mainevent", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody String maineventForm(Model model,@RequestParam String selected, HttpServletRequest req) {
		Gson gson=new Gson();
		String t;
		if(selected.equals("eventall")){
			t="EVENT_.*";
		}else if(selected.equals("eventfood")){
			t="EVENT_f.*";
		}else if(selected.equals("eventbeauty")){
			t="EVENT_b.*";
		}else{
			t="EVENT_c.*";
		}
		
		List<Board> melist=serviceb.getBoardByPage(1, t);
		
		return gson.toJson(melist);
	}
	
	@RequestMapping(value = "/mainrank", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody String mainrankForm(Model model,@RequestParam String selected, HttpServletRequest req) {
		Gson gson=new Gson();
		String t;
		if(selected.equals("hit")){
			t="*";
		}else{
			t="*";
		}
		List<Board> mrlist=serviceb.getRankBoardByPage(1, t);
		
		return gson.toJson(mrlist);
	}
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String userJoinForm(Model model) {
		model.addAttribute("contentpage", "/WEB-INF/view/join/join.jsp");
		return "start";
	}

	
	@RequestMapping(value = "/site", method = RequestMethod.GET)
	public String userSiteMap(Model model) {
		model.addAttribute("contentpage", "/WEB-INF/view/sitemap.jsp");
		return "start";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String userJoin(Model model, Users users, HttpServletRequest req,RedirectAttributes redir) {
		redir.addFlashAttribute("contentpage", "/WEB-INF/view/join/joinsuccess.jsp");
		String address1 = req.getParameter("USERS_ADRESS1");
		String address2 = req.getParameter("USERS_ADRESS2");
		String address3 = req.getParameter("USERS_ADRESS3");
		users.setUsersAddress1(address1);
		users.setUsersAddress2(address2);
		users.setUsersAddress3(address3);
		service.join(users);
		return "redirect:go";
	}

	@RequestMapping(value = "/infochange", method = RequestMethod.GET)
	public String userInfoChangeForm(Model model, Users users, HttpSession sess) {
		users = (Users) sess.getAttribute("loginUser");
		model.addAttribute("users", service.selectUser(users.getUsersId()));
		logger.trace("trace  "+service.selectUser(users.getUsersId()));
		model.addAttribute("contentpage", "/WEB-INF/view/join/id_infochange.jsp");
		return "start";
	}

	@RequestMapping(value = "/infochange", method = RequestMethod.POST)
	public String userInfoChange(Model model, Users users,RedirectAttributes redir) {
		redir.addFlashAttribute("contentpage", "/WEB-INF/view/join/id_infochangecheck.jsp");

		service.changeInfo(users);

		return "redirect:go";
	}

	@RequestMapping(value = "/deleteconfirm", method = RequestMethod.GET)
	public String userDelete(Model model, @RequestParam String id, SessionStatus sessionstatus) {
		model.addAttribute("contentpage", "/WEB-INF/view/join/id_deleteconfirm.jsp");
		service.leave(id);
		sessionstatus.setComplete();
		return "start";
	}

	@SuppressWarnings("finally")
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String userLogin(Model model, HttpServletRequest req,RedirectAttributes redir) {
		String usersid = req.getParameter("usersId");
		String userspassword = req.getParameter("usersPassword");
		String msg = null;
		try {
			Users loginUser = service.login(usersid, userspassword);
			Users seluser = service.selectUser(loginUser.getUsersId());
			logger.trace("loginUser : {}", loginUser);
			logger.trace("selser : {}", seluser);

			model.addAttribute("loginUser", loginUser);
			model.addAttribute("seluser", seluser);

		} catch (Exception e) {
			logger.trace(e.getMessage());
			if (e.getMessage() == "아이디 확인") {
				msg = "아이디 확인";
			} else {
				msg = "비밀번호 확인";
			}

		} finally {
			redir.addFlashAttribute("ex", msg);
			redir.addFlashAttribute("contentpage", "/WEB-INF/view/main.jsp");
			return "redirect:go";
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String userLogout(Model model, SessionStatus sessionstatus,RedirectAttributes redir) {
		sessionstatus.setComplete();
		redir.addFlashAttribute("contentpage", "/WEB-INF/view/main.jsp");

		return "redirect:go";
	}

	@RequestMapping(value = "/login_findinput", method = RequestMethod.GET)
	public String userLoginFindinputForm(Model model) {
		model.addAttribute("contentpage", "/WEB-INF/view/login/login_findinput.jsp");
		return "start";
	}

	@SuppressWarnings("finally")
	@RequestMapping(value = "/login_findinput", method = RequestMethod.POST)
	public String userLoginFindinput(Model model, HttpServletRequest req,RedirectAttributes redir) {
		String usersemail = req.getParameter("usersEmail");
		String usersname = req.getParameter("usersName");
		
		try {
			Users findUsers = service.find(usersemail, usersname);
			redir.addFlashAttribute("findUser", findUsers);
			
		} catch (Exception e) {
			logger.trace(e.getMessage());
		} finally {
			redir.addFlashAttribute("contentpage", "/WEB-INF/view/login/login_id_find.jsp");
			return "redirect:go";
		}

	}

	@SuppressWarnings("finally")
	@RequestMapping(value = "/login_findinputPw", method = RequestMethod.POST)
	public String userLoginFindinputPw(Model model, HttpServletRequest req,RedirectAttributes redir) {
		String usersid = req.getParameter("usersId");
		String usersname = req.getParameter("usersName");
		String usersques = req.getParameter("usersPassques");
		try {
			Users findPws = service.findPw(usersid, usersname, usersques);

			redir.addFlashAttribute("findPw", findPws);
		} catch (Exception e) {
			logger.trace(e.getMessage());
		} finally {
			redir.addFlashAttribute("contentpage", "/WEB-INF/view/login/login_pw_find.jsp");

			return "redirect:go";
		}
	}

	@SuppressWarnings("finally")
	@RequestMapping(value = "/duplication", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String userJoinDupleTest(@RequestParam String usersId) {
	
		String msg = null;
		try {
			Users user = service.selectUser(usersId);
			String id = user.getUsersId();

			if (usersId.equals(id)) {

				msg = "아이디중복";
			}
		} catch (NullPointerException e) {
			msg = "사용가능";
		} finally {
			return msg;
		}

	}
	
	@RequestMapping(value = "/passtest", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody String userpassTest(@RequestParam String usersPassword, @RequestParam String usersPasswordcheck) {
		Gson gson = new Gson();
		Map<String, String> resultMap= new HashMap<>();
		if(usersPassword.equals(usersPasswordcheck)){
			resultMap.put("result", "비밀번호 확인완료");
		}else{
			resultMap.put("result", "비밀번호 다름");
		}
		return gson.toJson(resultMap);
	}

}
