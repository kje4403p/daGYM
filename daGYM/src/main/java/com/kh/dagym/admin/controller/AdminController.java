package com.kh.dagym.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.dagym.admin.model.service.AdminService;
import com.kh.dagym.admin.model.vo.Member;
import com.kh.dagym.admin.model.vo.Trainer;

@Component
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("adminView")
	public String adminView() {
		return "admin/adminMain";
	}
	
	@RequestMapping("memberList")
	public String memberListView(Model model) {
		List<Member> mList = adminService.selectMList(); 
		model.addAttribute("mList", mList);

		return "admin/memberList";
	}
	
	@RequestMapping("trainerList")
	public String trainerListView(Model model) {
		List<Trainer> tList = adminService.selectTList(); 
		model.addAttribute("tList", tList);
		
		return "admin/trainerList";
	}
}
