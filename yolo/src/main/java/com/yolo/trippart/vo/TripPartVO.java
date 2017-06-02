package com.yolo.trippart.vo;

import org.springframework.web.multipart.MultipartFile;

public class TripPartVO {
	
	private String tripPartId;
	private String tripId;
	private int startTime;
	private int endTime;
	private String timeControl;
	private String place;
	private MultipartFile file;
	private String content;
	private String map;
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
	


}
