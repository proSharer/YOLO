package com.yolo.trippart.dao;

import java.util.List;

import com.yolo.trippart.vo.TripPartVO;

public interface TripPartDao {

	public int insertOneTripPart(TripPartVO tripPartVO);
	
	public List<TripPartVO> getTripPartByTripId(String partId);
}
