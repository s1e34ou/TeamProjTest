package dto;

import java.util.Date;

public class Reply {
	private Integer replyNo;
	private String replyContent;
	private Date replyDate;
	private String usersUsersId;
	private Integer boardBoardNo;
	private Integer photoPhotoNo;
	


	public Reply() {
		super();
	}

	


	public Reply(Integer replyNo, String replyContent) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
	}




	public Reply(String replyContent, String usersUsersId, Integer boardBoardNo, Integer photoPhotoNo) {
		super();
		this.replyContent = replyContent;
		this.usersUsersId = usersUsersId;
		this.boardBoardNo = boardBoardNo;
		this.photoPhotoNo = photoPhotoNo;
	}




	public Reply(Integer replyNo, String replyContent, Date replyDate, String usersUsersId, Integer boardBoardNo,
			Integer photoPhotoNo) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
		this.usersUsersId = usersUsersId;
		this.boardBoardNo = boardBoardNo;
		this.photoPhotoNo = photoPhotoNo;
	}


	public Integer getReplyNo() {
		return replyNo;
	}


	public void setReplyNo(Integer replyNo) {
		this.replyNo = replyNo;
	}


	public String getReplyContent() {
		return replyContent;
	}


	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}


	public Date getReplyDate() {
		return replyDate;
	}


	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}


	public String getUsersUsersId() {
		return usersUsersId;
	}


	public void setUsersUsersId(String usersUsersId) {
		this.usersUsersId = usersUsersId;
	}


	public Integer getBoardBoardNo() {
		return boardBoardNo;
	}


	public void setBoardBoardNo(Integer boardBoardNo) {
		this.boardBoardNo = boardBoardNo;
	}


	public Integer getPhotoPhotoNo() {
		return photoPhotoNo;
	}


	public void setPhotoPhotoNo(Integer photoPhotoNo) {
		this.photoPhotoNo = photoPhotoNo;
	}


	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", replyDate=" + replyDate
				+ ", usersUsersId=" + usersUsersId + ", boardBoardNo=" + boardBoardNo + ", photoPhotoNo=" + photoPhotoNo
				+ "]";
	}


	
	
}
