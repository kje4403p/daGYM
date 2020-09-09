package com.kh.dagym.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
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
	
	// 관리자 로그아웃
	@RequestMapping("logout")
	public String logout(SessionStatus status, RedirectAttributes rdAttr) {
		status.setComplete();
		rdAttr.addFlashAttribute("status", "success");
		rdAttr.addFlashAttribute("msg", "로그아웃 되었습니다.");
		
		return "redirect:/";
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
		
		List<Board> iList = adminService.selectList(pInfo);
		model.addAttribute("iList", iList);
		model.addAttribute("pInfo", pInfo);
		
		return "admin/inquiryList";
	}
	
	// 1:1 문의 답변
	@RequestMapping("insertAnswer")
	public String insertAnswer(Reply reply, RedirectAttributes rdAttr) {
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
	
	// 이벤트 작성 화면 전환
	@RequestMapping("insertEventView")
	public String insertEventView() {
		return "admin/insertEvent";
	}
	
	// 이벤트 작성
	@RequestMapping(value="insertEvent", method=RequestMethod.POST)
	public String insertEvent(Board board, RedirectAttributes rdAttr, HttpServletRequest request,
							@RequestParam(value="images", required=false) List<MultipartFile> images) {
		board.setBoardType(1);
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/uploadImages");
		int result = adminService.insertEvent(board, images, savePath);
		
		String url = null;
		if(result > 0) {
			rdAttr.addFlashAttribute("status", "success");
			rdAttr.addFlashAttribute("msg", "이벤트 작성 완료 !");
			url = "eventList";
		} else {
			rdAttr.addFlashAttribute("status", "error");
			rdAttr.addFlashAttribute("msg", "이벤트 작성 실패");
			url = "insertEvent";
		}
		
		return "redirect:" + url;
	}
	
	// 이벤트 목록 조회
	@RequestMapping("eventList")
	public String eventList(Model model, @RequestParam(value="cp", required=false, defaultValue="1") int cp) {
		int type = 1;
		Page pInfo = adminService.pagination(type, cp);
		
		List<Board> eList = adminService.selectList(pInfo);
		model.addAttribute("eList", eList);
		model.addAttribute("pInfo", pInfo);
		
		return "admin/eventList";
	}
	
	// 트레이너 가입
	@RequestMapping("insertTrainer")
	public String insertTrainer() {
		return "admin/trainerSignUp";
	}
	
	/*
	 * @RequestMapping("insertTrainer2") public String insertTrainer2() { 
	 * return "trainerResulvation/signUpView"; }
	 */
}