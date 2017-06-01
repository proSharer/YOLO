package com.yolo.trip.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.yolo.trip.vo.TripVO;

public class TripDaoImpl extends SqlSessionDaoSupport implements TripDao {

	@Override
	public String generateTripPK() {
		return getSqlSession().selectOne("TripDao.generateTripPK");
	}

	@Override
	public int insertOneTrip(TripVO tripVO) {
		return getSqlSession().insert("TripDao.insertOneTrip",tripVO);
	}

}
