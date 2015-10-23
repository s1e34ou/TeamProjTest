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
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
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
	
	@InitBinder
	public void columnFiltering(WebDataBinder binder){
		binder.setDisallowedFields("photoImage");
	}
	
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
		int count = service.countphoto();
		model.addAttribute("contentpage", "/WEB-INF/view/album/albumboard.jsp");
		model.addAttribute("photolist", list);
		model.addAttribute("pagelist", plist);
		model.addAttribute("page",page);
		model.addAttribute("count",count);
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
	public String albumWrite(Model model,Photo photo,@RequestParam MultipartFile file,RedirectAttributes redir,HttpServletRequest req) throws IllegalStateException, IOException {
		logger.trace("photo : {}",file);
		File nfile = new File("c:/editorFiles2/thumbnail/"+file.getOriginalFilename());
		file.transferTo(nfile);
		Map<String, Object> data = new HashMap<>();
		data.put("location", nfile.getCanonicalPath());
		photo.setPhotoImage(file.getOriginalFilename());
		service.writephoto(photo);
		
		List<Photo> plist = service.getPhotoByPage(1);
		List<Photo> list = service.getAllPhoto();
		redir.addFlashAttribute("photolist", list);
		redir.addFlashAttribute("pagelist", plist);
		redir.addFlashAttribute("contentpage", "/WEB-INF/view/album/albumboard.jsp");
		return "redirect:board_prg";
	}
	
	@RequestMapping(value = "/albumboard_view", method = RequestMethod.GET)
	public String albumView(Model model, @RequestParam int photoNo,HttpSession sess) {
		Photo photo = new Photo();
		List<Map<String, Object>> reply;
		photo = service.selectphoto(photoNo);
		reply=rservice.selectReplyByPhotoNo(photoNo);
		int likecount = lservice.countphoto(photoNo, 2);
		int unlikcecount = lservice.countphoto(photoNo, 1);
		model.addAttribute("likecount", likecount);
		model.addAttribute("unlikecount", unlikcecount);
		
		model.addAttribute("replylist",reply);
		model.addAttribute("currentboard", photo); //사용자 인증 
		
		try{
		Likes likes = new Likes();
		Users users = (Users) sess.getAttribute("loginUser");
		likes = lservice.selectphoto(users.getUsersId(), photoNo);
		logger.trace("Likes: {}",likes);
		model.addAttribute("likes", likes);
		}catch(NullPointerException e){
			 
		}finally{
			model.addAttribute("currentboard", photo); //사용자 인증 
			model.addAttribute("contentpage", "/WEB-INF/view/album/albumboard_view.jsp");
			return "start";
		}
		
	}
	
	@RequestMapping(value = "/albumboard_delete", method = RequestMethod.GET)
	public String albumboardDelete(Model model,@RequestParam int photoNo,RedirectAttributes redir) {
		logger.trace("photoNo : {}",photoNo);
		rservice.deleteReplyByPhotoNo(photoNo);
		lservice.deletephoto(photoNo);
		
		service.deletephoto(photoNo);
		redir.addFlashAttribute("contentpage", "/WEB-INF/view/album/albumboard_delete.jsp");
		return "redirect:board_prg";
	}
	
	
	@RequestMapping(value = "/albumboard_change", method = RequestMethod.GET)
	public String albumboardChange(Model model,@RequestParam int photoNo,Photo photo,RedirectAttributes redir){
		model.addAttribute("photo", service.selectphoto(photoNo));
		logger.trace("photo : {}",service.selectphoto(photoNo));
		model.addAttribute("contentpage", "/WEB-INF/view/album/albumboard_change.jsp");
		return "start";
	}
	
	@RequestMapping(value = "/albumboard_change", method = RequestMethod.POST)
	public String albumboardChangeForm(Model model,Photo photo,@RequestParam int photoNo,@RequestParam MultipartFile file,RedirectAttributes redir) throws IllegalStateException, IOException {
		
		File nfile = new File("/editorFiles2/thumbnail/"+file.getOriginalFilename());
		file.transferTo(nfile);
		Map<String, Object> data = new HashMap<>();
		data.put("location", nfile.getCanonicalPath());
		photo.setPhotoImage(file.getOriginalFilename());
		logger.trace("board전 {}",photo);
		service.updatephoto(photo);
		logger.trace("board후 {}",photo);
		
		photo = service.selectphoto(photoNo);
		List<Map<String, Object>> reply;
		reply=rservice.selectReplyByPhotoNo(photoNo);
		
		
		
		redir.addFlashAttribute("replylist",reply);
		redir.addFlashAttribute("currentboard", photo); //사용자 인증 
		redir.addFlashAttribute("contentpage", "/WEB-INF/view/album/albumboard_view.jsp");
		return "redirect:board_prg";
	}
	
}
