package dao;

import java.util.List;

import dto.Photo;

public interface PhotoDao {
	int BOARD_PER_PAGE = 10;

	public List<Photo> selectAllPhoto();

	public void insertPhoto(Photo photo);

	public Photo selectPhoto(int photoNo);

	public void updatePhoto(Photo photo);

	public void deletePhoto(int photoNo);

	public List<Photo> getPhotoByPage(int page);

	int countPhoto();
}
