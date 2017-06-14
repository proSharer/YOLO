package com.yolo.trippart.biz;

import java.util.List;

import com.yolo.trippart.vo.TripPartVO;

public interface TripPartBiz {

	public boolean addOneTripPart(List<TripPartVO> tripPartVOList);

	public List<TripPartVO> selectTripPartByTripId(String tripId);
	
	public boolean modifyTripPart(List<TripPartVO> tripPartVOList);
}
