package com.yolo.userapi.biz;

import java.util.List;

import com.yolo.user.vo.UserVO;

public interface UserApiBiz {

	public boolean addUserApi(UserVO userVO);
	
	public List<UserVO> selectAllUser(String type);
	
	public boolean setUserId(UserVO userVO);
	
	public UserVO getOneUser(String userId);
}
