package com.yolo.userapi.service;

import java.util.List;

import com.yolo.user.vo.UserVO;

public interface UserApiService {

	public boolean addUserApi(UserVO userVO);
	
	public List<UserVO> selectAllUser(String type);
	
	public boolean setUserId(UserVO userVO);
	
	public UserVO getOneUser(String userId);
}
