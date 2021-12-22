package com.nft.user;

/**
 * @Author : 정승헌
 * @Date : 2021. 12. 20.
 * @Version : 2.0
 * @Description : uNo 셍성자/메소드 추가선언
 * 
 */

public class UserBean {
	// 필드
	private int uNo; 
	private String uName;
	private String uId;
	private String uPw;
	private String uEmail;
	private String uPhone;
	private String uSubDate;
	private String uGender;
	private int uGrade = 1;
	
	// 생성자
	public UserBean() {}
	
	public UserBean(String uName, String uId, String uPw, String uEmail, 
					String uPhone, String uSubDate, String uGender, int uGrade) {
		super();
		this.uName = uName;
		this.uId = uId;
		this.uPw = uPw;
		this.uEmail = uEmail;
		this.uPhone = uPhone;
		this.uSubDate = uSubDate;
		this.uGender = uGender;
	}
	
	// 메소드
	public int getuNo() {
		return uNo;
	}

	public void setuNo(int uNo) {
		this.uNo = uNo;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public String getuPw() {
		return uPw;
	}

	public void setuPw(String uPw) {
		this.uPw = uPw;
	}

	public String getuEmail() {
		return uEmail;
	}

	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}

	public String getuPhone() {
		return uPhone;
	}

	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}

	public String getuSubDate() {
		return uSubDate;
	}

	public void setuSubDate(String uSubDate) {
		this.uSubDate = uSubDate;
	}

	public String getuGender() {
		return uGender;
	}

	public void setuGender(String uGender) {
		this.uGender = uGender;
	}

	public int getuGrade() {
		return uGrade;
	}

	public void setuGrade(int uGrade) {
		this.uGrade = uGrade;
	}
}

