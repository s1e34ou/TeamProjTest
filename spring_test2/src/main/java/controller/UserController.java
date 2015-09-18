package controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import dto.Users;
import service.UsersService;

@Controller
@SessionAttributes({ "loginUser" })
public class UserController {
	@Autowired
	UsersService service;

		
	@ModelAttribute("users")
	public Users getusers(){
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
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public String userJoin(Model model, Users users){
		model.addAttribute("contentpage", "/WEB-INF/view/join/joinsuccess.jsp");
		service.join(users);
		return "start";
	}

	@RequestMapping(value = "/infochange", method = RequestMethod.GET)
	public String userInfoChangeForm(Model model, Users user) {
		model.addAttribute("contentpage", "/WEB-INF/view/join/id_infochange.jsp");
		return "start";
	}

	@RequestMapping(value = "/infochange", method = RequestMethod.POST)
	public String userInfoChange(Model model, Users user) {
		model.addAttribute("contentpage", "/WEB-INF/view/join/id_infochangecheck.jsp");
		service.changeInfo(user);

		return "start";
	}

	@RequestMapping(value = "/deleteconfirm", method = RequestMethod.POST)
	public String userDelete(Model model, Users user) {
		model.addAttribute("contentpage", "/WEB-INF/view/join/id_deleteconfirm.jsp");

		service.leave(user.getUsersId());

		return "start";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String userLogin(Model model, HttpServletRequest req) {
		String usersid = req.getParameter("usersId");
		String userspassword = req.getParameter("usersPassword");
		
		Users loginUser = service.login(usersid,userspassword);
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("contentpage", "/WEB-INF/view/main.jsp");


		return "start";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String userLogout(Model model, SessionStatus sessionstatus) {
		sessionstatus.setComplete();
		model.addAttribute("contentpage", "/WEB-INF/view/main.jsp");

		return "start";
	}

	@RequestMapping(value = "/login_findinput", method = RequestMethod.GET)
	public String userLoginFindinput(Model model) {
		model.addAttribute("contentpage", "/WEB-INF/view/login/login_findinput");

		return "start";
	}

}
