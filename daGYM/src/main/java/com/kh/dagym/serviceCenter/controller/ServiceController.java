package com.kh.dagym.serviceCenter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dagym.common.Board;
import com.kh.dagym.common.PageInfo;
import com.kh.dagym.serviceCenter.service.ServiceBoard;


@Controller
@RequestMapping("/service/*")
public class ServiceController {
	    //
	@Autowired
	private ServiceBoard serviceBoard;
	
	@RequestMapping("questionList/{type}")
	public String questionList(@PathVariable int type,@RequestParam(value="cp",required=false, defaultValue="1") int cp,
			Model model) {
		
		
		
		PageInfo pInfo = serviceBoard.pagination(type,cp);
		
		List<Board> boardList = serviceBoard.selectList(pInfo);
		
		model.addAttribute("boardList", boardList);
		
		
		return "serviceCenter/questionList";
	}

}
