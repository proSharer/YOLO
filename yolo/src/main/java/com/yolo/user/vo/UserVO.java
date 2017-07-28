package com.yolo.user.vo;

public class UserVO {

	// SNS 상태 설정
	public static final String DEFAULT = "";
	public static final String NAVER = "nvr";
	public static final String KAKAO = "kko";
	public static final String GOOGLE = "ggl";

	private String loginType;

	// @NotEmpty(message="아이디를 입력하세요.")
	private String userId;
	// @NotEmpty(message="이름을 입력하세요.")
	private String userName;
	// @NotEmpty(message="비밀번호를 입력하세요.")
	private String password;
	private String joinDate;
	private String authId;
	private String extraApiEmail;

	private String salt;
	

	public String getExtraApiEmail() {
		return extraApiEmail;
	}

	public void setExtraApiEmail(String extraApiEmail) {
		this.extraApiEmail = extraApiEmail;
	}

	public String getLoginType() {
		return loginType;
	}

	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}

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
