package com.yolo.trippart.biz;

import java.util.List;

import com.yolo.trippart.dao.TripPartDao;
import com.yolo.trippart.vo.TripPartVO;

public class TripPartBizImpl implements TripPartBiz {

	private TripPartDao tripPartDao;
	
	public void setTripPartDao(TripPartDao tripPartDao) {
		this.tripPartDao = tripPartDao;
	}
	
	@Override
	public boolean addOneTripPart(List<TripPartVO> tripPartVOList) {
		return tripPartDao.insertOneTripPart(tripPartVOList) > 0;
	}

	@Override
	public List<TripPartVO> selectTripPartByTripId(String tripId) {
		return tripPartDao.getTripPartByTripId(tripId);
	}

	@Override
	public TripPartVO selectOneTripPart(String tripPartId) {
		return tripPartDao.getOneTripPart(tripPartId);
	}
	@Override
	public boolean modifyTripPart(List<TripPartVO> tripPartVOList) {
		//return tripPartDao.updateOneTripPart(tripPartVO)>0;
		
		boolean isSuccess = false;
		
		for(TripPartVO tripPartVO : tripPartVOList){
			
			TripPartVO tripPart = selectOneTripPart(tripPartVO.getTripPartId());
			
			if ( tripPartVO.getStartTime() == 0){
				tripPartVO.setStartTime(tripPart.getStartTime());
			}
			
			if ( tripPartVO.getEndTime() == 0){
				tripPartVO.setEndTime(tripPart.getEndTime());
			}
			
			if ( tripPartVO.getPlace().isEmpty() || tripPartVO.getPlace().length() < 0) {
				tripPartVO.setPlace(tripPart.getPlace());
			}
			// 나중에 뺄지 말지 생각..
			if ( tripPartVO.getMap().isEmpty() || tripPartVO.getMap().length()< 0 ){
				tripPartVO.setMap(tripPart.getMap());
			}
			if ( tripPartVO.getTimeControl().isEmpty() 
					|| tripPartVO.getTimeControl().length() < 0 ) {
				tripPartVO.setTimeControl(tripPart.getTimeControl());
			}
			
			if ( tripPartVO.getFile().isEmpty() 
					|| tripPartVO.getFile().getSize() < 0 ){
				tripPartVO.setFileName(tripPart.getFileName());
			}
			
			if ( tripPartVO.getContent().isEmpty() 
					|| tripPartVO.getContent().length() < 0 ){
				tripPartVO.setContent(tripPart.getContent());
			}
			if ( tripPartVO.getX().isEmpty() 
					|| tripPartVO.getX().length() < 0 ){
				tripPartVO.setContent(tripPart.getX());
			}
			if ( tripPartVO.getY().isEmpty() 
					|| tripPartVO.getY().length() < 0 ){
				tripPartVO.setContent(tripPart.getY());
			}
			isSuccess = tripPartDao.updateOneTripPart(tripPartVO) > 0;
		}
		
		return isSuccess;
	}
	

}
