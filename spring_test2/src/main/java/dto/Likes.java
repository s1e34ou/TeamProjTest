package dto;

public class Likes {
	private Integer likesNo;
	private String usersId;
	private Integer boardNo;
	private Integer likes;
	private Integer photoNo;
	
	
	
	public Likes(Integer likesNo, String usersId, Integer boardNo, Integer likes, Integer photoNo) {
		super();
		this.likesNo = likesNo;
		this.usersId = usersId;
		this.boardNo = boardNo;
		this.likes = likes;
		this.photoNo = photoNo;
	}
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
	public String getUsersId() {
		return usersId;
	}
	public void setUsersId(String usersId) {
		this.usersId = usersId;
	}
	public Integer getPhotoNo() {
		return photoNo;
	}
	public void setPhotoNo(Integer photoNo) {
		this.photoNo = photoNo;
	}
	@Override
	public String toString() {
		return "Likes [likesNo=" + likesNo + ", usersId=" + usersId + ", boardNo=" + boardNo + ", likes=" + likes
				+ ", photoNo=" + photoNo + "]";
	}

	
	
}
