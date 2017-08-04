package com.yolo.trip.common.weather.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yolo.common.web.DownloadUtil;
import com.yolo.trip.common.region.constant.RegionConst;

@Controller
public class WeatherController {
	
	@RequestMapping(value="/weather/download/{realFileName}")
	public void downloadImage(@PathVariable String realFileName, HttpServletRequest request, HttpServletResponse response) {
		String imagePath = "D:\\yoloImg\\";
		
		DownloadUtil downloadUtil = DownloadUtil.getInstance(imagePath);
		realFileName = realFileName + ".png";
		
		try {
			downloadUtil.download(request, response, realFileName, realFileName);

		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(e.getMessage(), e);
		}
	}
	
	@RequestMapping(value="/weather/{region}")
	public ModelAndView testView(@PathVariable String region) {
		ModelAndView view = new ModelAndView();
		System.out.println(region);
		
		Double latitude = 0.0;
		Double longitude = 0.0;
		
		switch (region) {
		case "서울":
			latitude = RegionConst.LAT_SEOUL;
			longitude = RegionConst.LON_SEOUL;
			break;
		case "경기":
			latitude = RegionConst.LAT_GYEONGGI;
			longitude = RegionConst.LON_GYEONGGI;
			break;
		case "인천":
			latitude = RegionConst.LAT_INCHEON;
			longitude = RegionConst.LON_INCHEON;
			break;
		case "강원":
			latitude = RegionConst.LAT_GANGWON;
			longitude = RegionConst.LON_GANGWON;
			break;
		case "전남":
			latitude = RegionConst.LAT_JUNNAM;
			longitude = RegionConst.LON_JUNNAM;
			break;
		case "광주":
			latitude = RegionConst.LAT_GUANGJU;
			longitude = RegionConst.LON_GUANGJU;
			break;
		case "경남":
			latitude = RegionConst.LAT_KYEONGNAM;
			longitude = RegionConst.LON_KYEONGNAM;
			break;
		case "경북":
			latitude = RegionConst.LAT_KYEONGBUK;
			longitude = RegionConst.LON_KYEONGBUK;
			break;
		case "충남":
			latitude = RegionConst.LAT_CHUNGNAM;
			longitude = RegionConst.LON_CHUNGNAM;
			break;
		case "충북":
			latitude = RegionConst.LAT_CHUNGBUK;
			longitude = RegionConst.LON_CHUNGBUK;
			break;
		case "전북":
			latitude = RegionConst.LAT_JEONBUK;
			longitude = RegionConst.LON_JEONBUK;
			break;
		default:
			break;
		}
		
		StringBuffer result = new StringBuffer();
		BufferedReader rd = null;
		HttpURLConnection conn = null;
		
		try {
			
			String stringUrl = "http://apis.skplanetx.com/weather/summary?lon="+ longitude + "&stnid=&lat=" + latitude + "&version=1";
			
			URL url = new URL(stringUrl);
			conn = (HttpURLConnection) url.openConnection();
			
			conn.setRequestMethod("GET");
			conn.addRequestProperty("appKey", "24a3b53a-60c6-31e6-862f-2399ecba4814");
			
			
			if (conn.getResponseCode() >= 400) {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			}
			
			String line;
			while ((line = rd.readLine()) != null) {
				result.append(line);
			}
			
			System.out.println(result.toString());
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		finally {
			if ( rd != null ) {
				try {
					rd.close();
				} catch (IOException e) {}
			}
			
			if ( conn != null ) {
				conn.disconnect();
			}
			
		}
		
		
		JSONObject jsonObject = (JSONObject)JSONValue.parse(result.toString());
		
		JSONObject resultObject = (JSONObject)jsonObject.get("result");
		String message = (String)resultObject.get("message");
		
		if (message.equals("성공")) {
			JSONObject weatherObject = (JSONObject)jsonObject.get("weather");
			JSONArray summaryArray = (JSONArray)weatherObject.get("summary");
			
			JSONObject todayObject = (JSONObject) summaryArray.get(0);
			todayObject = (JSONObject)todayObject.get("today");
			
			JSONObject skyObject = (JSONObject)todayObject.get("sky");
			String imageName;
			
			switch (((String)skyObject.get("code")).toString()) {
			case "SKY_D01":
				imageName = "Sunny";
				break;
			case "SKY_D02":
				imageName = "Mostly Cloudy";
				break;
			case "SKY_D03":
				imageName = "Cloudy";
				break;
			case "SKY_D04":
				imageName = "Haze";
				break;
			case "SKY_D05":
				imageName = "Drizzle";
				break;
			case "SKY_D06":
				imageName = "Snow";
				break;
			case "SKY_D07":
				imageName = "Snow";
				break;
			default:
				imageName = "";
				break;
			}
			
			JSONObject temperatureObject = (JSONObject)todayObject.get("temperature");
			
			Double tmax = Double.parseDouble((String)temperatureObject.get("tmax"));
			Double tmin = Double.parseDouble((String)temperatureObject.get("tmin"));
			
			view.addObject("realFileName", imageName);
			view.addObject("tmax", tmax);
			view.addObject("tmin", tmin);
		}
		
		view.setViewName("weather/weather");
		
		return view;
	}

}
