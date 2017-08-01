package com.yolo.user.vo;

public class NaverUserVO extends UserVO {

	private String accessToken;
	private String naverId;
	private String naverName;

	public String getNaverId() {
		return naverId;
	}

	public void setNaverId(String naverId) {
		this.naverId = naverId;
	}

	public String getNaverName() {
		return naverName;
	}

	public void setNaverName(String naverName) {
		this.naverName = naverName;
	}

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

}
