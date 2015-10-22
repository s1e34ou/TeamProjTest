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

@Repository
public class BoardDaoImpl implements BoardDao {
	private static Logger logger = LoggerFactory.getLogger(BoardDaoImpl.class);
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
				board.setReplyCount(rs.getInt("reply_count"));
				return board;
			}
		};
	}
	


	@Override
	public List<Board> selectAllBoard(String boardCode) {
		String sql = "select * from Board where regexp_like(board_code,?) order by board_date desc";
		List<Board> board = jdbcTemp.query(sql, new BeanPropertyRowMapper<Board>(Board.class),boardCode);
		return board;
	}

	@Override
	public void insertBoard(Board board) {
		String sql = "insert into board values(BOARD_NO_SEQ.nextval,?,?,sysdate,?,?,?,0)";
		jdbcTemp.update(sql, board.getBoardName(), board.getBoardContent(),0, board.getBoardCode(),
				board.getUsersUsersId());
	}

	@Override
	public Board selectBoard(int boardNo) {
		String sql = "select * from board where board_no=?";
		Board board = jdbcTemp.queryForObject(sql, getBoardRowMapper(),boardNo);
		sql = "update board set board_hits=board_hits+1 where board_no=?";
		jdbcTemp.update(sql,board.getBoardNo());
		return board;
	}
	

	@Override
	public void updateBoard(Board board) {
		String sql = "update board set board_name=?,board_content=? where board_no=?";
		jdbcTemp.update(sql, board.getBoardName(), board.getBoardContent(), board.getBoardNo());
	}
	
	@Override
	public void updateCodeBoard(Board board) {
		String sql = "update board set board_name=?,board_content=?,board_code=? where board_no=?";
		jdbcTemp.update(sql, board.getBoardName(), board.getBoardContent(),board.getBoardCode(), board.getBoardNo());
	}

	@Override
	public void deleteBoard(int boardNo) {
		String sql = "delete from board where board_no=?";
		jdbcTemp.update(sql, boardNo);
	}

	@Override
	public List<Board> getBoardByPage(int page,String boardCode) {
		String sql = "SELECT * FROM ("
				+ 		"SELECT sub.*, ROWNUM AS RNUM "
				+		"FROM ( select * from board where regexp_like(board_code,?) order by board_date desc) sub)"
				+ "WHERE RNUM >= ? AND RNUM <= ?";
		
		List<Board> board = jdbcTemp.query(sql, new BeanPropertyRowMapper<Board>(Board.class),boardCode,(page - 1) * BoardDao.BOARD_PER_PAGE + 1,page * BoardDao.BOARD_PER_PAGE);
		
		
		return board;
	}

	@Override
	public List<Board> selectRankAllBoard(String boardCode) {
		String sql = "select * from Board where regexp_like(board_code,?) order by board_hits desc";
		List<Board> board = jdbcTemp.query(sql, new BeanPropertyRowMapper<Board>(Board.class),boardCode);
		return board;
	}

	@Override
	public List<Board> getrankBoardByPage(int page,String boardCode) {
		String sql = "SELECT * FROM ("
				+ 		"SELECT sub.*, ROWNUM AS RNUM "
				+		"FROM ( select * from board where regexp_like(board_code,?) order by board_hits desc) sub)"
				+ "WHERE RNUM >= ? AND RNUM <= ?";
		 
		List<Board> board = jdbcTemp.query(sql, new BeanPropertyRowMapper<Board>(Board.class),boardCode,(page - 1) * BoardDao.BOARD_PER_PAGE + 1,page * BoardDao.BOARD_PER_PAGE);
		
		
		return board;
	}
	
	@Override
	public List<Board> selectRankrecomAllBoard(String boardCode) {
		String sql = "select b.*  from (select b.board_no, count(*) board_recom from board b,likes l group by b.board_no having b.board_no=l.board_no order by board_recom desc) a, board b where regexp_like(b.board_code,?) a.board_no=b.BOARD_NO";
		List<Board> board = jdbcTemp.query(sql, new BeanPropertyRowMapper<Board>(Board.class),boardCode);
		return board;
	}

	@Override
	public List<Board> getrankrecomBoardByPage(int page,String boardCode) {
		String sql = "SELECT * "
			+	"FROM (SELECT sub.*, ROWNUM AS RNUM "
				+	     " FROM (  select b.* from (select b.board_no, count(*) board_recom from board b,likes l group by b.board_no having b.board_no=l.board_no order by board_recom desc) a, board b where regexp_like(b.board_code,?) and a.board_no=b.BOARD_NO) sub)"
					+"WHERE RNUM >= ? AND RNUM <= ?";
		
		List<Board> board = jdbcTemp.query(sql, new BeanPropertyRowMapper<Board>(Board.class),boardCode,(page - 1) * BoardDao.BOARD_PER_PAGE + 1,page * BoardDao.BOARD_PER_PAGE);
		
		
		return board;
	}

	@Override
	public List<Board> selectAllAllBoard(String boardCode,String boardContent) {
		String sql = "select * from Board where (regexp_like(board_code,?) and (regexp_like(board_content,?) or regexp_like(board_name,?))) order by board_date desc";
		List<Board> board = jdbcTemp.query(sql, new BeanPropertyRowMapper<Board>(Board.class),boardCode,boardContent,boardContent);
		return board;
	}

	@Override
	public List<Board> getAllAllBoardByPage(int page,String boardCode, String boardContent) {
		String sql = "SELECT * FROM ("
				+ 		"SELECT sub.*, ROWNUM AS RNUM "
				+		"FROM ( select * from board where (regexp_like(board_code,?) and (regexp_like(board_content,?) or regexp_like(board_name,?))) order by board_date desc) sub)"
				+ "WHERE RNUM >= ? AND RNUM <= ?";
		
		List<Board> board = jdbcTemp.query(sql, new BeanPropertyRowMapper<Board>(Board.class),boardCode,boardContent,boardContent,(page - 1) * BoardDao.BOARD_PER_PAGE + 1,page * BoardDao.BOARD_PER_PAGE);
		
		
		return board;
	}

	@Override
	public int countBoard(String boardCode, String boardName) {
		String sql = "select count(*) from board where (regexp_like(board_code,?) and (regexp_like(board_name,?) or regexp_like(board_content,?)))";
		int count = jdbcTemp.queryForInt(sql,boardCode,boardName,boardName);
		return count;
	}

	

}
