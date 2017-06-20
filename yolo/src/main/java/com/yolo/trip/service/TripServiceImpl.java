package com.yolo.trip.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yolo.like.biz.LikeBiz;
import com.yolo.like.vo.LikeVO;
import com.yolo.region.biz.RegionBiz;
import com.yolo.region.vo.RegionVO;
import com.yolo.trip.biz.TripBiz;
import com.yolo.trip.vo.TripListVO;
import com.yolo.trip.vo.TripSearchVO;
import com.yolo.trip.vo.TripVO;
import com.yolo.trippart.biz.TripPartBiz;
import com.yolo.trippart.vo.TripPartVO;
import com.yolo.tripreply.biz.TripReplyBiz;
import com.yolo.tripreply.vo.TripReplyVO;
import com.yolo.user.vo.UserVO;

public class TripServiceImpl implements TripService{

	private TripBiz tripBiz;
	private TripPartBiz tripPartBiz;
	private LikeBiz likeBiz;
	private TripReplyBiz tripReplyBiz;
	private RegionBiz regionBiz;
	
	public void setTripBiz(TripBiz tripBiz) {
		this.tripBiz = tripBiz;
	}
	public void setTripPartBiz(TripPartBiz tripPartBiz) {
		this.tripPartBiz = tripPartBiz;
	}
	public void setLikeBiz(LikeBiz likeBiz) {
		this.likeBiz = likeBiz;
	}
	public void setTripReplyBiz(TripReplyBiz tripReplyBiz) {
		this.tripReplyBiz = tripReplyBiz;
	}
	public void setRegionBiz(RegionBiz regionBiz) {
		this.regionBiz = regionBiz;
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
	public Map<String,Object> selectAllTrips(TripSearchVO tripSearchVO) {
		Map<String, Object> map = new HashMap<String,Object>();
		
		TripListVO tripList = tripBiz.selectAllTrips(tripSearchVO);
		List<RegionVO> regionList = regionBiz.getAllRegion();
		
		map.put("tripList", tripList);
		map.put("regionList", regionList);
		
		return map;
	}
	@Override
	public Map<String, Object> selectTripPartByTripId(String tripId, UserVO userVO) {
		Map<String, Object> map = new HashMap<String,Object>();
		
		LikeVO likeVO = new LikeVO();
		List<TripReplyVO> tripReplyVO = tripReplyBiz.getAllReplies(tripId);
		if( userVO == null ){
			likeVO.setUserId("");
		}
		else {
			likeVO.setUserId(userVO.getUserId());
		}
		likeVO.setTripId(tripId);
	
		
		LikeVO like = likeBiz.getOneLikeByTripId(likeVO);
	
/*		List<TripPartVO> tripPartList =  tripPartBiz.selectTripPartByTripId(tripId);
		
		map.put("tripPartList", tripPartList);*/
		if( like != null ){
			map.put("like", true);
		}
		else {
			map.put("like", false);
		}
		map.put("tripReplyVO", tripReplyVO);
		
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
		
		// tripPartVO 에 아이디 setting 해주기.
		List<TripPartVO> tripPartList 
				= tripPartBiz.selectTripPartByTripId(tripVO.getTripId());
		
		List<TripPartVO> tripPartVOList = tripVO.getTripPartVO();
		
		for(int i = 0; i< tripPartVOList.size(); i++){
			tripPartVOList.get(i).setTripPartId(tripPartList.get(i).getTripPartId());
		}
		
		tripPartBiz.modifyTripPart(tripPartVOList);
		tripBiz.modifyOneTrip(tripVO);
		
		return tripBiz.modifyOneTrip(tripVO);
	}
	@Override
	public boolean tripAddNewReply(TripReplyVO tripReplyVO) {
		return tripReplyBiz.addNewOneReply(tripReplyVO);
	}
}
