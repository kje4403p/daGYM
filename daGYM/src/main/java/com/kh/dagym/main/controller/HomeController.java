package com.kh.dagym.main.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.dagym.admin.model.vo.Board;
import com.kh.dagym.common.Attachment;
import com.kh.dagym.main.model.service.HomeService;

@Controller // 프레젠테이션 레이어, 웹 앱 View에서 전달받은 요청, 전달할 응답을 처리하는 클래스 라는 걸 명시 + Bean 등록
public class HomeController {
	@Autowired
	private HomeService homeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		System.out.println("main 요청"); // 메인controller거치는지 확인.
		// .. : 상위
		// . : 현재
		// xxx/ : 하위
		return "../../main";
	}
	@RequestMapping("/intro")
	public String intro() {
		return "intro/intro";
	}
	@ResponseBody
	@RequestMapping("/eventViews")
	public String eventViews() {
		List<Attachment> list = homeService.eventViews();
		
		
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(list);
		
	}
	
	@ResponseBody
	@RequestMapping("/eventTitle")
	public String eventTitle() {
		List<Board> bList = homeService.eventTitle();
		
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(bList);
		
	}
	
}
