package com.yolo.auth.vo;

public class AuthVO {

	private String authId;
	private String authNm;
	private String authPw;
	private String salt;
	private String joinDate;

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getAuthNm() {
		return authNm;
	}

	public void setAuthNm(String authNm) {
		this.authNm = authNm;
	}

	public String getAuthId() {
		return authId;
	}

	public void setAuthId(String authId) {
		this.authId = authId;
	}

	public String getAuthPw() {
		return authPw;
	}

	public void setAuthPw(String authPw) {
		this.authPw = authPw;
	}

}
