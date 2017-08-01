package com.yolo.userapi.biz;

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
}
