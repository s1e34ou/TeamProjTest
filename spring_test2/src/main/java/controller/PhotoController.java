package controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dto.Board;
import dto.Likes;
import dto.Photo;
import dto.Users;
import service.LikesService;
import service.PhotoService;
import service.ReplyService;

@Controller
public class PhotoController {

	private static Logger logger = LoggerFactory.getLogger(PhotoController.class);
	@Autowired
	PhotoService service;
	
	@Autowired
	ReplyService rservice;
	
	@Autowired
	LikesService lservice;
	
	@ModelAttribute("photo")
	public Photo getphoto(){
		
		return new Photo();
	}
	
	@RequestMapping(value = "/albumboard", method = RequestMethod.GET)
	public String album(Model model,HttpServletRequest req) {
		Object pageObj = req.getAttribute("page");
		
		int page;
		if(pageObj!=null){
			page=(int)pageObj;
		}else{
			page = Integer.parseInt(req.getParameter("page"));
		}
		
		List<Photo> plist = service.getPhotoByPage(page);
		List<Photo> list = service.getAllPhoto();
		
		model.addAttribute("contentpage", "/WEB-INF/view/album/albumboard.jsp");
		model.addAttribute("boardlist", list);
		model.addAttribute("pagelist", plist);
		model.addAttribute("page",page);
		return "start";
	}


	@RequestMapping(value = "/albumboard_write", method = RequestMethod.GET)
	public String albumWriteForm(Model model,Photo photo, HttpSession sess) {
		Users users = (Users) sess.getAttribute("loginUser");
		photo.setUsersUsersId(users.getUsersId());
		model.addAttribute("contentpage", "/WEB-INF/view/album/albumboard_write.jsp");
		return "start";
	}
	
	@RequestMapping(value = "/albumboard_write", method = RequestMethod.POST)
	public String albumWrite(Model model,Photo photo,@RequestParam MultipartFile file,RedirectAttributes redir) throws IllegalStateException, IOException {
		redir.addFlashAttribute("contentpage", "/WEB-INF/view/album/albumboard_view.jsp");
		File nfile = new File("C:/editorFiles2/thumbnail/"+file.getOriginalFilename());
		file.transferTo(nfile);
		logger.trace("filename : {}",file.getOriginalFilename());
		Map<String, Object> data = new HashMap<>();
		logger.trace("file : {}",file);
		data.put("location", nfile.getCanonicalPath());
		photo.setPhotoImage(file.getOriginalFilename());
		logger.trace("ex : {}",photo.getPhotoImage());
		service.writephoto(photo);
		
		List<Photo> plist = service.getPhotoByPage(1);
		List<Photo> list = service.getAllPhoto();
		redir.addFlashAttribute("photolist", list);
		redir.addFlashAttribute("pagelist", plist);
		model.addAttribute("contentpage", "/WEB-INF/view/album/NewFile.jsp");
		return "start";
	}
	
	@RequestMapping(value = "/albumboard_view", method = RequestMethod.GET)
	public String eventView(Model model, @RequestParam int photoNo,HttpSession sess) {
		Photo photo = new Photo();
		List<Map<String, Object>> reply;
		photo = service.selectphoto(photoNo);
		reply=rservice.selectReplyByBoardNo(photoNo);
		int likecount = lservice.count(photoNo,2);
		int unlikcecount = lservice.count(photoNo,1);
		logger.trace("likecount: {}",likecount);
		model.addAttribute("likecount", likecount);
		model.addAttribute("unlikecount", unlikcecount);
		
		model.addAttribute("replylist",reply);
		model.addAttribute("currentboard", photo); //사용자 인증 
		
		try{
		Likes likes = new Likes();
		Users users = (Users) sess.getAttribute("loginUser");
		likes = lservice.select(users.getUsersId(), photoNo);
		model.addAttribute("likes", likes);
		}catch(NullPointerException e){
			
		}finally{
			model.addAttribute("currentboard", photo); //사용자 인증 
			model.addAttribute("contentpage", "/WEB-INF/view/album/albumboard_view.jsp");
			return "start";
		}
		
	}
	
	
}
