package com.yolo.user.service;

import com.yolo.user.biz.UserBiz;
import com.yolo.user.dao.UserDao;
import com.yolo.user.vo.UserVO;

import java.util.List;

import com.yolo.common.utilities.SHA256Util;

public class UserServiceImpl implements UserService {

	private UserBiz userBiz;
	private UserDao userDao;

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public boolean insertOneUser(UserVO userVO) {

		String salt = SHA256Util.generateSalt();
		userVO.setSalt(salt);

		String password = userVO.getPassword();
		password = SHA256Util.getEncrypt(password, salt);
		userVO.setPassword(password);

		userVO.setAuthId("USR");

		return userBiz.insertOneUser(userVO);
	}
	
	@Override
	public boolean modifyOneUser(UserVO userVO) {
		return userBiz.modifyOneUser(userVO);
	}

	@Override
	public UserVO selectOneUser(UserVO userVO) {

		if (userBiz.selectRockStatus(userVO.getUserId())) {
			return null;
		}
		
		userBiz.updateClearLoginFailCount(userVO.getUserId());
		
		String salt = userBiz.getSalt(userVO.getUserId());
		
		String password = userVO.getPassword();
		password = SHA256Util.getEncrypt(password, salt);
		userVO.setPassword(password);
		
		UserVO user = userBiz.selectOneUser(userVO);

		if (user != null) {
			userBiz.updateClearRockCount(userVO.getUserId());
		} else {
			userBiz.plusLoginFailCount(userVO.getUserId());
			userBiz.updateRockStatus(userVO.getUserId());
		}

		return user;
	}

	@Override
	public UserVO findUserById(String userId) {
		return userBiz.findUserById(userId);
	}

}
