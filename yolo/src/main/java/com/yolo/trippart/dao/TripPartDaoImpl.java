package com.yolo.trippart.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.yolo.trippart.vo.TripPartVO;

public class TripPartDaoImpl extends SqlSessionDaoSupport implements TripPartDao{

	@Override
	public int insertOneTripPart(List<TripPartVO> tripPartVOList) {
		
		int isSuccess = 0;
		for(TripPartVO tripPartVO : tripPartVOList ){
			isSuccess = getSqlSession().insert("TripPartDao.insertOneTripPart",tripPartVO);
		}
		return isSuccess;
	}

	@Override
	public List<TripPartVO> getTripPartByTripId(String partId) {
		return getSqlSession().selectList("TripPartDao.getTripPartByTripId",partId);
	}

}
