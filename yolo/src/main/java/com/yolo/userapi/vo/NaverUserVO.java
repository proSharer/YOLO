package com.yolo.userapi.vo;

import com.yolo.user.vo.UserVO;

public class NaverUserVO extends UserVO {

	private String accessToken;

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

}
