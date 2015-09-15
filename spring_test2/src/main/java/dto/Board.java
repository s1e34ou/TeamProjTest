package dto;

import java.util.Date;

public class Board {
	private Integer boardNo;
	private String boardName;
	private String boardContent;
	private Date boardDate;
	private Integer boardHits;
	private String boardCode;
	private String usersUsersId;
	
	public Board() {
		super();
	}

	public Board(Integer boardNo, String boardName, String boardContent) {
		super();
		this.boardNo = boardNo;
		this.boardName = boardName;
		this.boardContent = boardContent;
	}

	public Board(String boardName, String boardContent, String boardCode, String usersUsersId) {
		super();
		this.boardName = boardName;
		this.boardContent = boardContent;
		this.boardCode = boardCode;
		this.usersUsersId = usersUsersId;
	}

	public Board(Integer boardNo, String boardName, String boardContent, Date boardDate, Integer boardHits,
			String boardCode, String usersUsersId) {
		super();
		this.boardNo = boardNo;
		this.boardName = boardName;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
		this.boardHits = boardHits;
		this.boardCode = boardCode;
		this.usersUsersId = usersUsersId;
	}

	public Integer getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(Integer boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	public Integer getBoardHits() {
		return boardHits;
	}

	public void setBoardHits(Integer boardHits) {
		this.boardHits = boardHits;
	}

	public String getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}

	public String getUsersUsersId() {
		return usersUsersId;
	}

	public void setUsersUsersId(String usersUsersId) {
		this.usersUsersId = usersUsersId;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardName=" + boardName + ", boardContent=" + boardContent
				+ ", boardDate=" + boardDate + ", boardHits=" + boardHits + ", boardCode=" + boardCode
				+ ", usersUsersId=" + usersUsersId + "]";
	}

	
		
	
}
