package com.yolo.message.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yolo.message.service.MessageService;
import com.yolo.message.vo.MessageVO;

@Controller
public class MessageController {
	
	private MessageService messageService;
	
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}
	
	@RequestMapping(value="/message/list")
	public String messageListView() {
		return "message/list";
	}
	
	@RequestMapping(value="/message/detail/{messageId}")
	public String messageDetailView() {
		return "message/detail";
	}
	
	@RequestMapping(value="/message/write", method=RequestMethod.GET)
	public String messageWriteView() {
		return "message/write";
	}
	
	@RequestMapping(value="/message/write", method=RequestMethod.POST)
	public String messageWriteAction(MessageVO messageVO) {
		boolean isSuccess = messageService.addOneMessage(messageVO);
		
		if (isSuccess) {
			// TODO 성공시 자동으로 페이지 꺼지도록
			return ""; 
		}
		else {
			return "message/write";
		}
	}

}
