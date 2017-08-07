package com.yolo.auth.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.yolo.auth.vo.AuthVO;

public class AuthDaoImpl extends SqlSessionDaoSupport implements AuthDao{

	@Override
	public int insertNewAuth(AuthVO authVO) {
		return getSqlSession().insert("AuthDao.insertNewAuth", authVO);
	}

	@Override
	public int modifyOneAuth(AuthVO authVO) {
		return getSqlSession().update(AD + ".modifyOneAuth", authVO);
	}

	@Override
	public AuthVO selectOneAuth(AuthVO authVO) {
		return getSqlSession().selectOne(AD + ".selectOneAuth", authVO);
	}

	@Override
	public String getSaltById(String authVO) {
		return getSqlSession().selectOne(AD + ".getSaltById", authVO);
	}

}
