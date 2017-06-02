package com.yolo.message.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.yolo.message.vo.MessageVO;
import com.yolo.user.vo.UserVO;

public class MessageDaoImpl extends SqlSessionDaoSupport implements MessageDao {

	@Override
	public MessageVO selectOneMessage(String messageId) {
		return getSqlSession().selectOne("MessageDao.selectOneMessage", messageId);
	}

	@Override
	public List<MessageVO> selectAllMessagesByReceiver(UserVO userVO) {
		return getSqlSession().selectList("MessageDao.selectAllMessagesByReceiver", userVO);
	}
	
	@Override
	public List<MessageVO> selectAllMessagesBySender(UserVO userVO) {
		return getSqlSession().selectList("MessageDao.selectAllMessagesBySender", userVO);
	}

	@Override
	public int insertOneMessage(MessageVO messageVO) {
		return getSqlSession().insert("MessageDao.insertOneMessage", messageVO);
	}

	@Override
	public int deleteOneMessage(String messageId) {
		return getSqlSession().delete("MessageDao.deleteOneMessage", messageId);
	}

}
