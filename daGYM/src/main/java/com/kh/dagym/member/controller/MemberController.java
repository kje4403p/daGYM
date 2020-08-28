package com.kh.dagym.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.dagym.member.model.service.MemberService;

@Component
@RequestMapping("/member/*")

public class MemberController {
	@Autowired
	private MemberService memberService;
	
	//로그인 화면 전환 메소드
	@RequestMapping("login")
	public String loginView() {
		return "member/login";
	}
	
	// 마이페이지 화면 전환 메소드
			@RequestMapping("mypage")
			public String myPageView() {
				return "member/myPage";
		}
			
	// 내 게시글 화면 전환 메소드
			@RequestMapping("mytext")
			public String myTextView() {
				return "member/myText";
		}
			
	// 내 스케줄 화면 전환 메소드
			@RequestMapping("myschedule")
			public String myScheduleView() {
				return "member/mySchedule";
		}		
}
