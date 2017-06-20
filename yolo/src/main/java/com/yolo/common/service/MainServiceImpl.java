package com.yolo.common.service;

import java.util.List;

import com.yolo.message.biz.MessageBiz;
import com.yolo.message.vo.MessageVO;
import com.yolo.user.vo.UserVO;

public class MainServiceImpl implements MainService {
	
	private MessageBiz messageBiz;
	
	public void setMessageBiz(MessageBiz messageBiz) {
		this.messageBiz = messageBiz;
	}

	@Override
	public List<MessageVO> getMessageList(UserVO user) {
		return messageBiz.getAllMessagesByReceiver(user);
	}
	

}
