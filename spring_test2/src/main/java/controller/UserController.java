package controller;

import java.io.Console;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.dao.EmptyResultDataAccessException;
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

import dto.Users;
import exception.ServiceFailException;
import service.UsersService;

@Controller
@SessionAttributes({ "loginUser", "seluser", "findUser", "findPw" })

public class UserController {
	private static Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	UsersService service;

	@ModelAttribute("users")
	public Users getusers() {
		return new Users();
	}

	@InitBinder
	public void bindData(WebDataBinder binder) {
		SimpleDateFormat format = new SimpleDateFormat("yyMMdd");
		binder.registerCustomEditor(Date.class, "usersBirth", new CustomDateEditor(format, true));
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainForm(Model model) {
		return "start";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String userJoinForm(Model model) {
		model.addAttribute("contentpage", "/WEB-INF/view/join/join.jsp");
		return "start";
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String userTest(Model model) {
		model.addAttribute("contentpage", "/WEB-INF/view/test.jsp");
		return "start";
	}
	@RequestMapping(value = "/site", method = RequestMethod.GET)
	public String userSiteMap(Model model) {
		model.addAttribute("contentpage", "/WEB-INF/view/sitemap.jsp");
		return "start";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String userJoin(Model model, Users users, HttpServletRequest req) {
		model.addAttribute("contentpage", "/WEB-INF/view/join/joinsuccess.jsp");
		String address1 = req.getParameter("USERS_ADRESS1");
		String address2 = req.getParameter("USERS_ADRESS2");
		String address3 = req.getParameter("USERS_ADRESS3");
		String address = address1 + address2 + address3;
		users.setUsersAddress(address);
		service.join(users);
		return "start";
	}

	@RequestMapping(value = "/infochange", method = RequestMethod.GET)
	public String userInfoChangeForm(Model model, Users users) {
		model.addAttribute("contentpage", "/WEB-INF/view/join/id_infochange.jsp");
		return "start";
	}

	@RequestMapping(value = "/infochange", method = RequestMethod.POST)
	public String userInfoChange(Model model, Users users) {
		model.addAttribute("contentpage", "/WEB-INF/view/join/id_infochangecheck.jsp");

		service.changeInfo(users);

		return "start";
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
	public String userLogin(Model model, HttpServletRequest req) {
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
			model.addAttribute("ex", msg);
			model.addAttribute("contentpage", "/WEB-INF/view/main.jsp");
			return "start";
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String userLogout(Model model, SessionStatus sessionstatus) {
		sessionstatus.setComplete();
		model.addAttribute("contentpage", "/WEB-INF/view/main.jsp");

		return "start";
	}

	@RequestMapping(value = "/login_findinput", method = RequestMethod.GET)
	public String userLoginFindinputForm(Model model) {
		model.addAttribute("contentpage", "/WEB-INF/view/login/login_findinput.jsp");
		return "start";
	}

	@SuppressWarnings("finally")
	@RequestMapping(value = "/login_findinput", method = RequestMethod.POST)
	public String userLoginFindinput(Model model, HttpServletRequest req) {
		String usersemail = req.getParameter("usersEmail");
		String usersname = req.getParameter("usersName");
		try {
			Users findUser = service.find(usersemail, usersname);

			model.addAttribute("findUser", findUser);
		} catch (Exception e) {
			logger.trace(e.getMessage());
		} finally {
			model.addAttribute("contentpage", "/WEB-INF/view/login/login_id_find.jsp");
			return "start";
		}

	}

	@SuppressWarnings("finally")
	@RequestMapping(value = "/login_findinputPw", method = RequestMethod.POST)
	public String userLoginFindinputPw(Model model, HttpServletRequest req) {
		String usersid = req.getParameter("usersId");
		String usersname = req.getParameter("usersName");
		String usersques = req.getParameter("usersPassques");
		try {
			Users findPw = service.findPw(usersid, usersname, usersques);

			model.addAttribute("findPw", findPw);
		} catch (Exception e) {
			logger.trace(e.getMessage());
		} finally {
			model.addAttribute("contentpage", "/WEB-INF/view/login/login_pw_find.jsp");

			return "start";
		}
	}

	@SuppressWarnings("finally")
	@RequestMapping(value = "/duplication", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String userJoinDupleTest(@RequestParam String usersId) {
		// if(usersId.equals("ddd")){
		// return "ok";
		// }else{
		// return "no";
		// }
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

}
