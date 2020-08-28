package com.kh.dagym.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dagym.common.PageInfo;
import com.kh.dagym.community.service.EventService;

@Controller
@RequestMapping("/event/*")
public class EventController {
	
	private EventService eventService;
	
	private final int BOARD_TYPE = 1;
	
	@Autowired
	public EventController(EventService eventService) {
		super();
		this.eventService = eventService;
	}

	@GetMapping("list")
	public String eventList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp) {
		
		PageInfo pInfo = eventService.pagenation(BOARD_TYPE, cp);
		
		return null;
	}
}
