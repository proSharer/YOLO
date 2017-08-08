package com.yolo.common.service;

import java.util.ArrayList;
import java.util.List;

import com.yolo.like.biz.LikeBiz;
import com.yolo.like.vo.LikeVO;
import com.yolo.trip.biz.TripBiz;
import com.yolo.trip.vo.TripVO;
import com.yolo.user.vo.UserVO;

public class MainServiceImpl implements MainService {
	
	private TripBiz tripBiz;
	private LikeBiz likeBiz;
	
	public void setTripBiz(TripBiz tripBiz) {
		this.tripBiz = tripBiz;
	}
	public void setLikeBiz(LikeBiz likeBiz) {
		this.likeBiz = likeBiz;
	}
	@Override
	public List<TripVO> selectAllNewestTrips() {
		return tripBiz.selectAllNewestTrips();
	}

	@Override
	public List<TripVO> selectAllRecommendTrips(UserVO userVO) {
		if( userVO == null ){
			userVO = new UserVO();
			userVO.setUserId("");
		}
		List<LikeVO> likeList = likeBiz.getAllLikesByUserID(userVO);
		if ( likeList.size() == 0 ){
			return null;
		}
		List<TripVO> tripList = null;
		List<LikeVO> like;
		List<LikeVO> otherLike;
		List<TripVO> recommendList = new ArrayList<TripVO>();
		TripVO tripVO = null;
	
		for ( int i = 0 ; i < likeList.size(); i++) {
			
			like = new ArrayList<LikeVO>();	
			String tripId = likeList.get(i).getTripId();
			like = likeBiz.getLikeListByTripId(tripId);
			
			for ( int j = 0 ; j < like.size(); j++ ){
				
				tripList = new ArrayList<TripVO>();
				String userId = like.get(j).getUserId();

				if ( !userId.equals(userVO.getUserId()) ) {
					
					UserVO user = new UserVO();
					user.setUserId(userId);
					otherLike = likeBiz.getAllLikesByUserID(user);
					
					for ( int k = 0 ; k< otherLike.size(); k++ ){
						
						tripVO = new TripVO();
						String trip = otherLike.get(k).getTripId(); 
						tripVO = tripBiz.selectOneTrip(trip);
						tripList.add(tripVO);
						
					}
					recommendList.addAll(tripList);
				} 
				
			}
		}
		return recommendList;
	}
	
}
