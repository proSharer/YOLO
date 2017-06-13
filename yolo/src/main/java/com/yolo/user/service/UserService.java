package com.yolo.user.service;

import com.yolo.user.vo.UserVO;

public interface UserService {
	
	public boolean insertOneUser(UserVO userVO);
	
	public UserVO selectOneUser(UserVO userVO);
	
}
