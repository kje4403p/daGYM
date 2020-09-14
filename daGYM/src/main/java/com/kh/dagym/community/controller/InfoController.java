package com.kh.dagym.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.dagym.common.Attachment;
import com.kh.dagym.common.Board;
import com.kh.dagym.common.PageInfo;
import com.kh.dagym.community.model.service.EventService;
import com.kh.dagym.community.model.service.InfoService;

@Controller
@RequestMapping("/info/*")
public class InfoController {
	
	@Autowired
	private InfoService infoService;
	
	@Autowired
	private EventService eventService;
	
	private final int BOARD_TYPE = 2;
	
	@GetMapping("list")
	public String infoList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model) {

		PageInfo pInfo = infoService.pagenation(cp, BOARD_TYPE);


		List<Board> infoList = infoService.selectList(pInfo);

		model.addAttribute("infoList",infoList);
		model.addAttribute("pInfo",pInfo);
		
		return "community/infoList";
	}
	
	@GetMapping("{boardNo}")
	public String boardView(@PathVariable int boardNo, Model model,RedirectAttributes rdAttr) {

		Board board = infoService.selectInfo(boardNo);
		String url = "";

		if(board != null) {
			List<Attachment> files = eventService.selectFiles(boardNo);

			if(!files.isEmpty()) {
				model.addAttribute("files", files);
				files.stream().forEach(System.out::println);
			}
			model.addAttribute("board", board);
			url = "community/infoView";
		} else {
			// 존재하지 않은 게시글입니다 출력 후 이전 주소로 리다이렉트
			rdAttr.addFlashAttribute("status","error");
			rdAttr.addFlashAttribute("msg","해당 게시글 존재 X");
			rdAttr.addFlashAttribute("status","error");
			url = "redirect:/info/list";
		}
		return url;
	}



}
