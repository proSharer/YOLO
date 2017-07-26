package com.yolo.message.web;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yolo.common.service.MainService;
import com.yolo.message.service.MessageService;
import com.yolo.message.vo.MessageVO;
import com.yolo.user.vo.UserVO;

@Controller
public class MessageController {
	
	private MessageService messageService;
	
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}
	
	@RequestMapping(value="/message/list/received")
	public ModelAndView receivedMessageListView(HttpSession session) {
		ModelAndView view = new ModelAndView();
		
		UserVO user = (UserVO)session.getAttribute("_USER_");

		List<MessageVO> messageList = messageService.getAllMessagesByReceiver(user);
		
		view.addObject("messageList", messageList);
		view.setViewName("message/receivedList");
		
		return view;
	}
	
	@RequestMapping(value="/message/list/sent")
	public ModelAndView sentMessageListView(HttpSession session) {
		ModelAndView view = new ModelAndView();
		
		UserVO user = (UserVO)session.getAttribute("_USER_");
		System.out.println(user.getUserId());
		List<MessageVO> messageList = messageService.getAllMessagesBySender(user);
		
		view.addObject("messageList", messageList);
		view.setViewName("message/sentList");
		
		return view;
	}
	
	@RequestMapping(value="/message/detail/{messageId}")
	public ModelAndView messageDetailView(@PathVariable String messageId) {
		ModelAndView view = new ModelAndView();
		
		MessageVO messageVO = messageService.getOneMessage(messageId);
		
		view.addObject("message", messageVO);
		view.setViewName("message/detail");
		
		return view;
	}
	
	@RequestMapping(value="/message/write/{userId}", method=RequestMethod.GET)
	public String messageWriteView(@PathVariable String userId, HttpServletRequest request, HttpSession session) {
		UserVO loginUser = (UserVO)session.getAttribute("_USER_");
		
		request.setAttribute("userId", userId);
		request.setAttribute("loginUser", loginUser);
		
		return "message/write";
	}
	
	@RequestMapping(value="/message/write/{userId}", method=RequestMethod.POST)
	@ResponseBody
	public String messageWriteAction(MessageVO messageVO) {
		boolean isSuccess = messageService.addOneMessage(messageVO);
		
		if (isSuccess) {
			return "<html><script type='text/javascript'></script><body>Your message has been successfully sent!<br/><a href='#' onclick='javascript:self.close()'>close</a></body></html>"; 
		}
		else {
			System.out.println("fail");
			return "message/write";
		}
	}

}
