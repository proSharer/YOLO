package com.yolo.hashtag.biz;

import java.util.List;

import com.yolo.hashtag.vo.HashTagVO;

public interface HashTagBiz {
	
	public boolean addHashTag(HashTagVO hashTagVO);
	
	public List<HashTagVO> getAllHashTagsByTripId(String tripId);
	
	public List<HashTagVO> getAllHashTagsByDailyId(String dailyId);
	
	public boolean deleteAllHashTagByTripId(String tripId);
	
	public boolean deleteAllHashTagByDailyId(String dailyId);

}
