package com.yolo.userapi.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.yolo.user.vo.UserVO;

public class UserApiDaoImpl extends SqlSessionDaoSupport implements UserApiDao{

	@Override
	public int userApiInsert(UserVO userVO) {
		return getSqlSession().insert("UserApiDao.userApiInsert", userVO);
	}

	@Override
	public List<UserVO> selectAllUserApi(String type) {
		return getSqlSession().selectList("UserApiDao.selectAllUserApi", type);
	}

	@Override
	public int updateUserId(UserVO userVO) {
		return getSqlSession().update("UserApiDao.updateUserId", userVO);
	}

	@Override
	public UserVO selectOneUser(String userId) {
		return getSqlSession().selectOne("UserApiDao.selectOneUser", userId);
	}

}
