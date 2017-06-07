package com.yolo.trip.service;

import java.util.List;

import com.yolo.trip.vo.TripListVO;
import com.yolo.trip.vo.TripSearchVO;
import com.yolo.trip.vo.TripVO;
import com.yolo.trippart.vo.TripPartVO;

public interface TripService {

	public boolean addNewOneTrip(TripVO tripVO);
	
	public TripListVO selectAllTrips(TripSearchVO tripSearchVO);
	
	public List<TripPartVO> selectTripPartByTripId(String tripId);
	
	public boolean removeTrip(String tripId);
	
}
