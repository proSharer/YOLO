package com.yolo.trip.biz;

import java.util.ArrayList;
import java.util.List;

import com.yolo.common.web.Pager;
import com.yolo.trip.dao.TripDao;
import com.yolo.trip.vo.TripListVO;
import com.yolo.trip.vo.TripSearchVO;
import com.yolo.trip.vo.TripVO;

public class TripBizImpl implements TripBiz {

	private TripDao tripDao;
	
	public void setTripDao(TripDao tripDao) {
		this.tripDao = tripDao;
	}
	
	@Override
	public String addNewOneTrip(TripVO tripVO) {
		String tripPk = tripDao.generateTripPK();
		tripVO.setTripId(tripPk);
		
		boolean isSuccess = tripDao.insertOneTrip(tripVO) > 0;
		if ( isSuccess ){
			return tripPk;
		}
		return null;
	}

	@Override
	public TripListVO selectAllTrips(TripSearchVO tripSearchVO) {
		
		TripListVO tripListVO = new TripListVO();
		Pager pager = tripListVO.getPager();
		
		pager.setPageNumber(tripSearchVO.getPageNo());
		
		int totalCount = tripDao.getAllTripCount(tripSearchVO);		
		pager.setTotalArticleCount(totalCount);
		
		tripSearchVO.setStartArticleNumber(pager.getStartArticleNumber());
		tripSearchVO.setEndArticleNumber(pager.getEndArticleNumber());
		
		if(totalCount > 0){
			List<TripVO> tripList = tripDao.getAllTrips(tripSearchVO);
			tripListVO.setTripList(tripList);
		} else {
			tripListVO.setTripList(new ArrayList<TripVO>());
		}
		
		return tripListVO;
	}

	@Override
	public boolean removeTrip(String tripId) {
		return tripDao.deleteTrip(tripId)>0;
	}

	@Override
	public TripVO selectOneTrip(String tripId) {
		return tripDao.getOneTrip(tripId);
	}

	@Override
	public boolean tripLikeCountPlus(String tripId) {
		return tripDao.tripLikeCountUpdatePlus(tripId) > 0;
	}

	@Override
	public boolean tripLikeCountMinus(String tripId) {
		return tripDao.tripLikeCountUpdateMinus(tripId)>0;
	}

	@Override
	public boolean modifyOneTrip(TripVO tripVO) {
	
		return false;
	}

}
