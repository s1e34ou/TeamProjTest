package controller;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
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
@SessionAttributes({"loginUser"})
public class UserController {
	@Autowired
	UsersService service;
	
	@ModelAttribute("users")
	public Users UserInfo(){
		return new Users();
	}
	
	@InitBinder
	public void bindData(WebDataBinder binder) {
		SimpleDateFormat format = new SimpleDateFormat("yyMMdd");
		binder.registerCustomEditor(Date.class, "usersBirth", new CustomDateEditor(format, true));
	}
	
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String userJoinForm(Model model){
		model.addAttribute("contentpage", "/WEB-INF/view/join/join.jsp");
		return "start";
	}
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public String userJoin(Model model, Users users){
		model.addAttribute("contentpage", "/WEB-INF/view/join/joinsuccess.jsp");
		service.join(users);
		
		return "start";
	}

	@RequestMapping(value="/infochange",method=RequestMethod.GET)
	public String userInfoChangeForm(Model model, Users user){
		model.addAttribute("contentpage", "/WEB-INF/view/join/id_infochange.jsp");
		return "start";
	}
	
	@RequestMapping(value="/infochange",method=RequestMethod.POST)
	public String userInfoChange(Model model, Users user){
		model.addAttribute("contentpage", "/WEB-INF/view/join/id_infochangecheck.jsp");
		service.changeInfo(user);
		
		return "start";
	}
	
	@RequestMapping(value="/deleteconfirm",method=RequestMethod.POST)
	public String userDelete(Model model, Users user){
		model.addAttribute("contentpage", "/WEB-INF/view/join/id_deleteconfirm.jsp");

		service.leave(user.getUsersId());
		
		return "start";
	}
	
	
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String userLogin(Model model, Users user){
		Users loginUser = service.login(user.getUsersId(), user.getUsersPassword());
		model.addAttribute("loginUser",loginUser);
		model.addAttribute("contentpage", "/WEB-INF/view/start");

		return "start";
	}

	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String userLogout(Model model, SessionStatus sessionstatus){
		sessionstatus.setComplete();
		model.addAttribute("contentpage", "/WEB-INF/view/start");

		return "start";
	}
	
	@RequestMapping(value="/login_findinput",method=RequestMethod.GET)
	public String userLoginFindinput(Model model){
		model.addAttribute("contentpage", "/WEB-INF/view/login/login_findinput");

		return "start";
	}
	

	
	
}
