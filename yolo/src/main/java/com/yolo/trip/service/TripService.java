package com.yolo.trip.service;

import java.util.List;
import java.util.Map;

import com.yolo.hashtag.vo.HashTagVO;
import com.yolo.trip.vo.TripSearchVO;
import com.yolo.trip.vo.TripVO;
import com.yolo.trippart.vo.TripPartVO;
import com.yolo.tripreply.vo.TripReplyVO;
import com.yolo.user.vo.UserVO;

public interface TripService {

	public boolean addNewOneTrip(TripVO tripVO);
	
	public Map<String,Object> selectAllTrips(TripSearchVO tripSearchVO);
	
	public Map<String,Object> selectTripPartByTripId(String tripId, UserVO userVO);
	
	public boolean removeTrip(String tripId);
	
	public TripVO selectOneTrip(String tripId);
	
	public boolean tripLikeCountPlus(String tripId,String userId);
	
	public boolean tripLikeCountMinus(String tripId, String userId);
	
	public boolean modifyOneTrip(TripVO tripVO);
	
	public boolean tripAddNewReply(TripReplyVO tripReplyVO);
	
	public TripPartVO selectOneTripPart(String tripPartId);
	
	public List<HashTagVO> selectAllHashTagByTripId(String tripId);
	
}
