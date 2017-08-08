package com.yolo.like.dao;

import java.util.List;

import com.yolo.daily.vo.DailyVO;
import com.yolo.like.vo.LikeVO;
import com.yolo.trip.vo.TripVO;
import com.yolo.user.vo.UserVO;


public interface LikeDao {
	
	public LikeVO selectOneLikeByDailyId(LikeVO likeVO);
	public LikeVO selectOneLikeByTripId(LikeVO likeVO);
	
	public List<LikeVO> selectAllLikesByUserID(UserVO userVO);
	
	public int insertOneLike(LikeVO likeVO);
	
	public int deleteOneLikeByDailyId(LikeVO likeVO);
	public int deleteOneLikeByTripId(LikeVO likeVO);

	public List<LikeVO> selectLikeListByTripId(String tripId);
}
