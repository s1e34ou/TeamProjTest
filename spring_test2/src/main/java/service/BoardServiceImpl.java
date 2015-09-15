package service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.BoardDao;
import dto.Board;

@Service
public class BoardServiceImpl implements BoardService {
	private static Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);

	@Autowired
	BoardDao dao;

	@Override
	@Transactional
	public void writeboard(Board board) {
		dao.insertBoard(board);

	}

	@Override
	@Transactional
	public void updateboard(Board board) {
		dao.updateBoard(board);

	}

	@Override
	@Transactional
	public void deleteboard(int boardNo) {
		dao.deleteBoard(boardNo);

	}

	@Override
	public Board selectboard(int boardNo) {
		Board board = dao.selectBoard(boardNo);
		return board;
	}

	@Override
	public List<Board> getBoardByPage(int page) {
		List<Board> boards = dao.getBoardByPage(page);
		return boards;
	}

	@Override
	public List<Board> getAllBoard() {
		List<Board> boards = dao.selectAllBoard();
		return boards;
	}

}
