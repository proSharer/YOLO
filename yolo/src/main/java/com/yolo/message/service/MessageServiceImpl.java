package com.yolo.message.service;

import java.util.List;

import com.yolo.message.biz.MessageBiz;
import com.yolo.message.vo.MessageVO;
import com.yolo.user.vo.UserVO;

public class MessageServiceImpl implements MessageService {
	
	private MessageBiz messageBiz;
	
	public void setMessageBiz(MessageBiz messageBiz) {
		this.messageBiz = messageBiz;
	}

	@Override
	public MessageVO getOneMessage(String messageId) {
		return messageBiz.getOneMessage(messageId);
	}

	@Override
	public List<MessageVO> getAllMessagesByReceiver(UserVO userVO) {
		return messageBiz.getAllMessagesByReceiver(userVO);
	}
	
	@Override
	public List<MessageVO> getAllMessagesBySender(UserVO userVO) {
		return messageBiz.getAllMessagesBySender(userVO);
	}

	@Override
	public boolean addOneMessage(MessageVO messageVO) {
		return messageBiz.addOneMessage(messageVO);
	}

	@Override
	public boolean removeOneMessage(String messageId) {
		return messageBiz.removeOneMessage(messageId);
	}

}
