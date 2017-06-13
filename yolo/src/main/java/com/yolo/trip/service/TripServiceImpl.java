package com.yolo.trip.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yolo.like.biz.LikeBiz;
import com.yolo.like.vo.LikeVO;
import com.yolo.trip.biz.TripBiz;
import com.yolo.trip.vo.TripListVO;
import com.yolo.trip.vo.TripSearchVO;
import com.yolo.trip.vo.TripVO;
import com.yolo.trippart.biz.TripPartBiz;
import com.yolo.trippart.vo.TripPartListVO;
import com.yolo.trippart.vo.TripPartVO;
import com.yolo.user.vo.UserVO;

public class TripServiceImpl implements TripService{

	private TripBiz tripBiz;
	private TripPartBiz tripPartBiz;
	private LikeBiz likeBiz;
	
	public void setTripBiz(TripBiz tripBiz) {
		this.tripBiz = tripBiz;
	}
	public void setTripPartBiz(TripPartBiz tripPartBiz) {
		this.tripPartBiz = tripPartBiz;
	}
	public void setLikeBiz(LikeBiz likeBiz) {
		this.likeBiz = likeBiz;
	}
	@Override
	public boolean addNewOneTrip(TripVO tripVO) {
		
		String tripId = tripBiz.addNewOneTrip(tripVO);
		
		List<TripPartVO> tripPartListVO = tripVO.getTripPartVO();
		
		for ( int i = 0; i<tripPartListVO.size(); i++){
			tripPartListVO.get(i).setTripId(tripId);
		}
		
		return tripPartBiz.addOneTripPart(tripPartListVO);
	}
	@Override
	public TripListVO selectAllTrips(TripSearchVO tripSearchVO) {
		return tripBiz.selectAllTrips(tripSearchVO);
	}
	@Override
	public Map<String, Object> selectTripPartByTripId(String tripId, UserVO userVO) {
		LikeVO likeVO = new LikeVO();
		
		if( userVO == null ){
			likeVO.setUserId("");
		}
		else {
			likeVO.setUserId(userVO.getUserId());
		}
		likeVO.setTripId(tripId);
		
		
		Map<String, Object> map = new HashMap<String,Object>();
		
		LikeVO like = likeBiz.getOneLikeByTripId(likeVO);
		List<TripPartVO> tripPartList =  tripPartBiz.selectTripPartByTripId(tripId);
		
		map.put("tripPartList", tripPartList);
		if( like != null ){
			map.put("like", true);
		}
		else {
			map.put("like", false);
		}
		
		return map;
	}
	@Override
	public boolean removeTrip(String tripId) {
		return tripBiz.removeTrip(tripId);
	}
	@Override
	public TripVO selectOneTrip(String tripId) {
		return tripBiz.selectOneTrip(tripId);
	}
	@Override
	public boolean tripLikeCountPlus(String tripId, String userId) {
		LikeVO likeVO = new LikeVO();
		
		likeVO.setTripId(tripId);
		likeVO.setUserId(userId);
		likeVO.setDailyId("");
		
		boolean isSuccess = likeBiz.addOneLike(likeVO);
		if ( isSuccess ){
			return tripBiz.tripLikeCountPlus(tripId);
		}
		else {
			return false;
		}
	}
	@Override
	public boolean tripLikeCountMinus(String tripId, String userId) {
		LikeVO likeVO = new LikeVO();
		
		likeVO.setTripId(tripId);
		likeVO.setUserId(userId);
		
		boolean isSuccess = likeBiz.removeOneLikeByTripId(likeVO);
		if (isSuccess) {
			return tripBiz.tripLikeCountMinus(tripId);
		}
		else {
			return false;
		}
		
	}
}
