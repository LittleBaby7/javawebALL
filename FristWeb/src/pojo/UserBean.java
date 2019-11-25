package pojo;

public class UserBean {
	private String userid;
	private String password;
	private String userName;
	private String phoneNumber;
	private String usertype;
	public UserBean() {}
	public UserBean(String userid,String password) {
		this.setUserid(userid);
		this.setPassword(password);
	}
	public UserBean(String userid, String password, String userName, String phoneNumber) {
		super();
		this.userid = userid;
		this.password = password;
		this.userName = userName;
		this.phoneNumber = phoneNumber;
	}
	public UserBean(String userid, String password, String userName, String phoneNumber, String usertype) {
		super();
		this.userid = userid;
		this.password = password;
		this.userName = userName;
		this.phoneNumber = phoneNumber;
		this.setUsertype(usertype);
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String stuid) {
		this.userid = stuid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	
	
}
