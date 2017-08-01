package com.yolo.userapi.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.yolo.user.vo.UserVO;

public class UserApiDaoImpl extends SqlSessionDaoSupport implements UserApiDao{

	@Override
	public int userApiInsert(UserVO userVO) {
		return getSqlSession().insert("UserApiDao.UserApiInsert", userVO);
	}

}
