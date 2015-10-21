package service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.BoardDao;
import dao.ReplyDao;
import dto.Board;

@Service
public class BoardServiceImpl implements BoardService {
	private static Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);

	@Autowired
	BoardDao dao;
	@Autowired
	ReplyDao rdao;
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
	public void updateCodeboard(Board board) {
		dao.updateCodeBoard(board);

	}

	@Override
	@Transactional
	public void deleteboard(int boardNo) {
		rdao.deleteReplyByBoardNo(boardNo);
		dao.deleteBoard(boardNo);

	}

	@Override
	public Board selectboard(int boardNo) {
		Board board = dao.selectBoard(boardNo);
		return board;
	}
	

	@Override
	public List<Board> getBoardByPage(int page,String boardCode) {
		List<Board> boards = dao.getBoardByPage(page,boardCode);
		
		return boards;
	}

	@Override
	public List<Board> getAllBoard(String boardCode) {
		List<Board> boards = dao.selectAllBoard(boardCode);
		return boards;
	}

	@Override
	public List<Board> getRankAllBoard(String boardCode) {
		List<Board> boards = dao.selectRankAllBoard(boardCode);
		return boards;
	}

	@Override
	public List<Board> getRankBoardByPage(int page, String boardCode) {
		List<Board> boards = dao.getrankBoardByPage(page, boardCode);
		
		return boards;
	}
	
	@Override
	public List<Board> getRankrecomAllBoard(String boardCode) {
		List<Board> boards = dao.selectRankrecomAllBoard(boardCode);
		return boards;
	}

	@Override
	public List<Board> getRankrecomBoardByPage(int page, String boardCode) {
		List<Board> boards = dao.getrankrecomBoardByPage(page, boardCode);
		
		return boards;
	}

	@Override
	public List<Board> getAllAllBoard(String boardCode,String boardContent) {
		List<Board> boards = dao.selectAllAllBoard(boardCode, boardContent);
		return boards;
	}

	@Override
	public List<Board> gettAllAllBoardByPage(int page,String boardCode, String boardContent) {
		List<Board> boards = dao.getAllAllBoardByPage(page,boardCode, boardContent);
		return boards;
	}

	@Override
	public int countboard(String boardCode,String boardName) {
		int count = dao.countBoard(boardCode,boardName);
		return count;
		
	}

	

}
