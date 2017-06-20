package com.yolo.tripreply.biz;

import java.util.List;

import com.yolo.tripreply.dao.TripReplyDao;
import com.yolo.tripreply.vo.TripReplyVO;

public class TripReplyBizImpl implements TripReplyBiz{

	private TripReplyDao tripReplyDao;
	
	public void setTripReplyDao(TripReplyDao tripReplyDao) {
		this.tripReplyDao = tripReplyDao;
	}
	@Override
	public List<TripReplyVO> getAllReplies(String tripId) {
		return tripReplyDao.selectAllReplies(tripId);
	}
	@Override
	public boolean addNewOneReply(TripReplyVO tripReplyVO) {
		return tripReplyDao.insertOneReply(tripReplyVO)>0;
	}


}
