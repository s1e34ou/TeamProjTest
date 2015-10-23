package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import dto.Reply;

@Repository
public class ReplyDaoImpl implements ReplyDao {
private static Logger logger = LoggerFactory.getLogger(ReplyDaoImpl.class);

	@Autowired
	JdbcTemplate jdbcTemp;

	@Autowired
	NamedParameterJdbcTemplate npJdbcTemp;

	private RowMapper<Reply> getBoardRowMapper() {
		return new RowMapper<Reply>() {
			@Override
			public Reply mapRow(ResultSet rs, int rowNum) throws SQLException {
				Reply reply = new Reply();
				reply.setBoardBoardNo(rs.getInt("board_board_no"));
				reply.setReplyContent(rs.getString("reply_content"));
				reply.setReplyDate(rs.getDate("reply_date"));
				reply.setReplyNo(rs.getInt("reply_no"));
				reply.setUsersUsersId(rs.getString("users_users_id"));
				reply.setPhotoPhotoNo(rs.getInt("photo_photo_no"));
				return reply;
			}
		};
	}
	
	@Override
	public Reply selectReply(int replyNo) {
		String sql = "select * from reply where reply_no=?";
		Reply reply = jdbcTemp.queryForObject(sql, getBoardRowMapper(),replyNo);
		return reply;
	}

	@Override
	public void deleteReply(int replyNo) {
		String sql = "update board set reply_count=reply_count-1 where board_no=?";
		jdbcTemp.update(sql,selectReply(replyNo).getBoardBoardNo());
		sql = "delete from reply where reply_no=?";
		jdbcTemp.update(sql, replyNo);
		
	
	}
	@Override
	public void deletephotoReply(int replyNo) {
		String sql = "update photo set reply_count=reply_count-1 where photo_no=?";
		jdbcTemp.update(sql,selectReply(replyNo).getPhotoPhotoNo());
		sql = "delete from reply where reply_no=?";
		jdbcTemp.update(sql, replyNo);
		
	
	}
	
	

	@Override
	public void updateReply(Reply reply) {
		String sql = "update reply set reply_content=? where reply_no=?";
		jdbcTemp.update(sql, reply.getReplyContent(),reply.getReplyNo());

	}

	@Override
	public void insertBoardReply(Reply reply) {
		String sql = "insert into reply values(reply_NO_SEQ.nextval,?,sysdate,?,?,?)";
		jdbcTemp.update(sql, reply.getReplyContent(), reply.getUsersUsersId(), reply.getBoardBoardNo(),null);
		sql = "update board set reply_count=reply_count+1 where board_no=?";
		jdbcTemp.update(sql,reply.getBoardBoardNo());

	}

	@Override
	public List<Map<String, Object>> selectReplyByBoardNo(int boardNo) {
		String sql = "select * from reply where board_board_no=? order by reply_date";
		List<Map<String, Object>> reply = jdbcTemp.queryForList(sql,boardNo);
		
		return reply;
	}

	@Override
	public void deleteReplyByBoardNo(int boardNo) {
		
		String sql = "delete from reply where board_board_no=?";
		jdbcTemp.update(sql, boardNo);
	}

	@Override
	public void insertPhotoReply(Reply reply) {
		String sql = "insert into reply values(reply_NO_SEQ.nextval,?,sysdate,?,?,?)";
		jdbcTemp.update(sql, reply.getReplyContent(), reply.getUsersUsersId(),null, reply.getPhotoPhotoNo());
		sql = "update photo set reply_count=reply_count+1 where photo_no=?";
		jdbcTemp.update(sql,reply.getPhotoPhotoNo());
	
	}

	@Override
	public List<Map<String, Object>> selectReplyByPhotoNo(int photoNo) {
		String sql = "select * from reply where photo_photo_no=?";
		List<Map<String, Object>> reply = jdbcTemp.queryForList(sql,photoNo);
		return reply;
	}

	@Override
	public void deleteReplyByPhotoNo(int photoNo) {
		String sql = "delete from reply where photo_photo_no=?";
		jdbcTemp.update(sql, photoNo);
		
	}

	@Override
	public int countReplyByBoardNo(int boardNo) {
		String sql="select count(*) from reply where board_board_no=?";
		int count=jdbcTemp.queryForInt(sql, boardNo);
		return count;
	}

	@Override
	public void delete(int boardNo) {
		String sql = "delete from reply where board_board_no=?";
		
		jdbcTemp.update(sql, boardNo);
		
	}



}
