package com.yolo.user.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.yolo.message.vo.MessageVO;
import com.yolo.trip.vo.TripVO;
import com.yolo.tripreply.vo.TripReplyVO;
import com.yolo.user.service.UserService;
import com.yolo.user.vo.UserVO;

@Controller()
public class UserController {

	private Logger logger = LoggerFactory.getLogger(UserController.class);

	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@RequestMapping("/user/login")
	public ModelAndView loginByNaver() {
		ModelAndView view = new ModelAndView();
		view.setViewName("user/login");

		return view;

	}
	
	
	@RequestMapping(value ="/user/signIn", method = RequestMethod.GET) 
	public ModelAndView viewSignInPage() { 
		
		ModelAndView view = new ModelAndView();

		view.setViewName("user/signIn");

		return view; 
	}

	@RequestMapping(value = "/user/signIn", method = RequestMethod.POST)
	public void doSignInAction(UserVO userVO, HttpServletRequest request, HttpServletResponse response) {
		
		if (userVO.getUserId() == "" || userVO.getPassword() == "") {
			try {
				PrintWriter write = response.getWriter();
				write.append("FAIL");
				write.flush();
				write.close();
			} catch (IOException e) {
				throw new RuntimeException(e.getMessage(), e);
			}
		}
		
		UserVO login = userService.selectOneUser(userVO);
		
		if (login != null) {
			try {
				HttpSession session = request.getSession();
				session.setAttribute("_USER_", login);
				login.setLoginType(UserVO.DEFAULT);
				PrintWriter write = response.getWriter();
				write.append("OK");
				write.flush();
				write.close();
				
			} catch (IOException e) {
				throw new RuntimeException(e.getMessage(), e);
			}
		} else {
			try {
				PrintWriter write = response.getWriter();
				write.append("FAIL");
				write.flush();
				write.close();
			} catch (IOException e) {
				throw new RuntimeException(e.getMessage(), e);
			}
		}
	}

	@RequestMapping(value = "/user/signUp", method = RequestMethod.GET)
	public ModelAndView viewSignUpPage(HttpSession session) {
		ModelAndView view = new ModelAndView();
		
		UserVO user = (UserVO) session.getAttribute("_USER_"); 
		
		view.addObject("user", user);
		view.setViewName("user/signUp");
		

		return view;
	}

	@RequestMapping(value = "/user/signUp", method = RequestMethod.POST)
	public void doSignUpPage(UserVO userVO, HttpServletResponse response) {

		try {
			boolean isValidPassword = verify(userVO.getPassword());
			if (isValidPassword) {
				try {
					userService.insertOneUser(userVO);
					PrintWriter writer = response.getWriter();
					writer.append("OK");
					writer.flush();
					writer.close();
				} catch (IOException e) {
					throw new RuntimeException(e.getMessage(), e);
				}

			} else {
				try {
					PrintWriter writer = response.getWriter();
					writer.append("FAIL");
					writer.flush();
					writer.close();
				} catch (IOException e) {
					throw new RuntimeException(e.getMessage(), e);
				}
			}
		} catch (RuntimeException e) {
			throw new RuntimeException("회원가입 에러", e);
		}
	}

	@RequestMapping("/user/signOut")
	public String doSignOutAction(HttpSession session) {

		session.invalidate();
		
		return "redirect:/home";
	}
	
	@RequestMapping("/user/mypage")
	public ModelAndView viewMyPage(HttpSession session) {
		ModelAndView view = new ModelAndView();
		
		UserVO user = (UserVO)session.getAttribute("_USER_");
		List<MessageVO> MessagesBySender = userService.selectAllMessagesBySender(user);
		List<MessageVO> MessagesByReceiver = userService.selectAllMessagesByReceiver(user);
		List<TripVO> tripList = userService.selectAllTripByUserId(user.getUserId());
		List<TripReplyVO> tripReply = new ArrayList<TripReplyVO>();
		List<TripReplyVO> tripReplyList = new ArrayList<TripReplyVO>();
		TripReplyVO replyVO;
		
		for ( int i = 0; i<tripList.size();i++){
			String tripId = tripList.get(i).getTripId();
			String title = tripList.get(i).getTitle();
			tripReply = userService.getAllReplies(tripId);
			if ( title.length() >= 14 ){
				title = title.substring(0, 14)+"...";
				tripList.get(i).setTitle(title);
			}
			for ( int j = 0; j< tripReply.size(); j++){
				replyVO = new TripReplyVO();
				String content = tripReply.get(j).getContent();
				String userId = tripReply.get(j).getUserId();
				if ( content.length() >= 40 ){
					content = content.substring(0, 40)+"...";
				}
				replyVO.setTripId(tripId);
				replyVO.setContent(content);
				replyVO.setUserId(userId);
				tripReplyList.add(replyVO);
			}
	
		}
		for(int i = 0; i < MessagesBySender.size() ; i++){
			String input = MessagesBySender.get(i).getContent();
			if(input.length() >= 14){
			    input = input.substring(0, 14)+"...";
			    MessagesBySender.get(i).setContent(input);
			}
		}
		
		for(int i = 0; i < MessagesByReceiver.size() ; i++){
			String input = MessagesByReceiver.get(i).getContent();
			if(input.length() >= 14){
			    input = input.substring(0, 14)+"...";
			    MessagesByReceiver.get(i).setContent(input);
			}
		}
		
		view.addObject("user", user);
		view.addObject("MessagesBySender",MessagesBySender);
		view.addObject("MessagesByReceiver",MessagesByReceiver);
		view.addObject("tripList",tripList);
		view.addObject("tripReplyList",tripReplyList);
		view.setViewName("/user/myPage");
		
		return view;
	}
	
	@RequestMapping("/message/receive/detail/{id}")
	public ModelAndView viewReceiveMessageDetail(@PathVariable String id) {

		ModelAndView view = new ModelAndView();
		
		MessageVO message = userService.selectOneMessage(id); 
		view.addObject("message", message);
		view.setViewName("/message/receiveDetail");
		
		return view;
	}
	
	@RequestMapping("/message/send/detail/{id}")
	public ModelAndView viewMessageDetail(@PathVariable String id) {
		ModelAndView view = new ModelAndView();
		
		MessageVO message = userService.selectOneMessage(id); 
		view.addObject("message", message);
		view.setViewName("/message/sendDetail");
		
		return view;
	}
	
	@ResponseBody
	@RequestMapping(value="/user/verify", method=RequestMethod.POST)
	public String doVerifyUser(HttpServletResponse response, HttpServletRequest request){
		

		String password = request.getParameter("password");
		boolean isValidPassword = verify(password);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (isValidPassword) {
			map.put("status", "success");
		} else {
			map.put("status", "fail");
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(map);
		
		return json;
		
	}
	
	@RequestMapping(value="/user/modify", method=RequestMethod.POST)
	public String doModifyUser(UserVO userVO, HttpServletResponse response){
		
		System.out.println(userVO.getUserId());
		System.out.println(userVO.getPassword());
		boolean isSuccess = userService.modifyOneUser(userVO);
		
		if (isSuccess){
			return "redirect:/user/mypage";
		}
		else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('정보 수정에 실패 하였습니다.'); history.go(-1);</script>"); 
				out.flush(); 
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="/user/findById/{userId}", method=RequestMethod.POST)
	public Object doFindUserById(@PathVariable String userId, HttpServletResponse response) {
		UserVO user = userService.findUserById(userId);
		
		boolean isSuccess = false;	
		
		if (user != null) {
			isSuccess = true;
		}
		Map<String, Object> data = new HashMap<String, Object>();
		
		if (isSuccess) {
			data.put("userId", user.getUserId());
			data.put("userName", user.getUserName());
			data.put("code", "OK");
		}
		else {
			data.put("code", "FAIL");
		}
		
		return data;
	}
	
	@RequestMapping("/user/cofrimPassword")
	@ResponseBody
	public String doConfirmPassword(HttpServletRequest request){
		
		HttpSession session = request.getSession();
		UserVO user = (UserVO) session.getAttribute("_USER_");
	
		String password = request.getParameter("password");
		user.setPassword(password);
		System.out.println("Controller:"+password);
		UserVO userVO = userService.selectOneUser(user);
		Map<String, Object> map = new HashMap<String, Object>();
		if (userVO != null) {
			map.put("status", "success");
			map.put("user", userVO);
		} else {
			map.put("status", "fail");
		}
		Gson gson = new Gson();
		String json = gson.toJson(map);
		
		return json;
	}

	public boolean verify(String password) {
		String passwordPolicy = "((?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9媛�-�옡]).{8,})";
		Pattern pattern = Pattern.compile(passwordPolicy);
		Matcher matcher = pattern.matcher(password);
		return matcher.matches();
	}
}
