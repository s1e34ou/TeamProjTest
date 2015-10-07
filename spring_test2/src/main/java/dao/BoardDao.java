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
	
	public List<Board> selectRankAllBoard(String boardCode);

	public List<Board> getrankBoardByPage(int page, String boardCode);
	
	public List<Board> selectAllAllBoard(String boardContent);
	
	public List<Board> getAllAllBoardByPage(int page,String boardContent);
	
	
}
