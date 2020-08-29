package com.kh.dagym.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dagym.common.PageInfo;
import com.kh.dagym.community.model.service.EventService;
import com.kh.dagym.community.model.service.EventServiceImpl;

@Controller
@RequestMapping("/event/*")
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	private final int BOARD_TYPE = 1;
	

	@GetMapping("list")
	public String eventList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp) {
		long start = System.currentTimeMillis();
		
		PageInfo pInfo = eventService.pagenation(BOARD_TYPE,cp);
		long end = System.currentTimeMillis();
		
		System.out.println((end - start)/1000 + "초");

		return "community/eventList";
	}
}
