package com.yolo.dailyMain.service;

import com.yolo.dailyMain.vo.DailyMainVO;
import com.yolo.like.vo.LikeVO;

public interface DailyMainService {
	public String getDailyId();
	
	public boolean dailyMainLikeCountPlus(String dailyId, String userId);
	
	public boolean dailyMainCountMinus(String dailyId, String userId);
	
	public DailyMainVO getOneDailyMain(String dailyId);
	
	public boolean isLikeByDailyId(LikeVO likeVO);
	
}
