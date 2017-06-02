package com.yolo.message.dao;

import java.util.List;

import com.yolo.message.vo.MessageVO;
import com.yolo.user.vo.UserVO;

public interface MessageDao {
	
	public MessageVO selectOneMessage(String messageId);
	
	public List<MessageVO> selectAllMessagesByReceiver(UserVO userVO);
	
	public List<MessageVO> selectAllMessagesBySender(UserVO userVO);
	
	public int insertOneMessage(MessageVO messageVO);
	
	public int deleteOneMessage(String messageId);
	
}
