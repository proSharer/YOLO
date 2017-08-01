package com.yolo.userapi.service;

import com.yolo.user.vo.UserVO;
import com.yolo.userapi.biz.UserApiBiz;

public class UserApiServiceImpl implements UserApiService{

	private UserApiBiz userApiBiz;
	
	public void setUserApiBiz(UserApiBiz userApiBiz) {
		this.userApiBiz = userApiBiz;
	}

	@Override
	public boolean addUserApi(UserVO userVO) {
		return userApiBiz.addUserApi(userVO);
	}
	
}
