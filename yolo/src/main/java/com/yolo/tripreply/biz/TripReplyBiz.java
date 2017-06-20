package com.yolo.tripreply.biz;

import java.util.List;

import com.yolo.tripreply.vo.TripReplyVO;

public interface TripReplyBiz {
	
	public List<TripReplyVO> getAllReplies(String tripId);
	
	public boolean addNewOneReply(TripReplyVO tripReplyVO);
	
}
