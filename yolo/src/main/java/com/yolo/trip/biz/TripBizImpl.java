package com.yolo.trip.biz;

import com.yolo.trip.dao.TripDao;
import com.yolo.trip.vo.TripVO;

public class TripBizImpl implements TripBiz {

	private TripDao tripDao;
	
	public void setTripDao(TripDao tripDao) {
		this.tripDao = tripDao;
	}
	
	@Override
	public String addNewOneTrip(TripVO tripVO) {
		String tripPk = tripDao.generateTripPK();
		tripVO.setTripId(tripPk);
		
		boolean isSuccess = tripDao.insertOneTrip(tripVO) > 0;
		if ( isSuccess ){
			return tripPk;
		}
		return null;
	}

}
