package dao;

import java.util.List;

import dto.Board;

public interface BoardDao {
	int BOARD_PER_PAGE = 3;

	public List<Board> selectAllBoard();

	public void insertBoard(Board board);

	public Board selectBoard(int boardNo);

	public void updateBoard(Board board);

	public void deleteBoard(int boardNo);

	public List<Board> getBoardByPage(int page);
}
