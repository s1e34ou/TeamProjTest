package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import dto.Users;
import service.UsersService;


@Controller
@SessionAttributes({"user"})
public class UserController {
	@Autowired
	UsersService service;
	
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String userJoinForm(Model model){
		return "join/join";
	}
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public String userJoin(Model model, Users user){
		service.join(user);
		
		return "main/joinsuccess";
	}

	@RequestMapping(value="/infochange",method=RequestMethod.GET)
	public String userInfoChangeForm(Model model, Users user){
		
		return "main/id_infochange";
	}
	
	@RequestMapping(value="/infochange",method=RequestMethod.POST)
	public String userInfoChange(Model model, Users user){
		service.changeInfo(user);
		
		return "main/id_infochangecheck";
	}
	
	@RequestMapping(value="/deleteconfirm",method=RequestMethod.POST)
	public String userDelete(Model model, Users user){
		service.leave(user.getUsersId());
		
		return "main/id_deleteconfirm";
	}
	
	
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String userLogin(Model model, Users user){
		Users loginUser = service.login(user.getUsersId(), user.getUsersPassword());
		model.addAttribute("userInfo",loginUser);
		
		return "Login";
	}
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String userLogint(Model model, Users user){
		
		return "Login";
	}
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String userLogout(Model model, SessionStatus sessionstatus){
		sessionstatus.setComplete();
		
		return "main/index";
	}
	
	@RequestMapping(value="/login_findinput",method=RequestMethod.GET)
	public String userLoginFindinput(Model model){
		
		return "login_findinput";
	}
	

	
	
}
