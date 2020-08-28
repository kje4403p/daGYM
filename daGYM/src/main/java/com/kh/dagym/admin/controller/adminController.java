package com.kh.dagym.admin.controller;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

@Component
@RequestMapping("/admin/*")
public class adminController {
	
	@RequestMapping("adminView")
	public String adminView() {
		return "admin/adminMain";
	}
	
	@RequestMapping("memberList")
	public String memberListView() {
		return "admin/memberList";
	}
	
	@RequestMapping("trainerList")
	public String trainerListView() {
		return "admin/trainerList";
	}
}
