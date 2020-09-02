package com.kh.dagym.serviceCenter.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.dagym.common.Board;
import com.kh.dagym.common.PageInfo;
import com.kh.dagym.serviceCenter.service.ServiceBoard;


@Controller
@RequestMapping("/service/*")
public class ServiceController {
	    
	@Autowired
	private ServiceBoard serviceBoard;
	
	@RequestMapping("questionList/{type}")
	public String questionList(@PathVariable int type,@RequestParam(value="cp",required=false, defaultValue="1") int cp,Model model) {
		
		
		
		PageInfo pInfo = serviceBoard.pagination(type,cp);
		
		
		return "serviceCenter/questionList";
	}
	
	@RequestMapping("faq/{type}")
	public String faq(@PathVariable int type,@RequestParam(value="cp",required=false, defaultValue="1") int cp,
			Model model) {
		
		PageInfo pInfo = serviceBoard.pagination(type, cp);
		
		List<Board> bList = serviceBoard.selectFaqList(pInfo);
		
		model.addAttribute("bList", bList);
		model.addAttribute("pInfo", pInfo);
		
		return "serviceCenter/faq";
	}
	
	//faq 게시글 상세조회
	@ResponseBody
	@RequestMapping(value="{type}/{boardNo}",method=RequestMethod.POST)
	public String faqView(@PathVariable int type,
						  @PathVariable int boardNo,Model model,
						   RedirectAttributes rdAttr,HttpServletRequest request) {
		System.out.println("혹인");
		Board board = serviceBoard.selectFaqBoard(boardNo);
		
		String url = null;
		if(board != null) {
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			return gson.toJson(board);
		}
		return null;
	}

}
