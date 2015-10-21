package service;

import java.util.List;

import dto.Photo;

public interface PhotoService {
	void writephoto(Photo photo);

	void updatephoto(Photo photo);

	void deletephoto(int photoNo);

	Photo selectphoto(int photoNo);

	List<Photo> getPhotoByPage(int page);

	List<Photo> getAllPhoto();

	int countphoto();
}
