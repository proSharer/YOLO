package com.yolo.common.web;

public class EhCacheHelper {
	
	private static EhCacheUtil ehcacheUtil;
	
	public void setEhcacheUtil(EhCacheUtil ehcacheUtil) {
		EhCacheHelper.ehcacheUtil = ehcacheUtil;
	}
		
	public static EhCacheUtil getCache() {
		return EhCacheHelper.ehcacheUtil;
	}
		
}
