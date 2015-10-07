package service;

import java.util.List;

import dto.Board;

public interface BoardService {
	void writeboard(Board board);

	void updateboard(Board board);
	
	void updateCodeboard(Board board);

	void deleteboard(int boardNo);

	Board selectboard(int boardNo);

	List<Board> getBoardByPage(int page,String boardCode);

	List<Board> getAllBoard(String boardCode);
	
	List<Board> getRankAllBoard(String boardCode);
	
	List<Board> getRankBoardByPage(int page,String boardCode);
}
