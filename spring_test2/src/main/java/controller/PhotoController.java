package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dto.Photo;
import service.PhotoService;

@Controller
public class PhotoController {

	@Autowired
	PhotoService service;
	
	@RequestMapping(value = "/album", method = RequestMethod.GET)
	public String album(Model model) {

		return "cummunity/album";
	}

	@RequestMapping(value = "/album_view", method = RequestMethod.GET)
	public String albumView(Model model, @RequestParam int photono, Photo photo) {
		photo = service.selectphoto(photono);
		model.addAttribute("currentphoto",photo);
		return "cummunity/album_view";
	}

	@RequestMapping(value = "/album_write", method = RequestMethod.GET)
	public String festivalRegionWrite(Model model) {

		return "cummunity/album_write";
	}
}
