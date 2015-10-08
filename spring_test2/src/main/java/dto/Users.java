package dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class Users {
	private String usersName;
	private String usersId;
	private String usersPassword;
	private String usersGender;
	private String usersPhone;
	private String usersEmail;
	private String usersAddress1;
	private String usersAddress2;
	private String usersAddress3;
	@DateTimeFormat(iso=ISO.DATE)
	private Date usersBirth ;
	private String usersPassques;
	
	
	
	public Users() {
		super();
	}

	public Users(String usersId, String usersPassword) {
		super();
		this.usersId = usersId;
		this.usersPassword = usersPassword;
	}



	public Users(String usersName, String usersId, String usersPassword) {
		super();
		this.usersName = usersName;
		this.usersId = usersId;
		this.usersPassword = usersPassword;
	}



	



	public Users(String usersName, String usersId, String usersPassword, String usersGender, String usersPhone,
			String usersEmail, String usersAddress1, String usersAddress2, String usersAddress3, Date usersBirth,
			String usersPassques) {
		super();
		this.usersName = usersName;
		this.usersId = usersId;
		this.usersPassword = usersPassword;
		this.usersGender = usersGender;
		this.usersPhone = usersPhone;
		this.usersEmail = usersEmail;
		this.usersAddress1 = usersAddress1;
		this.usersAddress2 = usersAddress2;
		this.usersAddress3 = usersAddress3;
		this.usersBirth = usersBirth;
		this.usersPassques = usersPassques;
	}

	public String getUsersName() {
		return usersName;
	}



	public void setUsersName(String usersName) {
		this.usersName = usersName;
	}



	public String getUsersId() {
		return usersId;
	}



	public void setUsersId(String usersId) {
		this.usersId = usersId;
	}



	public String getUsersPassword() {
		return usersPassword;
	}



	public void setUsersPassword(String usersPassword) {
		this.usersPassword = usersPassword;
	}



	public String getUsersGender() {
		return usersGender;
	}



	public void setUsersGender(String usersGender) {
		this.usersGender = usersGender;
	}



	public String getUsersPhone() {
		return usersPhone;
	}



	public void setUsersPhone(String usersPhone) {
		this.usersPhone = usersPhone;
	}



	public String getUsersEmail() {
		return usersEmail;
	}



	public void setUsersEmail(String usersEmail) {
		this.usersEmail = usersEmail;
	}






	public Date getUsersBirth() {
		return usersBirth;
	}



	public void setUsersBirth(Date usersBirth) {
		this.usersBirth = usersBirth;
	}



	public String getUsersPassques() {
		return usersPassques;
	}



	public void setUsersPassques(String usersPassques) {
		this.usersPassques = usersPassques;
	}

	@Override
	public String toString() {
		return "Users [usersName=" + usersName + ", usersId=" + usersId + ", usersPassword=" + usersPassword
				+ ", usersGender=" + usersGender + ", usersPhone=" + usersPhone + ", usersEmail=" + usersEmail
				+ ", usersAddress1=" + usersAddress1 + ", usersAddress2=" + usersAddress2 + ", usersAddress3="
				+ usersAddress3 + ", usersBirth=" + usersBirth + ", usersPassques=" + usersPassques + "]";
	}

	public String getUsersAddress1() {
		return usersAddress1;
	}

	public void setUsersAddress1(String usersAddress1) {
		this.usersAddress1 = usersAddress1;
	}

	public String getUsersAddress2() {
		return usersAddress2;
	}

	public void setUsersAddress2(String usersAddress2) {
		this.usersAddress2 = usersAddress2;
	}

	public String getUsersAddress3() {
		return usersAddress3;
	}

	public void setUsersAddress3(String usersAddress3) {
		this.usersAddress3 = usersAddress3;
	}



	




	
}
