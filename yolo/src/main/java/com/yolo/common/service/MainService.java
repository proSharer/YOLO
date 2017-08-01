package com.yolo.common.service;

import java.util.List;

import com.yolo.trip.vo.TripVO;

public interface MainService {
	
	public List<TripVO> selectAllNewestTrips();

}
