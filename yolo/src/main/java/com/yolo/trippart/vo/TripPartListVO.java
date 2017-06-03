package com.yolo.trippart.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class TripPartListVO {
	
	private List<String> tripPartId;
	private List<String> tripId;
	private List<Integer> startTime;
	private List<Integer> endTime;
	private List<String> timeControl;
	private List<String> place;
	private MultipartFile file;
	private List<String> content;
	private List<String> map;

	public List<String> getTripPartId() {
		return tripPartId;
	}

	public void setTripPartId(List<String> tripPartId) {
		this.tripPartId = tripPartId;
	}

	public List<String> getTripId() {
		return tripId;
	}

	public void setTripId(List<String> tripId) {
		this.tripId = tripId;
	}

	public List<Integer> getStartTime() {
		return startTime;
	}

	public void setStartTime(List<Integer> startTime) {
		this.startTime = startTime;
	}

	public List<Integer> getEndTime() {
		return endTime;
	}

	public void setEndTime(List<Integer> endTime) {
		this.endTime = endTime;
	}

	public List<String> getTimeControl() {
		return timeControl;
	}

	public void setTimeControl(List<String> timeControl) {
		this.timeControl = timeControl;
	}

	public List<String> getPlace() {
		return place;
	}

	public void setPlace(List<String> place) {
		this.place = place;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public List<String> getContent() {
		return content;
	}

	public void setContent(List<String> content) {
		this.content = content;
	}

	public List<String> getMap() {
		return map;
	}

	public void setMap(List<String> map) {
		this.map = map;
	}

	
	


}
