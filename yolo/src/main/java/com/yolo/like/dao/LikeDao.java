package com.yolo.like.dao;

import java.util.List;

import com.yolo.daily.vo.DailyVO;
import com.yolo.like.vo.LikeVO;
import com.yolo.trip.vo.TripVO;

public interface LikeDao {
	
	/*
	 * User가 Like를 했는지 안 했는지 check
	 */
	public LikeVO selectOneLikeByDailyId(UserVO userVO, DailyVO dailyVO);
	public LikeVO selectOneLikeByTripId(UserVO userVO, TripVO tripVO);
	
	/*
	 * User의 Like list
	 */
	public List<LikeVO> selectAllLikesByUserID(UserVO userVO);
	
	/*
	 * User가 Like를 눌렀을 경우 (홀수번 눌렀을 경우)
	 */
	public int insertOneLike(LikeVO likeVO);
	
	/*
	 * User가 Like를 취소 했을 경우 (짝수번 눌렀을 경우)
	 */
	public int deleteOneLikeByDailyId(UserVO userVO, DailyVO dailyVO);
	public int deleteOneLikeByTripId(UserVO userVO, TripVO tripVO);
	
}
