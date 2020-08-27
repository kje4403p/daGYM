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
	
}
