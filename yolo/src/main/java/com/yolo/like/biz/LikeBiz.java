package com.yolo.like.biz;

import java.util.List;

import com.yolo.daily.vo.DailyVO;
import com.yolo.like.vo.LikeVO;
import com.yolo.trip.vo.TripVO;
import com.yolo.user.vo.UserVO;

public interface LikeBiz {
	
	public LikeVO getOneLikeByDailyId(LikeVO likeVO);
	public LikeVO getOneLikeByTripId(LikeVO likeVO);
	
	public List<LikeVO> getAllLikesByUserID(UserVO userVO);
	
	public boolean addOneLike(LikeVO likeVO);
	
	public boolean removeOneLikeByDailyId(LikeVO likeVO);
	public boolean removeOneLikeByTripId(LikeVO likeVO);

}
