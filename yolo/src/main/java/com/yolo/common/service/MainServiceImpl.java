package com.yolo.common.service;

import java.util.List;

import com.yolo.hashtag.biz.HashTagBiz;
import com.yolo.hashtag.vo.PopularHashTagVO;
import com.yolo.trip.biz.TripBiz;
import com.yolo.trip.vo.TripVO;

public class MainServiceImpl implements MainService {
	
	private TripBiz tripBiz;
	private HashTagBiz hashTagBiz;
	
	public void setTripBiz(TripBiz tripBiz) {
		this.tripBiz = tripBiz;
	}
	
	public void setHashTagBiz(HashTagBiz hashTagBiz) {
		this.hashTagBiz = hashTagBiz;
	}

	@Override
	public List<TripVO> selectAllNewestTrips() {
		return tripBiz.selectAllNewestTrips();
	}

	@Override
	public List<PopularHashTagVO> getPopularHashTagListByTripId() {
		return hashTagBiz.getPopularHashTagsByTripId();
	}
	
}
