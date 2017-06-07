package com.yolo.trippart.biz;

import java.util.List;

import com.yolo.trippart.dao.TripPartDao;
import com.yolo.trippart.vo.TripPartVO;

public class TripPartBizImpl implements TripPartBiz {

	private TripPartDao tripPartDao;
	
	public void setTripPartDao(TripPartDao tripPartDao) {
		this.tripPartDao = tripPartDao;
	}
	
	@Override
	public boolean addOneTripPart(TripPartVO tripPartVO) {
		return tripPartDao.insertOneTripPart(tripPartVO) > 0;
	}

	@Override
	public List<TripPartVO> selectTripPartByTripId(String tripId) {
		return tripPartDao.getTripPartByTripId(tripId);
	}
	

}
