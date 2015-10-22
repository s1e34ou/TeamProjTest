package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import dto.Board;
import dto.Likes;

@Repository
public class LikesDaoImpl implements LikesDao {
	
	private static Logger logger = LoggerFactory.getLogger(LikesDaoImpl.class);
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
				likes.setPhotoNo(rs.getInt("photo_no"));
				return likes;
			}
		};
	}

	@Override
	public void insertLikes(Likes likes) {
		String sql = "insert into likes values(LIKES_NO_SEQ.nextval,?,?,?,?)";
		jdbcTemp.update(sql,likes.getUserId(),likes.getBoardNo(),likes.getLikes(),null);
		
	}

	@Override
	public void deleteLikes(int boardNo) {
		String sql = "delete from likes where board_no=? ";
		jdbcTemp.update(sql,boardNo);
		
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

	@Override
	public int countLikes(int boardNo,int likes) {
		String sql = "select count(*) from likes where board_no=? and likes=?";
		int count = jdbcTemp.queryForInt(sql,boardNo,likes);
		logger.trace("daocount : {}",count);
		return count;
	}

	@Override
	public List<Board> selectlikeRankAllBoard(String boardCode) {
		String sql = "select * from Likes l, Board b where b.BOARD_NO = l.BOARD_NO and regexp_like(b.board_code,?) order by likes desc";
		
		List<Board> board = jdbcTemp.query(sql, new BeanPropertyRowMapper<Board>(Board.class),boardCode);
		return board;
	}

	@Override
	public List<Board> getlikerankBoardByPage(int page, String boardCode) {
		String sql = "SELECT * FROM ("
				+ 		"SELECT sub.*, ROWNUM AS RNUM "
				+		"FROM ( select * from Likes l, Board b where b.BOARD_NO = l.BOARD_NO and regexp_like(b.board_code,?) order by likes desc) sub)"
				+ "WHERE RNUM >= ? AND RNUM <= ?";
		
		List<Board> board = jdbcTemp.query(sql, new BeanPropertyRowMapper<Board>(Board.class),boardCode,(page - 1) * BoardDao.BOARD_PER_PAGE + 1,page * BoardDao.BOARD_PER_PAGE);
		
		
		return board;
	}

	@Override
	public void insertphotoLikes(Likes likes) {
		String sql = "insert into likes values(LIKES_NO_SEQ.nextval,?,?,?,?)";
		jdbcTemp.update(sql,likes.getUserId(),null,likes.getLikes(),likes.getPhotoNo());		
	}

	@Override
	public void deletephotoLikes(int photoNo) {
		String sql = "delete from likes where photo_no=? ";
		jdbcTemp.update(sql,photoNo);
		
	}

	@Override
	public void updatephotoLikes(Likes likes) {
		String sql = "update likes set likes=? where users_id=? and photo_no=?";
		jdbcTemp.update(sql, likes.getLikes(), likes.getUserId(), likes.getPhotoNo());
		
	}

	@Override
	public int countphotoLikes(int photoNo, int likes) {
		String sql = "select count(*) from likes where photo_no=? and likes=?";
		int count = jdbcTemp.queryForInt(sql,photoNo,likes);
		logger.trace("daocount : {}",count);
		return count;
	}

	@Override
	public Likes selectphotoLikes(String usersId, int photoNo) {
		String sql = "select * from likes where users_id=? and photo_no=?";
		Likes likes = jdbcTemp.queryForObject(sql, getLikesRowMapper(),usersId,photoNo);
		return likes;
	}
	
	
	
	
}
