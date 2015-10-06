package dao;

import java.util.List;

import dto.Board;

public interface BoardDao {
	int BOARD_PER_PAGE = 10;

	public List<Board> selectAllBoard(String boardCode);

	public void insertBoard(Board board);

	public Board selectBoard(int boardNo);

	public void updateBoard(Board board);

	public void deleteBoard(int boardNo);

	public List<Board> getBoardByPage(int page,String boardCode);
	
	public void updateCodeBoard(Board board);
}
