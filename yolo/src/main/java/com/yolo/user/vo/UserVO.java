package com.yolo.user.vo;

import org.hibernate.validator.constraints.NotEmpty;

public class UserVO {

	// SNS 상태 설정
	private static String DEFAULT = "";
	private static String NAVER = "NVR";
	private static String KAKAO = "KKO";

	private String loginType;

	// @NotEmpty(message="아이디를 입력하세요.")
	private String userId;
	// @NotEmpty(message="이름을 입력하세요.")
	private String userName;
	// @NotEmpty(message="비밀번호를 입력하세요.")
	private String password;
	private String joinDate;
	private String authId;

	private String salt;

	public static String getDefault() {
		return DEFAULT;
	}

	public static void setDefault(String default1) {
		DEFAULT = default1;
	}

	public static String getNaver() {
		return NAVER;
	}

	public static void setNaver(String naver) {
		NAVER = naver;
	}

	public static String getKakao() {
		return KAKAO;
	}

	public static void setKakao(String kakao) {
		KAKAO = kakao;
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
