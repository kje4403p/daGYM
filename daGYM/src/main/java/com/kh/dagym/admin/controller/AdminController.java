package com.kh.dagym.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.dagym.admin.model.service.AdminService;
import com.kh.dagym.admin.model.vo.Board;
import com.kh.dagym.admin.model.vo.Member;
import com.kh.dagym.admin.model.vo.Page;
import com.kh.dagym.admin.model.vo.Reply;
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
	
	// 회원 전체 조회
	@RequestMapping("memberList")
	public String memberListView(Model model) {
		List<Member> mList = adminService.selectMList(); 
		model.addAttribute("mList", mList);

		return "admin/memberList";
	}
	
	// 트레이너 전체 조회
	@RequestMapping("trainerList")
	public String trainerListView(Model model) {
		List<Trainer> tList = adminService.selectTList(); 
		model.addAttribute("tList", tList);
		
		return "admin/trainerList";
	}
	
	// 1:1 문의 조회
	@RequestMapping("inquiryList")
	public String inquiryListView(Model model, @RequestParam(value="cp", required=false, defaultValue="1") int cp) {
		int type = 3;
		Page pInfo = adminService.pagination(type, cp);
		
		List<Board> iList = adminService.selectIList(pInfo);
		model.addAttribute("iList", iList);
		model.addAttribute("pInfo", pInfo);
		
		return "admin/inquiryList";
	}
	
	// 1:1 문의 답변
	@RequestMapping("insertAnswer")
	public String insertAnswer(Reply reply, RedirectAttributes rdAttr) {
		System.out.println(reply);
		int result = adminService.insertAnswer(reply);
		
		if(result > 0) {
			rdAttr.addFlashAttribute("status", "success");
			rdAttr.addFlashAttribute("msg", "답변 완료 !");
		} else {
			rdAttr.addFlashAttribute("status", "error");
			rdAttr.addFlashAttribute("msg", "답변 실패");
		}
		
		return "redirect:inquiryList";
	}
	
	// 월별 매출 조회
	@RequestMapping("monthChart")
	public String monthChartView() {
		return "admin/monthChart";
	}
	
	// 트레이너별 매출 조회
	@RequestMapping("trainerChart")
	public String trainerChartView() {
		return "admin/trainerChart";
	}
}