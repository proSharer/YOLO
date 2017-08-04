package com.yolo.auth.biz;

import com.yolo.auth.vo.AuthVO;

public interface AuthBiz {
	
	public boolean insertOneAuth(AuthVO authVO);
	
	public boolean modifyOneAuth(AuthVO authVO);
	
	public AuthVO selectOneAuth(AuthVO authVO);
	
	public String getSalt(String authId);

}
