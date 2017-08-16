package com.yolo.like.biz;

import java.util.List;

import com.yolo.daily.vo.DailyVO;
import com.yolo.like.dao.LikeDao;
import com.yolo.like.vo.LikeVO;
import com.yolo.trip.vo.TripVO;
import com.yolo.user.vo.UserVO;

public class LikeBizImpl implements LikeBiz {
	
	private LikeDao likeDao;
	
	public void setLikeDao(LikeDao likeDao) {
		this.likeDao = likeDao;
	}

	@Override
	public LikeVO getOneLikeByDailyId(LikeVO likeVO) {
		return likeDao.selectOneLikeByDailyId(likeVO);
	}

	@Override
	public LikeVO getOneLikeByTripId(LikeVO likeVO) {
		return likeDao.selectOneLikeByTripId(likeVO);
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
	public boolean removeOneLikeByDailyId(LikeVO likeVO) {
		return likeDao.deleteOneLikeByDailyId(likeVO) > 0;
	}

	@Override
	public boolean removeOneLikeByTripId(LikeVO likeVO) {
		return likeDao.deleteOneLikeByTripId(likeVO) > 0;
	}

	@Override
	public List<LikeVO> getLikeListByTripId(String tripId) {
		return likeDao.selectLikeListByTripId(tripId);
	}
	

}
