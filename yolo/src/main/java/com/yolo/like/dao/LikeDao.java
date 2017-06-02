package com.yolo.like.dao;

import java.util.List;

import com.yolo.daily.vo.DailyVO;
import com.yolo.like.vo.LikeVO;
import com.yolo.trip.vo.TripVO;
import com.yolo.user.vo.UserVO;


public interface LikeDao {
	
	public LikeVO selectOneLikeByDailyId(UserVO userVO, DailyVO dailyVO);
	public LikeVO selectOneLikeByTripId(UserVO userVO, TripVO tripVO);
	
	public List<LikeVO> selectAllLikesByUserID(UserVO userVO);
	
	public int insertOneLike(LikeVO likeVO);
	
	public int deleteOneLikeByDailyId(UserVO userVO, DailyVO dailyVO);
	public int deleteOneLikeByTripId(UserVO userVO, TripVO tripVO);
	
}
