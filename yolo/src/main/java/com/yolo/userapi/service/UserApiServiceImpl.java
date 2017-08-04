package com.yolo.userapi.service;

import java.util.List;

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

	@Override
	public List<UserVO> selectAllUser(String type) {
		return userApiBiz.selectAllUser(type);
	}

	@Override
	public boolean setUserId(UserVO userVO) {
		return userApiBiz.setUserId(userVO);
	}

	@Override
	public UserVO getOneUser(String userId) {
		return userApiBiz.getOneUser(userId);
	}
	
}
