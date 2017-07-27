package com.yolo.user.service;

import java.util.List;

import com.yolo.user.vo.UserVO;

public interface UserService {
	
	public boolean insertOneUser(UserVO userVO);
	
	public UserVO selectOneUser(UserVO userVO);
	
	public boolean modifyOneUser(UserVO userVO);
	
	public UserVO findUserById(String userId);
	
}
