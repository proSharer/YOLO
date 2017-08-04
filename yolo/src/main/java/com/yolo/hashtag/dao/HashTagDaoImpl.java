package com.yolo.hashtag.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.yolo.hashtag.vo.HashTagVO;

public class HashTagDaoImpl extends SqlSessionDaoSupport implements HashTagDao {

	@Override
	public int insertHashTag(HashTagVO hashTagVO) {
		return getSqlSession().insert("HashTagDao.insertHashTag", hashTagVO);
	}

	@Override
	public List<HashTagVO> selectAllHashTagsByTripId(String tripId) {
		return getSqlSession().selectList("HashTagDao.selectAllHashTagsByTripId", tripId);
	}

	@Override
	public List<HashTagVO> selectAllHashTagsByDailyId(String dailyId) {
		return getSqlSession().selectList("HashTagDao.selectAllHashTagsByDailyId", dailyId);
	}

	@Override
	public int deleteAllHashTagByTripId(String tripId) {
		return getSqlSession().delete("HashTagDao.deleteAllHashTagByTripId", tripId);
	}

	@Override
	public int deleteAllHashTagByDailyId(String dailyId) {
		return getSqlSession().delete("HashTagDao.deleteAllHashTagByDailyId", dailyId);
	}
	
}
