package com.yolo.user.biz;

import java.util.List;

import com.yolo.user.dao.UserDao;
import com.yolo.user.vo.UserVO;

public class UserBizImpl implements UserBiz{
	
	private UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	@Override
	public boolean modifyOneUser(UserVO userVO) {
		return userDao.modifyOneUser(userVO) > 0;
	}

	@Override
	public boolean insertOneUser(UserVO userVO) {
		return userDao.insertNewUser(userVO) > 0;
	}

	@Override
	public UserVO selectOneUser(UserVO userVO) {
		return userDao.selectOneUser(userVO);
	}

	@Override
	public String getSalt(String userId) {
		return userDao.getSaltById(userId);
	}

	@Override
	public boolean plusLoginFailCount(String userId) {
		return userDao.plusLoginFailCount(userId) > 0;
	}

	@Override
	public boolean updateRockStatus(String userId) {
		return userDao.updateLockStatus(userId) > 0;
	}

	@Override
	public boolean selectRockStatus(String userId) {
		return userDao.selectLockStatus(userId) > 0;
	}

	@Override
	public boolean updateClearLoginFailCount(String userId) {
		return userDao.updateClearLoginFailCount(userId) > 0;
	}

	@Override
	public boolean updateClearRockCount(String userId) {
		return userDao.updateClearLockCount(userId) > 0;
	}

	@Override
	public UserVO findUserById(String userId) {
		return userDao.findUserById(userId);
	}

	

}
