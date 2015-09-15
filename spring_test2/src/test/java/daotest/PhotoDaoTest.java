package daotest;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import dao.PhotoDao;
import dto.Photo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/spring/application-config.xml")
public class PhotoDaoTest {
private static Logger logger = LoggerFactory.getLogger(PhotoDaoTest.class);

	@Autowired
	PhotoDao dao;
	
	@Test
	public void addTest() {
		Photo photo = new Photo("bbb", "bbb", "bbb", "ee");
		dao.insertPhoto(photo);
		assertThat(photo.getPhotoContent(), is("bbb"));
	}
	
	@Test
	public void updateTest() {
		Photo photo = new Photo();
		photo.setPhotoNo(13);
		photo.setPhotoName("ccc");
		photo.setPhotoContent("ccc");
		
		dao.updatePhoto(photo);
		assertThat(photo.getPhotoContent(), is("ccc"));
	}

	@Test
	public void selectTest() {
		Photo photo = dao.selectPhoto(13);
		logger.trace("photo : {}",photo);
	}

	@Test
	public void deleteTest() {
		dao.deletePhoto(13);
	}
}
