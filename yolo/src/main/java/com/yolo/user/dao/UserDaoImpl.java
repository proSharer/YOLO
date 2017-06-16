package com.yolo.user.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.yolo.user.vo.UserVO;

public class UserDaoImpl extends SqlSessionDaoSupport implements UserDao {

	@Override
	public int insertNewUser(UserVO userVO) {
		return getSqlSession().insert( UD +".insertNewUser", userVO);
	}

	@Override
	public UserVO selectOneUser(UserVO userVO) {
		return getSqlSession().selectOne( UD +".selectOneUser", userVO);
	}

	@Override
	public String getSaltById(String userId) {
		return getSqlSession().selectOne( UD +".getSaltById", userId);
	}

	@Override
	public int plusLoginFailCount(String userId) {
		return getSqlSession().update(UD +".plusLoginFailCount", userId);
	}

	@Override
	public int updateLockStatus(String userId) {
		return getSqlSession().update(UD + ".updateLockStatus", userId) ;
	}

	@Override
	public int selectLockStatus(String userId) {
		return getSqlSession().update( UD + ".selectLockStatus", userId);
	}

	@Override
	public int updateClearLoginFailCount(String userId) {
		return getSqlSession().update( UD + ".updateClearLoginFailCount", userId);
	}

	@Override
	public int updateClearLockCount(String userId) {
		return getSqlSession().update( UD + ".updateClearLockCount", userId);
	}

}
