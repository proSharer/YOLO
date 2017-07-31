package com.yolo.user.service;

import java.util.List;

import com.yolo.message.vo.MessageVO;
import com.yolo.trip.vo.TripVO;
import com.yolo.tripreply.vo.TripReplyVO;
import com.yolo.user.vo.UserVO;

public interface UserService {
	
	public boolean insertOneUser(UserVO userVO);
	
	public UserVO selectOneUser(UserVO userVO);
	
	public boolean modifyOneUser(UserVO userVO);
	
	public UserVO findUserById(String userId);
	
	public List<MessageVO> selectAllMessagesByReceiver(UserVO userVO);
	
	public List<MessageVO> selectAllMessagesBySender(UserVO userVO);
	
	public MessageVO selectOneMessage(String messageId);
	
	public List<TripVO> selectAllTripByUserId(String userId);
	
	public List<TripReplyVO> getAllReplies(String tripId);
}
