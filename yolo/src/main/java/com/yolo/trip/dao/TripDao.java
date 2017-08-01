package com.yolo.trip.dao;

import java.util.List;

import com.yolo.trip.vo.TripSearchVO;
import com.yolo.trip.vo.TripVO;

public interface TripDao {

	public String generateTripPK();
	
	public int insertOneTrip(TripVO tripVO);
	
	public List<TripVO> getAllTrips(TripSearchVO tripSearchVO);
	
	public int getAllTripCount(TripSearchVO tripSearchVO);
	
	public int deleteTrip(String tripId);
	
	public TripVO getOneTrip(String tripId);
	
	public int tripLikeCountUpdatePlus(String tripId);
	
	public int tripLikeCountUpdateMinus(String tripId);
	
	public int updateOneTrip(TripVO tripVO);
	
	public List<TripVO> getAllNewestTrips();
	
}
