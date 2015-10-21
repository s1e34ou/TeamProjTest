package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import dto.Photo;

@Repository
public class PhotoDaoImpl implements PhotoDao {

	@Autowired
	JdbcTemplate jdbcTemp;

	@Autowired
	NamedParameterJdbcTemplate npJdbcTemp;

	private RowMapper<Photo> getPhotoRowMapper() {
		return new RowMapper<Photo>() {
			@Override
			public Photo mapRow(ResultSet rs, int rowNum) throws SQLException {
				Photo photo = new Photo();
				photo.setPhotoImage(rs.getString("photo_image"));
				photo.setPhotoNo(rs.getInt("photo_no"));
				photo.setPhotoContent(rs.getString("photo_content"));
				photo.setPhotoHits(rs.getInt("photo_hits"));
				photo.setPhotoName(rs.getString("photo_name"));
				photo.setPhotoDate(rs.getDate("photo_date"));
				photo.setUsersUsersId(rs.getString("users_users_id"));
				photo.setReplyCount(rs.getInt("reply_count"));
				return photo;
			}
		};
	}

	@Override
	public List<Photo> selectAllPhoto() {
		String sql = "select * from Photo";
		List<Photo> photo = jdbcTemp.query(sql, new BeanPropertyRowMapper<Photo>(Photo.class));
		return photo;
	}

	@Override
	public void insertPhoto(Photo photo) {
		String sql = "insert into photo values(BOARD_NO_SEQ.nextval,?,?,sysdate,?,?,?,0)";
		jdbcTemp.update(sql,photo.getPhotoName(), photo.getPhotoContent(),0, photo.getPhotoImage(),
				photo.getUsersUsersId());

	}

	@Override
	public Photo selectPhoto(int photoNo) {
		String sql = "select * from photo where photo_no=?";
		Photo photo = jdbcTemp.queryForObject(sql, getPhotoRowMapper(), photoNo);
		sql = "update photo set photo_hits=photo_hits+1 where photo_no=?";
		jdbcTemp.update(sql,photo.getPhotoNo());
		return photo;
	}

	@Override
	public void updatePhoto(Photo photo) {
		String sql = "update photo set photo_name=?,photo_content=?,photo_image=? where photo_no=?";
		jdbcTemp.update(sql, photo.getPhotoName(), photo.getPhotoContent(),photo.getPhotoImage(), photo.getPhotoNo());
	}

	@Override
	public void deletePhoto(int photoNo) {
		String sql = "delete from photo where photo_no=?";
		jdbcTemp.update(sql, photoNo);
	}

	@Override
	public List<Photo> getPhotoByPage(int page) {
		String sql = "SELECT * FROM (" + "SELECT sub.*, ROWNUM AS RNUM "
				+ "FROM ( select * from photo order by photo_date desc) sub)" + "WHERE RNUM >= ? AND RNUM <= ?";

		List<Photo> photo = jdbcTemp.query(sql, new BeanPropertyRowMapper<Photo>(Photo.class),
				(page - 1) * PhotoDao.BOARD_PER_PAGE + 1, page * PhotoDao.BOARD_PER_PAGE);

		return photo;
	}
	@Override
	public int countPhoto() {
		String sql = "select count(*) from photo";
		int count = jdbcTemp.queryForInt(sql);
		return count;
	}
}
