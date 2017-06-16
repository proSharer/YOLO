package com.yolo.common.service;

import java.util.List;

import com.yolo.message.vo.MessageVO;
import com.yolo.user.vo.UserVO;

public interface MainService {
	public List<MessageVO> getMessageList(UserVO user);
}
