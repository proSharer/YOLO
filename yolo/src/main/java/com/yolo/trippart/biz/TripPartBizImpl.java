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
	public boolean addOneTripPart(List<TripPartVO> tripPartVOList) {
		return tripPartDao.insertOneTripPart(tripPartVOList) > 0;
	}

	@Override
	public List<TripPartVO> selectTripPartByTripId(String tripId) {
		return tripPartDao.getTripPartByTripId(tripId);
	}

	@Override
	public boolean modifyTripPart(List<TripPartVO> tripPartVOList) {
		//return tripPartDao.updateOneTripPart(tripPartVO)>0;
		
		for(TripPartVO tripPartVO : tripPartVOList){
			// null 값 체크해주기.
		}
		return false;
	}
	

}
