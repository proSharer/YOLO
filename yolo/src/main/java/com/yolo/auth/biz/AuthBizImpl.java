package com.yolo.auth.biz;

import com.yolo.auth.dao.AuthDao;
import com.yolo.auth.vo.AuthVO;

public class AuthBizImpl implements AuthBiz{
	
	private AuthDao authDao;
	
	public void setAuthDao(AuthDao authDao) {
		this.authDao = authDao;
	}

	@Override
	public boolean insertOneAuth(AuthVO authVO) {
		return authDao.insertNewAuth(authVO) > 0;
	}

	@Override
	public boolean modifyOneAuth(AuthVO authVO) {
		return authDao.modifyOneAuth(authVO) > 0;
	}

	@Override
	public AuthVO selectOneAuth(AuthVO authVO) {
		return authDao.selectOneAuth(authVO);
	}

	@Override
	public String getSalt(String authId) {
		return authDao.getSaltById(authId);
	}

}
