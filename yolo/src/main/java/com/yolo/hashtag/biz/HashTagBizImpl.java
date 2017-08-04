package com.yolo.hashtag.biz;

import java.util.List;

import com.yolo.hashtag.dao.HashTagDao;
import com.yolo.hashtag.vo.HashTagVO;

public class HashTagBizImpl implements HashTagBiz {
	
	private HashTagDao hashTagDao;
	
	public void setHashTagDao(HashTagDao hashTagDao) {
		this.hashTagDao = hashTagDao;
	}

	@Override
	public boolean addHashTag(HashTagVO hashTagVO) {
		return hashTagDao.insertHashTag(hashTagVO) > 0;
	}

	@Override
	public List<HashTagVO> getAllHashTagsByTripId(String tripId) {
		return hashTagDao.selectAllHashTagsByTripId(tripId);
	}

	@Override
	public List<HashTagVO> getAllHashTagsByDailyId(String dailyId) {
		return hashTagDao.selectAllHashTagsByDailyId(dailyId);
	}

	@Override
	public boolean deleteAllHashTagByTripId(String tripId) {
		return hashTagDao.deleteAllHashTagByTripId(tripId) > 0;
	}

	@Override
	public boolean deleteAllHashTagByDailyId(String dailyId) {
		return hashTagDao.deleteAllHashTagByDailyId(dailyId) > 0;
	}

}
