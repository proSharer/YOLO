package com.yolo.like.biz;

import java.util.List;

import com.yolo.daily.vo.DailyVO;
import com.yolo.like.vo.LikeVO;
import com.yolo.trip.vo.TripVO;

public interface LikeBiz {
	
	/*
	 * User가 Like를 했는지 안 했는지 check
	 */
	public LikeVO getOneLikeByDailyId(UserVO userVO, DailyVO dailyVO);
	public LikeVO getOneLikeByTripId(UserVO userVO, TripVO tripVO);
	
	/*
	 * User의 Like list
	 */
	public List<LikeVO> getAllLikesByUserID(UserVO userVO);
	
	/*
	 * User가 Like를 눌렀을 경우 (홀수번 눌렀을 경우)
	 */
	public boolean addOneLike(LikeVO likeVO);
	
	/*
	 * User가 Like를 취소 했을 경우 (짝수번 눌렀을 경우)
	 */
	public boolean removeOneLikeByDailyId(UserVO userVO, DailyVO dailyVO);
	public boolean removeOneLikeByTripId(UserVO userVO, TripVO tripVO);

}
