package com.yolo.trippart.vo;

import org.springframework.web.multipart.MultipartFile;

public class TripPartVO {
	
	private String tripPartId;
	private String tripId;
	private int startTime;
	private int endTime;
	private String timeControl;
	private String place; // 장소 - 키워드
	private MultipartFile file;
	private String content;
	private String map; // 상세주소
	private String realFileName;
	private String x;
	private String y;
	
	public String getTripPartId() {
		return tripPartId;
	}
	public void setTripPartId(String tripPartId) {
		this.tripPartId = tripPartId;
	}
	public String getTripId() {
		return tripId;
	}
	public void setTripId(String tripId) {
		this.tripId = tripId;
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
	public String getTimeControl() {
		return timeControl;
	}
	public void setTimeControl(String timeControl) {
		this.timeControl = timeControl;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
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
	public String getRealFileName() {
		return realFileName;
	}
	public void setRealFileName(String realFileName) {
		this.realFileName = realFileName;
	}
	public String getX() {
		return x;
	}
	public void setX(String x) {
		this.x = x;
	}
	public String getY() {
		return y;
	}
	public void setY(String y) {
		this.y = y;
	}
	
}
