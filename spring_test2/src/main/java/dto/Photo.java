package dto;

import java.util.Date;

public class Photo {
	private Integer photoNo;
	private String photoName;
	private String photoContent;
	private Date photoDate;
	private Integer photoHits;
	private String photoImage;
	private String usersUsersId;
	private Integer replyCount;
	
	
	
	
	public Photo(Integer photoNo, String photoName, String photoContent, Date photoDate, Integer photoHits,
			String photoImage, String usersUsersId, Integer replyCount) {
		super();
		this.photoNo = photoNo;
		this.photoName = photoName;
		this.photoContent = photoContent;
		this.photoDate = photoDate;
		this.photoHits = photoHits;
		this.photoImage = photoImage;
		this.usersUsersId = usersUsersId;
		this.replyCount = replyCount;
	}

	public Integer getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(Integer replyCount) {
		this.replyCount = replyCount;
	}

	public Photo() {
		super();
	}
	
	public Photo(Integer photoNo, String photoName, String photoContent) {
		super();
		this.photoNo = photoNo;
		this.photoName = photoName;
		this.photoContent = photoContent;
	}

	public Photo(String photoName, String photoContent, String photoImage, String usersUsersId) {
		super();
		this.photoName = photoName;
		this.photoContent = photoContent;
		this.photoImage = photoImage;
		this.usersUsersId = usersUsersId;
	}



	


	public Integer getPhotoNo() {
		return photoNo;
	}




	public void setPhotoNo(Integer photoNo) {
		this.photoNo = photoNo;
	}




	public String getPhotoName() {
		return photoName;
	}




	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}




	public String getPhotoContent() {
		return photoContent;
	}




	public void setPhotoContent(String photoContent) {
		this.photoContent = photoContent;
	}




	public Date getPhotoDate() {
		return photoDate;
	}




	public void setPhotoDate(Date photoDate) {
		this.photoDate = photoDate;
	}




	public Integer getPhotoHits() {
		return photoHits;
	}




	public void setPhotoHits(Integer photoHits) {
		this.photoHits = photoHits;
	}




	public String getPhotoImage() {
		return photoImage;
	}




	public void setPhotoImage(String photoImage) {
		this.photoImage = photoImage;
	}




	public String getUsersUsersId() {
		return usersUsersId;
	}




	public void setUsersUsersId(String usersUsersId) {
		this.usersUsersId = usersUsersId;
	}

	@Override
	public String toString() {
		return "Photo [photoNo=" + photoNo + ", photoName=" + photoName + ", photoContent=" + photoContent
				+ ", photoDate=" + photoDate + ", photoHits=" + photoHits + ", photoImage=" + photoImage
				+ ", usersUsersId=" + usersUsersId + ", replyCount=" + replyCount + "]";
	}





	
	
	
}
