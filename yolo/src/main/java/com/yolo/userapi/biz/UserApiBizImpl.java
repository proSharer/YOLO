package com.yolo.userapi.biz;

import java.util.List;

import com.yolo.user.vo.UserVO;
import com.yolo.userapi.dao.UserApiDao;

public class UserApiBizImpl implements UserApiBiz{

	private UserApiDao userApiDao;
	
	public void setUserApiDao(UserApiDao userApiDao) {
		this.userApiDao = userApiDao;
	}

	@Override
	public boolean addUserApi(UserVO userVO) {
		return userApiDao.userApiInsert(userVO) > 0;
	}

	@Override
	public List<UserVO> selectAllUser(String type) {
		return userApiDao.selectAllUserApi(type);
	}

	@Override
	public boolean setUserId(UserVO userVO) {
		return userApiDao.updateUserId(userVO) > 0;
	}

	@Override
	public UserVO getOneUser(String userId) {
		return userApiDao.selectOneUser(userId);
	}
}
