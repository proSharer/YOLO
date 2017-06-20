package com.yolo.daily.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class DailyVO {

	
	
	private String dailyPartId;
	private String dailyId;
	private int	startTime;
	private int	endTime;
	private String timeController;
	private String place;
	private String dailyFile;
	private String content;
	private String map;
	
	
	private String startString;
	private String endString;
	private MultipartFile file;
	
	

	 public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getStartString() {
		return startString;
	}
	public void setStartString(String startString) {
		this.startString = startString;
	}
	public String getEndString() {
		return endString;
	}
	public void setEndString(String endString) {
		this.endString = endString;
	}
	private List<DailyVO> dailyVOList = null;


	
	
	public List<DailyVO> getDailyVOList() {
		if(dailyVOList == null){
			dailyVOList = new ArrayList<DailyVO>();
		}
		return dailyVOList;
	}
	public void setDailyVOList(List<DailyVO> dailyVOList) {
		this.dailyVOList = dailyVOList;
	}
	public String getDailyPartId() {
		
		return dailyPartId;
	}
	public void setDailyPartId(String dailyPartId) {
		this.dailyPartId = dailyPartId;
	}
	public String getDailyId() {
		return dailyId;
	}
	public void setDailyId(String dailyId) {
		this.dailyId = dailyId;
	}
	public int getStartTime() {
		return startTime;
	}
	public void setStartTime(int startTime) {
		this.startTime = startTime;
	}
	public int getEndTime() {
		return endTime;
	}
	public void setEndTime(int endTime) {
		this.endTime = endTime;
	}
	public String getTimeController() {
		return timeController;
	}
	public void setTimeController(String timeController) {
		this.timeController = timeController;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getDailyFile() {
		if(dailyFile == null){
			dailyFile="nophoto.jpg";
		}
		return dailyFile;
	}
	public void setDailyFile(String dailyFile) {
		this.dailyFile = dailyFile;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMap() {
		return map;
	}
	public void setMap(String map) {
		this.map = map;
	}
	
	
	
	
	
}
