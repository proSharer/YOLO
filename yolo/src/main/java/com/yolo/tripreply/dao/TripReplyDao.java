package com.yolo.tripreply.dao;

import java.util.List;

import com.yolo.tripreply.vo.TripReplyVO;

public interface TripReplyDao {

	public List<TripReplyVO> selectAllReplies(String tripId);
	
	public int insertOneReply(TripReplyVO tripReplyVO);
}
