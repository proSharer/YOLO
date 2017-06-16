package com.yolo.trip.vo;

public class TripSearchVO {
	
	private String pageNo;
	private int startArticleNumber;
	private int endArticleNumber;
	private String keyword;
	private String searchType;
	
	public String getPageNo() {
		return pageNo;
	}
	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}
	public int getStartArticleNumber() {
		return startArticleNumber;
	}
	public void setStartArticleNumber(int startArticleNumber) {
		this.startArticleNumber = startArticleNumber;
	}
	public int getEndArticleNumber() {
		return endArticleNumber;
	}
	public void setEndArticleNumber(int endArticleNumber) {
		this.endArticleNumber = endArticleNumber;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
}
