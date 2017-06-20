package com.yolo.daily.web;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yolo.common.web.DownloadUtil;
import com.yolo.daily.service.DailyService;
import com.yolo.daily.vo.DailyVO;
import com.yolo.dailyMain.vo.DailyMainListVO;
import com.yolo.dailyMain.vo.DailyMainSearchVO;
import com.yolo.dailyMain.vo.DailyMainVO;

@Controller
public class DailyController {

	private DailyService dailyService;
	
	public void setDailyService(DailyService dailyService) {
		this.dailyService = dailyService;
	}
	
	
	//받아오기 write
	
	@RequestMapping(value ="/daily/write", method=RequestMethod.GET)
	public String dailyWriteView(){
		
		return "daily/write";
		
	}
	
	
	@RequestMapping(value= "/daily/write", method=RequestMethod.POST)
	public String dailyWriteAction(DailyVO dailyVO, DailyMainVO dailyMainVO){
		
		List<DailyVO> dailyVOs = new ArrayList<DailyVO>();
		
		//1. 잘라서 받아오기 
		System.out.println(dailyVO.getPlace());
		String place = dailyVO.getPlace();
		String startString = dailyVO.getStartString();
		String endString = dailyVO.getEndString();
		String timeController= dailyVO.getTimeController();
		
		
		
		// split()을 이용해 ','를 기준으로 문자열을 자른다.
        // split()은 지정한 문자를 기준으로 문자열을 잘라 배열로 반환한다.
        String places[] = place.split(",");
        String startStrings[] = startString.split(",");
		String endStrings[] = endString.split(",");  
		String timeControllers[] = timeController.split(",");
		
		
		//dailyMainId 받아오기 
		String dailyId = dailyService.getDailyId();
		
		//dailyMain받아오기
		String title = dailyMainVO.getTitle();
		String overAll = dailyMainVO.getOverAll();
		
		//dailyMain쪽 set
		DailyMainVO dailyMain = new DailyMainVO();
		
		dailyMain.setDailyId(dailyId);
		dailyMain.setTitle(title);
		dailyMain.setOverAll(overAll);
		
		
		dailyService.addNewDailyMain(dailyMain);
		
		
		
        for(int i=0 ; i<places.length ; i++){
        	//각각 VO에 set 해주기 , dailyPart 쪽
        	
        
            dailyVO.setPlace(places[i]);
            int startTime = Integer.parseInt(startStrings[i]);
            int endTime= Integer.parseInt(endStrings[i]);
            
            dailyVO.setStartTime(startTime);
            dailyVO.setEndTime(endTime);
            dailyVO.setTimeController(timeControllers[i]);
            dailyVO.setDailyId(dailyId);
            
            dailyVOs.add(dailyVO);
            
            //**업로드 부분**
            if(dailyVO.getDailyVOList().get(i).getFile() !=null && !dailyVO.getDailyVOList().get(i).getFile().isEmpty()){
            	
            	String filePath="D:\\"+dailyVO.getDailyVOList().get(i).getFile().getOriginalFilename();
            	File newFile = new File(filePath);
            	try {
					dailyVO.getDailyVOList().get(i).getFile().transferTo(newFile);
					String dailyFile = dailyVO.getDailyVOList().get(i).getFile().getOriginalFilename();
					 dailyVO.setDailyFile(dailyFile);
				} catch (IllegalStateException | IOException e) {
			
					throw new RuntimeException(e.getMessage(), e);
				}
            }
            else {
            	dailyVO.setDailyFile(null);
            }
            
            String content = dailyVO.getDailyVOList().get(i).getContent();
            dailyVO.setContent(content);
           
            boolean isSuccess = dailyService.insertDailyPart(dailyVO);
            
           
        }

		return "daily/write";
	}
	
	
	@RequestMapping("/daily/list")
	public ModelAndView ViewDailyMain(DailyMainSearchVO dailyMainSearchVO){
		
		ModelAndView view = new ModelAndView();
		
		DailyMainListVO dailyMainListVO = dailyService.getAllDailyMain(dailyMainSearchVO);
		
		view.setViewName("daily/list");
		
		view.addObject("dailyMainListVO", dailyMainListVO.getDailyMainVOs());
		
		return view;

	}
	
	@RequestMapping(value = "/download/{id}")
	public void downloadAction(@PathVariable String id, HttpServletRequest request, 
			HttpServletResponse response){
		
		String 	 filePath ="D:\\";
		
		List<DailyVO> dailyParts = dailyService.getDailyPartsByDLID(id);
		
		String realFileName = dailyParts.get(0).getDailyFile();
	
		DownloadUtil downloadUtil = DownloadUtil.getInstance(filePath);
		
		try {
			
			downloadUtil.download(request, response, realFileName, realFileName);
			
		} catch (UnsupportedEncodingException e) {
			
			throw new RuntimeException(e.getMessage(), e);
		}
		
	}
	
	@RequestMapping("/daily/detail/{id}")
	public ModelAndView viewDetailPage(@PathVariable String id){
		
		ModelAndView view = new ModelAndView();
		
		List<DailyVO> dailyPartList = dailyService.getDailyPartsByDLID(id);
		DailyVO dailyVO = dailyPartList.get(0);
		
		view.addObject("dailyVOs",dailyPartList);
		view.addObject("dailyVO",dailyVO);
		
		view.setViewName("daily/detail");
		
		return view;
		
	}
	
	@RequestMapping(value = "/daily/download/{id}")
	public void downloadDetailAction(@PathVariable String id, HttpServletRequest request, 
			HttpServletResponse response){
		
		String 	 filePath ="D:\\";
		
		DailyVO dailyPart = dailyService.getOneDailyPart(id);
		
		String realFileName = dailyPart.getDailyFile();
		
		DownloadUtil downloadUtil = DownloadUtil.getInstance(filePath);
		
		try {
			
			downloadUtil.download(request, response, realFileName, realFileName);
			
		} catch (UnsupportedEncodingException e) {
			
			throw new RuntimeException(e.getMessage(), e);
			
		}
		
	}
	@RequestMapping(value = "/daily/delete/{id}" , method=RequestMethod.GET)
	public String deleteActionPage(@PathVariable String id){
		
		boolean isSuceess = dailyService.removeDailyMain(id);
		
		return "redirect:/daily/list";
		
	}

}
