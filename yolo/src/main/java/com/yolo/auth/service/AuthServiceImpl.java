package com.yolo.auth.service;

import com.yolo.auth.biz.AuthBiz;
import com.yolo.auth.vo.AuthVO;
import com.yolo.common.utilities.SHA256Util;

public class AuthServiceImpl implements AuthService{
	
	private AuthBiz authBiz;
	
	public void setAuthBiz(AuthBiz authBiz) {
		this.authBiz = authBiz;
	}

	@Override
	public boolean insertOneAuth(AuthVO authVO) {
		
		String salt = SHA256Util.generateSalt();
		authVO.setSalt(salt);
		
		String password = authVO.getAuthPw();
		password = SHA256Util.getEncrypt(password, salt);
		authVO.setAuthPw(password);
		
		// Admin defult value.
		authVO.setAuthId("ADMIN");
		
		return authBiz.insertOneAuth(authVO);
	}

	@Override
	public boolean modifyOneAuth(AuthVO authVO) {
		return false;
	}

	@Override
	public AuthVO selectOneAuth(AuthVO authVO) {
		return null;
	}

	@Override
	public String getSalt(String authId) {
		return null;
	}

}
