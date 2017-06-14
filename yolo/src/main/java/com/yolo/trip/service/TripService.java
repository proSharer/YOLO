package com.yolo.trip.service;

import java.util.Map;

import com.yolo.trip.vo.TripListVO;
import com.yolo.trip.vo.TripSearchVO;
import com.yolo.trip.vo.TripVO;
import com.yolo.user.vo.UserVO;

public interface TripService {

	public boolean addNewOneTrip(TripVO tripVO);
	
	public TripListVO selectAllTrips(TripSearchVO tripSearchVO);
	
	public Map<String,Object> selectTripPartByTripId(String tripId, UserVO userVO);
	
	public boolean removeTrip(String tripId);
	
	public TripVO selectOneTrip(String tripId);
	
	public boolean tripLikeCountPlus(String tripId,String userId);
	
	public boolean tripLikeCountMinus(String tripId, String userId);
	
	public boolean modifyOneTrip(TripVO tripVO);
}
