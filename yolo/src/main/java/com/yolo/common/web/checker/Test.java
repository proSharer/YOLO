package com.yolo.common.web.checker;

public class Test {

	public static void main(String[] args) {
		
		ExtensionFilter filter = ExtensionFilterFactory.getFilter(ExtFilter.COMPARE_EXTENSION);
		boolean isWrite = filter.doFilter("D:\\ÇØ½æ\\HAESOME_160114.pdf", "pdf");
		System.out.println(isWrite);
		
		filter = ExtensionFilterFactory.getFilter(ExtFilter.JMIME_MAGIC);
		isWrite = filter.doFilter("D:\\ÇØ½æ\\HAESOME_160114.pdf", "application/pdf");
		System.out.println(isWrite);
		
		filter = ExtensionFilterFactory.getFilter(ExtFilter.APACHE_TIKA);
		isWrite = filter.doFilter("D:\\ÇØ½æ\\HAESOME_160114.pdf", "application/pdf");
		System.out.println(isWrite);
	}
	
}

