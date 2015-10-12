package dto;

public class Likes {
	private Integer likesNo;
	private String usersId;
	private Integer boardNo;
	private Integer likes;
	
	
	public Likes(Integer likesNo, String usersId, Integer boardNo, Integer likes) {
		super();
		this.likesNo = likesNo;
		this.usersId = usersId;
		this.boardNo = boardNo;
		this.likes = likes;
	}
	public Likes() {
		super();
	}
	public Likes(String userId, Integer boardNo, Integer likes) {
		super();
		this.usersId = userId;
		this.boardNo = boardNo;
		this.likes = likes;
	}
	public Integer getLikesNo() {
		return likesNo;
	}
	public void setLikesNo(Integer likesNo) {
		this.likesNo = likesNo;
	}
	public String getUserId() {
		return usersId;
	}
	public void setUserId(String userId) {
		this.usersId = userId;
	}
	public Integer getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(Integer boardNo) {
		this.boardNo = boardNo;
	}
	public Integer getLikes() {
		return likes;
	}
	public void setLikes(Integer likes) {
		this.likes = likes;
	}
	@Override
	public String toString() {
		return "Likes [likesNo=" + likesNo + ", userId=" + usersId + ", boardNo=" + boardNo + ", likes=" + likes + "]";
	}

	
	
}
