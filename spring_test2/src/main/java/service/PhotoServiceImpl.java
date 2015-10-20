package service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.PhotoDao;
import dto.Photo;

@Service
public class PhotoServiceImpl implements PhotoService {
	private static Logger logger = LoggerFactory.getLogger(PhotoServiceImpl.class);

	@Autowired
	PhotoDao dao;

	@Override
	@Transactional
	public void writephoto(Photo photo) {
		dao.insertPhoto(photo);

	}

	@Override
	@Transactional
	public void updatephoto(Photo photo) {
		dao.updatePhoto(photo);

	}

	@Override
	@Transactional
	public void deletephoto(int photoNo) {
		dao.deletePhoto(photoNo);

	}

	@Override
	public Photo selectphoto(int photoNo) {
		Photo photo = dao.selectPhoto(photoNo);
		return photo;
	}

	@Override
	public List<Photo> getPhotoByPage(int page) {
		List<Photo> photos = dao.getPhotoByPage(page);
		return photos;
	}

	@Override
	public List<Photo> getAllPhoto() {
		List<Photo> photos = dao.selectAllPhoto();
		return photos;
	}

	@Override
	public int countphoto() {
		int count = dao.countPhoto();
		return count;
		
	}
}
