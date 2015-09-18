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
	private String usersAddress;
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
			String usersEmail, String usersAddress, Date usersBirth, String usersPassques) {
		super();
		this.usersName = usersName;
		this.usersId = usersId;
		this.usersPassword = usersPassword;
		this.usersGender = usersGender;
		this.usersPhone = usersPhone;
		this.usersEmail = usersEmail;
		this.usersAddress = usersAddress;
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



	public String getUsersAddress() {
		return usersAddress;
	}



	public void setUsersAddress(String usersAddress) {
		this.usersAddress = usersAddress;
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
				+ ", usersAddress=" + usersAddress + ", usersBirth=" + usersBirth + ", usersPassques=" + usersPassques
				+ "]";
	}





	
}
