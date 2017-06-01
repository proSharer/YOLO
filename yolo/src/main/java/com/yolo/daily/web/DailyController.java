package com.yolo.daily.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yolo.daily.service.DailyService;
import com.yolo.daily.vo.DailyVO;

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
	public String dailyWriteAction(DailyVO dailyVO){
		
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
		
        for(int i=0 ; i<places.length ; i++){
        	//각각 VO에 set 해주기 
        	
        	System.out.println("places["+i+"] : "+ places[i]);
            dailyVO.setPlace(places[i]);
            int startTime = Integer.parseInt(startStrings[i]);
            int endTime= Integer.parseInt(endStrings[i]);
            
            dailyVO.setStartTime(startTime);
            dailyVO.setEndTime(endTime);
            dailyVO.setTimeController(timeControllers[i]);
            
            dailyVOs.add(dailyVO);
            
            String content = dailyVO.getDailyVOList().get(i).getContent();
            dailyVO.setContent(content);
            boolean isSuccess = dailyService.insertDailyPart(dailyVO);
            
           
        }
      
        
		
		
		
		return "daily/write";
	}
	
	
	
}
