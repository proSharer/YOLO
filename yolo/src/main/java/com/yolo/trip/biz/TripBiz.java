package com.yolo.trip.biz;

import com.yolo.trip.vo.TripListVO;
import com.yolo.trip.vo.TripSearchVO;
import com.yolo.trip.vo.TripVO;

public interface TripBiz {
	
	public String addNewOneTrip(TripVO tripVO);
	
	public TripListVO selectAllTrips(TripSearchVO tripSearchVO);

	public boolean removeTrip(String tripId);
}
