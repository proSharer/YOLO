package com.yolo.tripreply.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.yolo.tripreply.vo.TripReplyVO;

public class TripReplyDaoImpl extends SqlSessionDaoSupport implements TripReplyDao  {

	@Override
	public List<TripReplyVO> selectAllReplies(String tripId) {
		return getSqlSession().selectList("TripReplyDao.selectAllReplies",tripId);
	}

	@Override
	public int insertOneReply(TripReplyVO tripReplyVO) {
		return getSqlSession().insert("TripReplyDao.insertOneReply",tripReplyVO);
	}

	
}
