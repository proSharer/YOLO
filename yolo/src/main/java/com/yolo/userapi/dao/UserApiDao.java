package com.yolo.userapi.dao;

import java.util.List;

import com.yolo.user.vo.UserVO;

public interface UserApiDao {

	public int userApiInsert(UserVO userVO);
	
	public List<UserVO> selectAllUserApi(String type);
	
	public int updateUserId(UserVO userVO);
	
	public UserVO selectOneUser(String userId);
}
