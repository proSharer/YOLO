package com.yolo.like.biz;

import java.util.List;

import com.yolo.daily.vo.DailyVO;
import com.yolo.like.dao.LikeDao;
import com.yolo.like.vo.LikeVO;
import com.yolo.trip.vo.TripVO;

public class LikeBizImpl implements LikeBiz {
	
	private LikeDao likeDao;
	
	public void setLikeDao(LikeDao likeDao) {
		this.likeDao = likeDao;
	}

	@Override
	public LikeVO getOneLikeByDailyId(UserVO userVO, DailyVO dailyVO) {
		return likeDao.selectOneLikeByDailyId(userVO, dailyVO);
	}

	@Override
	public LikeVO getOneLikeByTripId(UserVO userVO, TripVO tripVO) {
		return likeDao.selectOneLikeByTripId(userVO, tripVO);
	}

	@Override
	public List<LikeVO> getAllLikesByUserID(UserVO userVO) {
		return likeDao.selectAllLikesByUserID(userVO);
	}

	@Override
	public boolean addOneLike(LikeVO likeVO) {
		return likeDao.insertOneLike(likeVO) > 0;
	}

	@Override
	public boolean removeOneLikeByDailyId(UserVO userVO, DailyVO dailyVO) {
		return likeDao.deleteOneLikeByDailyId(userVO, dailyVO) > 0;
	}

	@Override
	public boolean removeOneLikeByTripId(UserVO userVO, TripVO tripVO) {
		return likeDao.deleteOneLikeByTripId(userVO, tripVO) > 0;
	}

}
