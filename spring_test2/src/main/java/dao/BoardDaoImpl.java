package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import dto.Board;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	JdbcTemplate jdbcTemp;

	@Autowired
	NamedParameterJdbcTemplate npJdbcTemp;

	private RowMapper<Board> getBoardRowMapper() {
		return new RowMapper<Board>() {
			@Override
			public Board mapRow(ResultSet rs, int rowNum) throws SQLException {
				Board board = new Board();
				board.setBoardCode(rs.getString("board_code"));
				board.setBoardNo(rs.getInt("board_no"));
				board.setBoardContent(rs.getString("board_content"));
				board.setBoardHits(rs.getInt("board_hits"));
				board.setBoardName(rs.getString("board_name"));
				board.setBoardDate(rs.getDate("board_date"));
				board.setUsersUsersId(rs.getString("users_users_id"));
				
				return board;
			}
		};
	}
	
	@Override
	public List<Board> selectAllBoard() {
		String sql = "select * from Board order by board_date desc";
		List<Board> board = jdbcTemp.query(sql, new BeanPropertyRowMapper<Board>(Board.class));
		return board;
	}

	@Override
	public void insertBoard(Board board) {
		String sql = "insert into board values(BOARD_NO_SEQ.nextval,?,?,sysdate,?,?,?)";
		jdbcTemp.update(sql, board.getBoardName(), board.getBoardContent(),0, board.getBoardCode(),
				board.getUsersUsersId());

	}

	@Override
	public Board selectBoard(int boardNo) {
		String sql = "select * from board where board_no=?";
		Board board = jdbcTemp.queryForObject(sql, getBoardRowMapper(),boardNo);
		return board;
	}

	@Override
	public void updateBoard(Board board) {
		String sql = "update board set board_name=?,board_content=? where board_no=?";
		jdbcTemp.update(sql, board.getBoardName(), board.getBoardContent(), board.getBoardNo());
	}

	@Override
	public void deleteBoard(int boardNo) {
		String sql = "delete from board where board_no=?";
		jdbcTemp.update(sql, boardNo);
	}

	@Override
	public List<Board> getBoardByPage(int page) {
		String sql = "SELECT * FROM ("
				+ 		"SELECT sub.*, ROWNUM AS RNUM "
				+		"FROM ( select * from board order by board_date desc) sub)"
				+ "WHERE RNUM >= ? AND RNUM <= ?";
		
		List<Board> board = jdbcTemp.query(sql, new BeanPropertyRowMapper<Board>(Board.class),(page - 1) * BoardDao.BOARD_PER_PAGE + 1,page * BoardDao.BOARD_PER_PAGE);
		
		
		return board;
	}

}
