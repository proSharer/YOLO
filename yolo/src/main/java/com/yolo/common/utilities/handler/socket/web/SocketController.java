package com.yolo.common.utilities.handler.socket.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SocketController {

	@RequestMapping("/chat")
	public String viewChattingPage() {
		return "chatting/chat";
	}

}