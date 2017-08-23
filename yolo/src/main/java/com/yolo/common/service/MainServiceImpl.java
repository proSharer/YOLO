package com.yolo.common.service;

import java.util.ArrayList;
import java.util.List;

import com.yolo.hashtag.biz.HashTagBiz;
import com.yolo.hashtag.vo.PopularHashTagVO;
import com.yolo.like.biz.LikeBiz;
import com.yolo.like.vo.LikeVO;
import com.yolo.trip.biz.TripBiz;
import com.yolo.trip.vo.TripVO;
import com.yolo.user.vo.UserVO;

public class MainServiceImpl implements MainService {
	
	private TripBiz tripBiz;
	private HashTagBiz hashTagBiz;
	private LikeBiz likeBiz;
	
	public void setTripBiz(TripBiz tripBiz) {
		this.tripBiz = tripBiz;
	}
	
	public void setHashTagBiz(HashTagBiz hashTagBiz) {
		this.hashTagBiz = hashTagBiz;
	}

	public void setLikeBiz(LikeBiz likeBiz) {
		this.likeBiz = likeBiz;
	}

	@Override
	public List<TripVO> selectAllNewestTrips() {
		return tripBiz.selectAllNewestTrips();
	}

	@Override
	public List<PopularHashTagVO> getPopularHashTagListByTripId() {
		return hashTagBiz.getPopularHashTagsByTripId();
	}
	
	@Override
	public List<TripVO> selectAllRecommendTrips(UserVO userVO) {
		if( userVO == null || userVO.getUserId() == null ){
			userVO = new UserVO();
			userVO.setUserId("");
		}
		List<LikeVO> likeList = likeBiz.getAllLikesByUserID(userVO); // 내가좋아요한 리스트.
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
			String tripId = likeList.get(i).getTripId();// 내가좋아요한 tripId 
			like = likeBiz.getLikeListByTripId(tripId); // 내가 좋아요한 tripId의 좋아요 list
			
			for ( int j = 0 ; j < like.size(); j++ ){ // 이리스트만큼 
				
				tripList = new ArrayList<TripVO>();
				String userId = like.get(j).getUserId(); // 여기서 좋아요한 유저를 가져와서 

				if ( !userId.equals(userVO.getUserId()) ) { // 유저가 지금 나와같지 않다면 
					
					UserVO user = new UserVO(); 
					user.setUserId(userId);
					otherLike = likeBiz.getAllLikesByUserID(user); // 그 또다른 유저가 좋아요한 목록을 가져와서 
					
					for ( int k = 0 ; k< otherLike.size(); k++ ){
						
						tripVO = new TripVO();
						String trip = otherLike.get(k).getTripId(); // 그좋아요한 목록의 id 를가져와서
						tripVO = tripBiz.selectOneTrip(trip); // 하나씩 가져와..
						tripList.add(tripVO); // 그래서 리스트에 담아 
						
					}
					recommendList.addAll(tripList); // 리스트 ++
				} 
				
			}
		}
		return recommendList;
	}
	
}
