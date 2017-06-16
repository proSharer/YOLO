package com.yolo.like.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.yolo.daily.vo.DailyVO;
import com.yolo.like.vo.LikeVO;
import com.yolo.trip.vo.TripVO;
import com.yolo.user.vo.UserVO;

public class LikeDaoImpl extends SqlSessionDaoSupport implements LikeDao {
	
	@Override
	public LikeVO selectOneLikeByDailyId(LikeVO likeVO) {
		return getSqlSession().selectOne("LikeDao.selectOneLikeByDailyId", likeVO);
	}

	@Override
	public LikeVO selectOneLikeByTripId(LikeVO likeVO) {
		return getSqlSession().selectOne("LikeDao.selectOneLikeByTripId", likeVO);
	}

	@Override
	public List<LikeVO> selectAllLikesByUserID(UserVO userVO) {
		return getSqlSession().selectList("LikeDao.selectAllLikesByUserID", userVO);
	}

	@Override
	public int insertOneLike(LikeVO likeVO) {
		return getSqlSession().insert("LikeDao.insertOneLike", likeVO);
	}

	@Override
	public int deleteOneLikeByDailyId(LikeVO likeVO) {
		return getSqlSession().delete("LikeDao.deleteOneLikeByDailyId", likeVO);
	}

	@Override
	public int deleteOneLikeByTripId(LikeVO likeVO) {
		return getSqlSession().delete("LikeDao.deleteOneLikeByTripId", likeVO);
	}

}
