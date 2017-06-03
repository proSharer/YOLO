package com.yolo.trip.dao;

import com.yolo.trip.vo.TripVO;

public interface TripDao {

	public String generateTripPK();
	
	public int insertOneTrip(TripVO tripVO);
}
