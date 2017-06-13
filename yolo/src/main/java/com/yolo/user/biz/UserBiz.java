package com.yolo.user.biz;

import com.yolo.user.vo.UserVO;

public interface UserBiz {
	
	public boolean insertOneUser(UserVO userVO);
	
	public UserVO selectOneUser(UserVO userVO);
	
	public String getSalt(String userId);
	
	public boolean plusLoginFailCount(String userId);
	
	public boolean updateRockStatus(String userId);
	
	public boolean selectRockStatus(String userId);
	
	public boolean updateClearLoginFailCount(String userId);
	
	public boolean updateClearRockCount(String userId);
	
}
