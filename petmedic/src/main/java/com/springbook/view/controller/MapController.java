package com.springbook.view.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.pet.map.MapService;
import com.spring.pet.map.MapVO;


@Controller
@SessionAttributes("map")
public class MapController {
	
	@Autowired
	private MapService mapService;
	
	
	//지도검색
		@RequestMapping("/getMapData")
		@ResponseBody
		public List<MapVO> getMapData(
				@RequestParam("key") String key,
                @RequestParam("cate") String cate,
                @RequestParam("condition") String condition, MapVO vo) {
			System.out.println("getMapData 처리");
			System.out.println("getMapData key값" + key);
			vo.setSearchKeyword(key);
			vo.setSearchCondition(condition);
//			vo.setMapTimeOption(requestBody.get("mapTimeOption"));
			vo.setHos_cate(cate);
			
				//유저시간정보 분리
//				String[] dateTimeParts = vo.getMapTimeOption().split(" ");
//		        LocalDate date = LocalDate.parse(dateTimeParts[0], DateTimeFormatter.ofPattern("yyyy-MM-dd"));
//		        LocalTime time = LocalTime.parse(dateTimeParts[1], DateTimeFormatter.ofPattern("HH:mm:ss"));
		        
		        // Use the date and time components as needed
//		        System.out.println("Date: " + date);
//		        System.out.println("Time: " + time);
//		      
//		        vo.setHos_date_now(date);
//		        vo.setHos_time_now(time);
		        
			return mapService.getMapData(vo);
		}
	
}
