package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import dto.Likes;

@Repository
public class LikesDaoImpl implements LikesDao {
	
	@Autowired
	JdbcTemplate jdbcTemp;
	
	@Autowired
	NamedParameterJdbcTemplate npJdbcTemp;
	
	private RowMapper<Likes> getLikesRowMapper(){
		return new RowMapper<Likes>(){
			@Override
			public Likes mapRow(ResultSet rs,int rowNum) throws SQLException{
				Likes likes = new Likes();
				likes.setLikesNo(rs.getInt("likes_no"));
				likes.setUserId(rs.getString("users_id"));
				likes.setBoardNo(rs.getInt("board_no"));
				likes.setLikes(rs.getInt("likes"));
				
				return likes;
			}
		};
	}

	@Override
	public void insertLikes(Likes likes) {
		String sql = "insert into likes values(LIKES_NO_SEQ.nextval,?,?,?)";
		jdbcTemp.update(sql,likes.getUserId(),likes.getBoardNo(),likes.getLikes());
		
	}

	@Override
	public void deleteLikes(int likesNo) {
		String sql = "delete from likes where likes_no=? ";
		jdbcTemp.update(sql,likesNo);
		
	}

	@Override
	public void updateLikes(Likes likes) {
		String sql = "update likes set likes=? where users_id=? and board_no=?";
		jdbcTemp.update(sql, likes.getLikes(), likes.getUserId(), likes.getBoardNo());
	}

	@Override
	public Likes selectLikes(String usersId, int boardNo) {
		String sql = "select * from likes where users_id=? and board_no=?";
		Likes likes = jdbcTemp.queryForObject(sql, getLikesRowMapper(),usersId,boardNo);
		return likes;
	}
	
	
	
	
}
