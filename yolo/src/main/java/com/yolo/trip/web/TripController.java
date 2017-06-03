package com.yolo.trip.web;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.yolo.common.web.checker.ExtFilter;
import com.yolo.common.web.checker.ExtensionFilter;
import com.yolo.common.web.checker.ExtensionFilterFactory;
import com.yolo.trip.service.TripService;
import com.yolo.trip.vo.TripVO;

@Controller
public class TripController {
	//private Logger logger = LoggerFactory.getLogger(TripController.class);
	private TripService tripService;
	
	public void setTripService(TripService tripService) {
		this.tripService = tripService;
	}
	
	@RequestMapping(value="/trip/write",method=RequestMethod.GET)
	public String viewWritePage(){
		
		return "trip/write";
		
	}
	@RequestMapping(value="/trip/write",method=RequestMethod.POST)
	public String insertNewTripPart(HttpServletRequest request, TripVO tripVO){
		List<MultipartFile> files = tripVO.getTripPartListVO().getFile();
		
		List<String> displayFileName = new ArrayList<String>();
		List<String> realFileName  = new ArrayList<String>();
		
		if(tripVO.getTripPartListVO().getFile() != null && !tripVO.getTripPartListVO().getFile().isEmpty()){
			for ( int i = 0 ; i< files.size(); i++ ){
				String originalfileName = files.get(i).getOriginalFilename();
				String fileName = UUID.randomUUID().toString();
				String filePath = "C:\\Users\\Admin\\Documents\\YOLO\\yolo\\src\\main\\webapp\\WEB-INF\\resources\\img"+fileName;
				File newFile = new File(filePath);
				
				try {
					files.get(i).transferTo(newFile);
					ExtensionFilter filter = ExtensionFilterFactory.getFilter(ExtFilter.APACHE_TIKA);
					boolean isImage = filter.doFilter(newFile.getAbsolutePath(), "image/gif" , "image/jpeg", "image/png", "image/bmp" );
					if(!isImage){
						newFile.delete();
						displayFileName.add("");
						realFileName.add("");
					}
					else {
						displayFileName.add(fileName);
						realFileName.add(originalfileName);
					}
				} catch (IllegalStateException e) {
					throw new RuntimeException(e.getMessage(),e);
				}catch (IOException e) {
					throw new RuntimeException(e.getMessage(),e);
				}
		
			}
		}
	
		boolean isSuccess = tripService.addNewOneTrip(tripVO);
		System.out.println(isSuccess);
		return "trip/list";
		
	}
}
