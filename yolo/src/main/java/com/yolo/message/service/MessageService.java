package com.yolo.message.service;

import java.util.List;

import com.yolo.message.vo.MessageVO;
import com.yolo.user.vo.UserVO;

public interface MessageService {
	public MessageVO getOneMessage(String messageId);
	
	public List<MessageVO> getAllMessagesByReceiver(UserVO userVO);
	
	public List<MessageVO> getAllMessagesBySender(UserVO userVO);
	
	public boolean addOneMessage(MessageVO messageVO);
	
	public boolean removeOneMessage(String messageId);
}
