package com.yolo.message.biz;

import java.util.List;

import com.yolo.message.dao.MessageDao;
import com.yolo.message.vo.MessageVO;
import com.yolo.user.vo.UserVO;

public class MessageBizImpl implements MessageBiz {
	
	private MessageDao messageDao;
	
	public void setMessageDao(MessageDao messageDao) {
		this.messageDao = messageDao;
	}

	@Override
	public MessageVO getOneMessage(String messageId) {
		return messageDao.selectOneMessage(messageId);
	}

	@Override
	public List<MessageVO> getAllMessagesByReceiver(UserVO userVO) {
		return messageDao.selectAllMessagesByReceiver(userVO);
	}
	
	@Override
	public List<MessageVO> getAllMessagesBySender(UserVO userVO) {
		return messageDao.selectAllMessagesBySender(userVO);
	}

	@Override
	public boolean addOneMessage(MessageVO messageVO) {
		return messageDao.insertOneMessage(messageVO) > 0;
	}

	@Override
	public boolean removeOneMessage(String messageId) {
		return messageDao.deleteOneMessage(messageId) > 0;
	}
	
}
