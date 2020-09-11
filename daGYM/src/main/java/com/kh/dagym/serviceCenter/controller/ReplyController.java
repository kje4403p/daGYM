package com.kh.dagym.serviceCenter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.dagym.serviceCenter.service.ReplyService;
import com.kh.dagym.serviceCenter.vo.Sreply;


@Controller
@RequestMapping("/reply/")
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	@ResponseBody
	@RequestMapping("selectList/{boardNo}")
	public String selectList(@PathVariable int boardNo) {
		
		
		List<Sreply> rList = replyService.selectList(boardNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create();
		return gson.toJson(rList);
	}

	
}
