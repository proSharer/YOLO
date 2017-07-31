package com.yolo.user.dao;

import java.util.List;

import com.yolo.user.vo.UserVO;

public interface UserDao {
	
	public static final String UD = "UserDao";
	
	public int insertNewUser(UserVO userVO);
	
	public UserVO selectOneUser(UserVO userVO);
	
	public String getSaltById(String userId);
	
	public int plusLoginFailCount(String userId);
	
	public int updateLockStatus(String userId);
	
	public int selectLockStatus(String userId);
	
	public int updateClearLoginFailCount(String userId);
	
	public int updateClearLockCount(String userId);
	
	public int modifyOneUser(UserVO userVO);
	
	public int insertSocialAPI(UserVO userVO);

	public UserVO findUserById(String userId);

}
