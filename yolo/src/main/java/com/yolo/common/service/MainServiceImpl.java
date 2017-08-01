package com.yolo.common.service;

import java.util.List;

import com.yolo.trip.biz.TripBiz;
import com.yolo.trip.vo.TripVO;

public class MainServiceImpl implements MainService {
	
	private TripBiz tripBiz;
	
	public void setTripBiz(TripBiz tripBiz) {
		this.tripBiz = tripBiz;
	}

	@Override
	public List<TripVO> selectAllNewestTrips() {
		return tripBiz.selectAllNewestTrips();
	}
	
}
