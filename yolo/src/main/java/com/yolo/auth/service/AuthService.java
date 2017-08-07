package com.yolo.auth.service;

import com.yolo.auth.vo.AuthVO;

public interface AuthService {
	
public boolean insertOneAuth(AuthVO authVO);
	
	public boolean modifyOneAuth(AuthVO authVO);
	
	public AuthVO selectOneAuth(AuthVO authVO);
	
	public String getSalt(String authId);

}
