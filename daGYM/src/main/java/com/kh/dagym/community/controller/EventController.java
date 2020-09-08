package com.kh.dagym.community.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.dagym.common.Attachment;
import com.kh.dagym.common.Board;
import com.kh.dagym.common.PageInfo;
import com.kh.dagym.community.model.service.EventService;
import com.kh.dagym.member.model.vo.Member;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/event/*")
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	private final int BOARD_TYPE = 1;
	

	@GetMapping("list")
	public String eventList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model) {
		long start = System.currentTimeMillis();
		
		PageInfo pInfo = eventService.pagenation(BOARD_TYPE,cp);
		long end = System.currentTimeMillis();
		
		System.out.println((end - start)/1000 + "초");
		
		List<Board> eventList = eventService.selectList(pInfo);
		
		model.addAttribute("eventList",eventList);
		model.addAttribute("pInfo",pInfo);
		

		return "community/eventList";
	}
	
	@GetMapping("insert")
	public String boardInsertForm(@RequestParam int boardType, Model model) {
		model.addAttribute("boadType", boardType);
		Member loginMember = (Member)model.getAttribute("loginMember");
		return "community/eventInsert";
	}
	
	@PostMapping("insert")
	public String boardInsert(@RequestParam int boardType,Board board, Model model, RedirectAttributes rdAttr,
								@RequestParam(value = "images", required = false) List<MultipartFile> images, HttpServletRequest request) {
		System.out.println(board);
		Member loginMember = (Member)model.getAttribute("loginMember");
		board.setBoardType(boardType);
		board.setBoardWriter(loginMember.getMemberNo() + "");
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/uploadImages");
		int result = eventService.insertBoard(board, images, savePath);
		String status;
		String msg;
		String path;
		if (result > 0) {
			status = "success";
			msg = "게시글 삽입 성공";
			path = "redirect:list?cp=1";
		} else {
			status = "error";
			msg = "게시글 삽입 실패";
			path = "insert";
		}
		rdAttr.addFlashAttribute("status",status);
		rdAttr.addFlashAttribute("msg",msg);
		
		return path;
	}
	
	@GetMapping("{boardNo}")
	public String boardView(@PathVariable int boardNo, Model model,RedirectAttributes rdAttr) {
		
		Board board = eventService.selectBoard(boardNo);
		String url = "";
		
		if(board != null) {
			List<Attachment> files = eventService.selectFiles(boardNo);
			
			if(!files.isEmpty()) {
				model.addAttribute("files", files);
				files.stream().forEach(System.out::println);
			}
			model.addAttribute("board", board);
			url = "community/eventView";
		} else {
			// 존재하지 않은 게시글입니다 출력 후 이전 주소로 리다이렉트
			rdAttr.addFlashAttribute("status","error");
			rdAttr.addFlashAttribute("msg","해당 게시글 존재 X");
			rdAttr.addFlashAttribute("status","error");
			url = "redirect:/event/list";
		}
		return url;
	}
	
	@GetMapping("{boardNo}/delete")
	public String deleteEvent(@PathVariable int boardNo, RedirectAttributes rdAttr,HttpServletRequest request) {
		int result = eventService.deleteEvent(boardNo);
		String status;
		String msg;
		String path;
		if (result > 0) {
			status = "success";
			msg = "게시글 삭제 성공";
			path = "/event/list";
		} else {
			status = "error";
			msg = "게시글 삭제 실패";
			path = request.getHeader("referer");
		}
		
		rdAttr.addFlashAttribute("status", status);
		rdAttr.addFlashAttribute("msg",msg);
		return "redirect:"+path;
	}
	
	
}
