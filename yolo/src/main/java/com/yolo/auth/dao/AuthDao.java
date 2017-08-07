package com.yolo.auth.dao;

import com.yolo.auth.vo.AuthVO;

public interface AuthDao {
	
	public static final String AD = "AuthDao";
	
	public int insertNewAuth(AuthVO  authVO);
	
	public int modifyOneAuth(AuthVO authVO);
	
	public AuthVO selectOneAuth(AuthVO authVO);
	
	public String getSaltById(String userId);
	
	
	
	
	

}
