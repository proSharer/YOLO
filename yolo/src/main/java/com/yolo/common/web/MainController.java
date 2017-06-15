package com.yolo.common.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yolo.common.service.MainService;
import com.yolo.message.vo.MessageVO;
import com.yolo.user.vo.UserVO;

@Controller
public class MainController {
	
	private MainService mainService;
	
	public void setMainService(MainService mainService) {
		this.mainService = mainService;
	}

	@RequestMapping(value="/home")
	public ModelAndView homeView(HttpSession session) {
		ModelAndView view = new ModelAndView();
		
		List<MessageVO> messageList = null;
		UserVO user = (UserVO)session.getAttribute("_USER_");
		/*UserVO user = new UserVO();
		user.setUserId("test");*/
		
		/*if (user != null) {
			messageList = mainService.getMessageList(user);
			
			// TODO 
			// 1. messageList에서 새로운 message 찾기
			// 2. view에 add
			Date date = null;
			Date sysdate = new Date();
			
			for (MessageVO message : messageList) {
				try {
					date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(message.getSendTime());
					
					if (date.after(sysdate) && date.before(sysdate)) {
						
					}
					
				} catch (ParseException e) {
					throw new RuntimeException(e.getMessage(), e);
				}
				
			}
		}*/
		
		view.addObject("user", user);
		view.setViewName("common/index");
		
		return view;
	}
	
}