package com.kh.dagym.serviceCenter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@ResponseBody
	@RequestMapping(value="updateReply/{boardNo}",produces = "application/text; charset=utf-8")
	public String updateReply(@PathVariable int boardNo,Sreply reply) {
		reply.setBoardNo(boardNo);
		System.out.println(reply.getContent());
		int result= replyService.updateReply(reply);
		System.out.println(result+"hhhhh");
		String str = "댓글수정";
		
		if(result >0) {
			str +=" 성공";
		}else {
			str +="실패";
		}
		
		return str;
	}
	
	//댓글 삭제 
	@ResponseBody
	@RequestMapping(value="deleteReply/{boardNo}",produces = "application/text; charset=utf-8")
	public String deleteReply(int replyNo) {
	
		int result = replyService.deleteReply(replyNo);
		System.out.println(result);
		String str= "댓글 삭제";
		if(result>0) {
			str += "성공";
		}else {
			str += "실패";
		}
		return str;
	}
	
	@ResponseBody
	@RequestMapping(value="insertReply/{boardNo}",produces = "application/text; charset=utf-8")
	public String insertReply(Sreply reply,@PathVariable int boardNo) {
		
		reply.setBoardNo(boardNo);
		
		int result = replyService.insertReply(reply);
		
		String str = "댓글 삽입";
		if(result >0) {
			str += "성공";
		}else {
			str += "실패";
		}
		
		return str;
	}

	
}
