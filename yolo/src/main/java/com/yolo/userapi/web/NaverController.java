package com.yolo.userapi.web;

import java.io.BufferedReader;
import java.io.Console;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.yolo.user.vo.UserVO;
import com.yolo.userapi.service.UserApiService;
import com.yolo.userapi.vo.NaverUserVO;

@Controller
public class NaverController {
	
	private UserApiService userApiService;
	private String id;
	
	public void setUserApiService(UserApiService userApiService) {
		this.userApiService = userApiService;
	}
	
	Logger logger = LoggerFactory.getLogger(NaverController.class);
	
	@RequestMapping("/user/callback")
	public ModelAndView callback() throws IOException {
		return new ModelAndView("user/callback");
	}

	@RequestMapping(value="/user/naver/savetoken", method=RequestMethod.POST)
	public void saveToken(@RequestParam String accessToken, HttpSession session, HttpServletResponse response) {
		NaverUserVO naverUserVO = (NaverUserVO) session.getAttribute("_USER_");
		if ( naverUserVO == null ) {
			naverUserVO = new NaverUserVO();
		}
		
		naverUserVO.setLoginType(UserVO.NAVER);
		naverUserVO.setAccessToken(accessToken);
		session.setAttribute("_USER_", naverUserVO);
		
		if (naverUserVO != null) {
			naverUserInfo(session);
		}
		
		UserVO userVO = userApiService.getOneUser(id);
		logger.info(userVO.getUserId());
		if ( userVO.getUserId().equals("") ) {
			naverUserVO.setUserNaverApiId(id);
			session.setAttribute("_USER_", naverUserVO);
			try {
				PrintWriter write = response.getWriter();
				write.append("OK");
				write.flush();
				write.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		else {
			naverUserVO.setUserNaverApiId(userVO.getUserId());
			session.setAttribute("_USER_", naverUserVO);
			try {
				PrintWriter write = response.getWriter();
				write.append("OK");
				write.flush();
				write.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
		
		
	}
	
	@RequestMapping(value = "/user/naver/userInfo", method = RequestMethod.POST)
	public void naverUserInfo(HttpSession session) {
		NaverUserVO naverUserVO = (NaverUserVO) session.getAttribute("_USER_");

		String token = naverUserVO.getAccessToken().toString();// 네이버 로그인 접근 토큰;
		String header = "Bearer " + token; // Bearer 다음에 공백 추가

		try {
			String apiURL = "https://openapi.naver.com/v1/nid/me";
			URL userInfoUrl = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) userInfoUrl.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", header);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.print("responseCode=" + responseCode);
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			if (responseCode == 200) {
				System.out.println(res.toString());
				Gson gson = new Gson();
				Map result = gson.fromJson(res.toString(), Map.class);
				
				String code = gson.toJson(result.get("response"));
				logger.info(code);
				spritCode(code);
				
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	@RequestMapping(value = "/user/naver/signout", method = RequestMethod.GET)
	public String naverLogout(HttpSession session) {
		NaverUserVO naverUserVO = (NaverUserVO) session.getAttribute("_USER_");
		//클라이언트 id 와 클라이언트 시크릿 써줘야 한다.
		String logoutUrl = "https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=5jcUw1BzWAus2lCeKdeU&client_secret=qrZB4vAHYA&access_token="
				+ naverUserVO.getAccessToken() + "&service_provider=NAVER";
		
		try {
			URL url = new URL(logoutUrl);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.print("responseCode=" + responseCode);
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			if (responseCode == 200) {
				System.out.println(res.toString());
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		session.invalidate();
		return "redirect:/home";
	}
	
	@RequestMapping(value="/user/plusId", method=RequestMethod.POST)
	public void plusId(UserVO userVO, HttpServletResponse response) {
		
		logger.info(userVO.getUserId());
		logger.info(userVO.getUserNaverApiId());
		
		userApiService.setUserId(userVO);
		
		try {
			PrintWriter write = response.getWriter();
			write.append("OK");
			write.flush();
			write.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public void spritCode(String responseCode) {
		String[] code = responseCode.split(",");
		
		String[] idSplit = code[5].split("\"");
		String[] nameSplit = code[6].split("\"");
		
		id = "NA-" + idSplit[3];
		String name = nameSplit[3];
		
		UserVO userVO = new UserVO();
		userVO.setUserNaverApiId(id);
		userVO.setUserNaverApiName(name);
		
		List<UserVO> userList = userApiService.selectAllUser("NAVER");
		
		for( int i = 0; i < userList.size(); i++ ) {
			
			if ( userList.get(i).getUserKakaoApiId().equals(id) ) {
				return;
			}
			else {
				continue;
			}
			
		}	
		
		userApiService.addUserApi(userVO);
		
	}

}
