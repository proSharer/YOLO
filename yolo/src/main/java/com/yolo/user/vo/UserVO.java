package com.yolo.user.vo;

import org.hibernate.validator.constraints.NotEmpty;

public class UserVO {
	
	@NotEmpty(message="아이디를 입력하세요.")
	private String userId;
	@NotEmpty(message="이름을 입력하세요.")
	private String userName;
	@NotEmpty(message="비밀번호를 입력하세요.")
	private String password;
	private String joinDate;
	private String authId;

	private String salt;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public String getAuthId() {
		return authId;
	}

	public void setAuthId(String authId) {
		this.authId = authId;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

}
