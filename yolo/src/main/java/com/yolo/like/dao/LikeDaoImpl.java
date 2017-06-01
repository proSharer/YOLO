package com.yolo.like.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.yolo.like.vo.LikeVO;

public class LikeDaoImpl extends SqlSessionDaoSupport implements LikeDao {
	
	@Override
	public LikeVO selectOneLikeByDailyId(UserVO userVO, DailyVO dailyVO) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("userVO", userVO);
		map.put("dailyVO", dailyVO);
		
		return getSqlSession().selectOne("LikeDao.selectOneLikeByDailyId", map);
	}

	@Override
	public LikeVO selectOneLikeByTripId(UserVO userVO, TripVO tripVO) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("userVO", userVO);
		map.put("tripVO", tripVO);
		
		return getSqlSession().selectOne("LikeDao.selectOneLikeByTripId", map);
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
	public int deleteOneLikeByDailyId(UserVO userVO, DailyVO dailyVO) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("userVO", userVO);
		map.put("dailyVO", dailyVO);
		
		return getSqlSession().delete("LikeDao.deleteOneLikeByDailyId", map);
	}

	@Override
	public int deleteOneLikeByTripId(UserVO userVO, TripVO tripVO) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("userVO", userVO);
		map.put("tripVO", tripVO);
		
		return getSqlSession().delete("LikeDao.deleteOneLikeByTripId", map);
	}

}
