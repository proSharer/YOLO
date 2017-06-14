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
		
		TripVO tripVO = tripBiz.selectOneTrip(tripId);
		
		List<TripPartVO> tripPartList = tripPartBiz.selectTripPartByTripId(tripId);
		tripVO.setTripPartVO(tripPartList);
		
		return tripVO;
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
	@Override
	public boolean modifyOneTrip(TripVO tripVO) {
		List<TripPartVO> tripPartList 
				= tripBiz.selectOneTrip(tripVO.getTripId()).getTripPartVO();
		
		List<TripPartVO> tripPartVOList = tripVO.getTripPartVO();
		
		for(int i = 0; i< tripPartVOList.size(); i++){
			tripPartVOList.get(i).setTripPartId(tripPartList.get(i).getTripPartId());
		}
		
		tripPartBiz.modifyTripPart(tripPartVOList);
		/*	 TODO tripPartVO 를 생성후, tripVO 에 있는 tripPartVO (List) 만큼
  		반복문을 돌면서 update 됨.. null을 막기위해 tripVO 와
  		 tripPartVO를 select 하는 쿼리를 짜줘야..*/
		
		return tripBiz.modifyOneTrip(tripVO);
	}
}
