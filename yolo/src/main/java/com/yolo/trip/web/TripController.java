package com.yolo.trip.web;


import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yolo.common.web.DownloadUtil;
import com.yolo.common.web.ListPageExplorer;
import com.yolo.common.web.PageExplorer;
import com.yolo.common.web.checker.ExtFilter;
import com.yolo.common.web.checker.ExtensionFilter;
import com.yolo.common.web.checker.ExtensionFilterFactory;
import com.yolo.trip.service.TripService;
import com.yolo.trip.vo.TripListVO;
import com.yolo.trip.vo.TripSearchVO;
import com.yolo.trip.vo.TripVO;
import com.yolo.trippart.vo.TripPartVO;

@Controller
public class TripController {
	//private Logger logger = LoggerFactory.getLogger(TripController.class);
	private TripService tripService;
	
	public void setTripService(TripService tripService) {
		this.tripService = tripService;
	}
	
	@RequestMapping("/trip/list")
	public ModelAndView viewListPage(TripSearchVO tripSearchVO){
		
		TripListVO tripList = tripService.selectAllTrips(tripSearchVO);
		ModelAndView view = new ModelAndView();
		
		PageExplorer pageExplorer = new ListPageExplorer(tripList.getPager());
		String pager = pageExplorer.getPagingList("pageNo", "[@]", "�씠�쟾", "�떎�쓬", "searchForm");
		
		view.setViewName("trip/list");
		view.addObject("tripList",tripList);
		view.addObject("pager",pager);
		
		return view;
		
	}
	
	@RequestMapping(value="/trip/write",method=RequestMethod.GET)
	public String viewWritePage(){
		
		return "trip/write";
		
	}
	
	@RequestMapping(value="/trip/write",method=RequestMethod.POST)
	public String insertNewTripPart(HttpServletRequest request, TripVO tripVO){
		
		List<MultipartFile> files = tripVO.getTripPartListVO().getFile();
		
		List<String> realFileName  = new ArrayList<String>();
		
		if(tripVO.getTripPartListVO().getFile() != null && !tripVO.getTripPartListVO().getFile().isEmpty()){
			for ( int i = 0 ; i< files.size(); i++ ){
				String fileName = files.get(i).getOriginalFilename();
				
				System.out.println(fileName);
				String filePath = "C:\\Users\\owner\\Documents\\YOLO\\yolo\\src\\main\\webapp\\WEB-INF\\resources\\img\\"+fileName;
				File newFile = new File(filePath);
				
				try {
					files.get(i).transferTo(newFile);
					ExtensionFilter filter = ExtensionFilterFactory.getFilter(ExtFilter.APACHE_TIKA);
					boolean isImage = filter.doFilter(newFile.getAbsolutePath(), "image/gif" , "image/jpeg", "image/png", "image/bmp" );
					
					if(!isImage){
						newFile.delete();
						realFileName.add("");
					}
					else {
						realFileName.add(fileName);
					}
				} catch (IllegalStateException e) {
					throw new RuntimeException(e.getMessage(),e);
				}catch (IOException e) {
					throw new RuntimeException(e.getMessage(),e);
				}
		
			}
		}
		
		tripVO.getTripPartListVO().setRealFileName(realFileName);
		
		boolean isSuccess = tripService.addNewOneTrip(tripVO);
	
		if ( isSuccess ){
			return "redirect:/trip/list";
		}
		else {
			return "redirect:/trip/write";
		}
		
	}
	
	@RequestMapping("/trip/detail/{tripId}")
	public ModelAndView viewDetailPage(@PathVariable String tripId){
		ModelAndView view = new ModelAndView();
		
		List<TripPartVO> tripPartList = tripService.selectTripPartByTripId(tripId);
		
		view.setViewName("/trip/detail");
		view.addObject("tripPartList",tripPartList);
		view.addObject("tripId",tripId);
		return view;
		
	}
	
	@RequestMapping("/trip/delete/{tripId}")
	public String DoDeletePage(@PathVariable String tripId){
	
		boolean isSuccess = tripService.removeTrip(tripId);
		
		if(isSuccess){
			return "redirect:/trip/list";
		}
		else {
			return "redirect:/trip/detail"+tripId;
		}
		
	}
	
	
}
