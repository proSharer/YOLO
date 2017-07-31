package com.yolo.user.service;

import java.util.List;

import com.yolo.common.utilities.SHA256Util;
import com.yolo.message.biz.MessageBiz;
import com.yolo.message.vo.MessageVO;
import com.yolo.trip.biz.TripBiz;
import com.yolo.trip.vo.TripVO;
import com.yolo.tripreply.biz.TripReplyBiz;
import com.yolo.tripreply.vo.TripReplyVO;
import com.yolo.user.biz.UserBiz;
import com.yolo.user.vo.UserVO;

public class UserServiceImpl implements UserService {

	private UserBiz userBiz;
	private MessageBiz messageBiz;
	private TripBiz tripBiz;
	private TripReplyBiz tripReplyBiz; 

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}
	public void setMessageBiz(MessageBiz messageBiz) {
		this.messageBiz = messageBiz;
	}
	public void setTripBiz(TripBiz tripBiz) {
		this.tripBiz = tripBiz;
	}
	public void setTripReplyBiz(TripReplyBiz tripReplyBiz) {
		this.tripReplyBiz = tripReplyBiz;
	}
	@Override
	public boolean insertOneUser(UserVO userVO) {

		String salt = SHA256Util.generateSalt();
		userVO.setSalt(salt);

		String password = userVO.getPassword();
		password = SHA256Util.getEncrypt(password, salt);
		userVO.setPassword(password);

		userVO.setAuthId("USR");

		return userBiz.insertOneUser(userVO);
	}
	
	@Override
	public boolean modifyOneUser(UserVO userVO) {
		return userBiz.modifyOneUser(userVO);
	}

	@Override
	public UserVO selectOneUser(UserVO userVO) {

		if (userBiz.selectRockStatus(userVO.getUserId())) {
			return null;
		}
		
		userBiz.updateClearLoginFailCount(userVO.getUserId());
		
		String salt = userBiz.getSalt(userVO.getUserId());
		
		String password = userVO.getPassword();
		password = SHA256Util.getEncrypt(password, salt);
		userVO.setPassword(password);
		
		UserVO user = userBiz.selectOneUser(userVO);

		if (user != null) {
			userBiz.updateClearRockCount(userVO.getUserId());
		} else {
			userBiz.plusLoginFailCount(userVO.getUserId());
			userBiz.updateRockStatus(userVO.getUserId());
		}

		return user;
	}

	@Override
	public UserVO findUserById(String userId) {
		return userBiz.findUserById(userId);
	}

	@Override
	public List<MessageVO> selectAllMessagesByReceiver(UserVO userVO) {
		return messageBiz.getAllMessagesByReceiver(userVO);
	}

	@Override
	public List<MessageVO> selectAllMessagesBySender(UserVO userVO) {
		return messageBiz.getAllMessagesBySender(userVO);
	}

	@Override
	public MessageVO selectOneMessage(String messageId) {
		return messageBiz.getOneMessage(messageId);
	}
	public List<TripVO> selectAllTripByUserId(String userId){
		return tripBiz.selectAllTripByUserId(userId);
	}
	@Override
	public List<TripReplyVO> getAllReplies(String tripId) {
		return tripReplyBiz.getAllReplies(tripId);
	}
}
