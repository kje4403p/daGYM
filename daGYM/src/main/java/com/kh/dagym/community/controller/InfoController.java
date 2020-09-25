package com.kh.dagym.community.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.dagym.common.Attachment;
import com.kh.dagym.common.Board;
import com.kh.dagym.common.PageInfo;
import com.kh.dagym.common.Reply;
import com.kh.dagym.community.model.service.EventService;
import com.kh.dagym.community.model.service.InfoService;
import com.kh.dagym.community.model.vo.BoardLikes;
import com.kh.dagym.member.model.vo.Member;

@Controller
@RequestMapping("/info/*")
@SessionAttributes({ "loginMember" })
public class InfoController {

	@Autowired
	private InfoService infoService;

	@Autowired
	private EventService eventService;

	private final int BOARD_TYPE = 2;

	@GetMapping("list")
	public String infoList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			@RequestParam(value = "sKey", required = false, defaultValue = "") String sKey,
			@RequestParam(value = "sVal", required = false) String sVal, Model model) {

		Map<String, String> map = new HashMap<>();
		map.put("sKey", sKey);
		map.put("sVal", sVal);

		PageInfo pInfo = infoService.pagenation(cp, map, BOARD_TYPE);

		List<Board> infoList = infoService.selectList(pInfo, map);

		System.out.println("BEST가져오기");
		List<Board> bestInfoList = infoService.selectBest(BOARD_TYPE);
		bestInfoList.forEach(System.out::println);

		model.addAttribute("bestInfoList", bestInfoList);
		model.addAttribute("infoList", infoList);
		model.addAttribute("pInfo", pInfo);

		return "community/infoList";
	}

	@GetMapping("{boardNo}")
	public String boardView(@PathVariable int boardNo, Model model, RedirectAttributes rdAttr) {

		Board board = infoService.selectInfo(boardNo);
		String url = "";
		Member member = (Member) model.getAttribute("loginMember");
		int heart = 0;
		System.out.println(board);

		if (board != null) {
			if (member != null) {
				int memberNo = member.getMemberNo();
				BoardLikes boardLikes = new BoardLikes(boardNo, memberNo);
				heart = infoService.getBoardLike(boardLikes);
			}

			int likesCount = infoService.likesCount(boardNo);

			List<Attachment> files = eventService.selectFiles(boardNo);
			if (!files.isEmpty()) {
				model.addAttribute("files", files);
			}
			model.addAttribute("likesCount", likesCount);
			model.addAttribute("heart", heart);
			model.addAttribute("board", board);
			url = "community/infoView";
		} else {
			// 존재하지 않은 게시글입니다 출력 후 이전 주소로 리다이렉트
			rdAttr.addFlashAttribute("status", "error");
			rdAttr.addFlashAttribute("msg", "해당 게시글 존재 X");
			rdAttr.addFlashAttribute("status", "error");
			url = "redirect:/info/list";
		}
		return url;
	}

	@GetMapping("{boardNo}/delete")
	public String deleteEvent(@PathVariable int boardNo, RedirectAttributes rdAttr, HttpServletRequest request) {
		String savePath = request.getSession().getServletContext().getRealPath("resources/uploadImages");
		int result = eventService.deleteEvent(boardNo, savePath);
		String status;
		String msg;
		String path;
		if (result > 0) {
			status = "success";
			msg = "게시글 삭제 성공";
			path = "/info/list";
		} else {
			status = "error";
			msg = "게시글 삭제 실패";
			path = request.getHeader("referer");
		}

		rdAttr.addFlashAttribute("status", status);
		rdAttr.addFlashAttribute("msg", msg);
		return "redirect:" + path;
	}

	@GetMapping("{boardNo}/update")
	public ModelAndView eventUdateView(@PathVariable int boardNo, ModelAndView mv) {
		Board board = infoService.selectInfo(boardNo);

		if (board != null) {
			List<Attachment> files = eventService.selectFiles(boardNo);
			mv.addObject("files", files);
		}
		mv.addObject("board", board);
		mv.setViewName("community/infoUpdate");

		return mv;
	}

	@PostMapping("{boardNo}/update")
	public ModelAndView eventUpdate(@PathVariable int boardNo, ModelAndView mv, Board upBoard, boolean[] deleteImages,
			RedirectAttributes rdAttr, HttpServletRequest request,
			@RequestParam(value = "thumbnail", required = false) MultipartFile thumbnail,
			@RequestParam(value = "images", required = false) List<MultipartFile> images) {

		upBoard.setBoardNo(boardNo);

		String savePath = request.getSession().getServletContext().getRealPath("resources/uploadImages");

		int result = eventService.updateEvent(upBoard, savePath, images, deleteImages);

		String status;
		String msg;
		String url;
		if (result > 0) {
			status = "success";
			msg = "게시글 수정 성공";
			// url = "/board/"+type+"/"+boardNo+"?cp="+cp;
			url = "../" + boardNo;
		} else {
			status = "error";
			msg = "게시글 수정 실패";
			url = request.getHeader("referer");
		}
		rdAttr.addFlashAttribute("status", status);
		rdAttr.addFlashAttribute("msg", msg);

		// mv.addObject("board", upBoard);
		mv.setViewName("redirect:" + url);

		return mv;
	}

	@GetMapping("insert")
	public String boardInsertForm(@RequestParam int boardType, Model model) {
		model.addAttribute("boadType", boardType);
		Member loginMember = (Member) model.getAttribute("loginMember");
		return "community/infoInsert";
	}

	@PostMapping("insert")
	public String boardInsert(@RequestParam int boardType, Board board, Model model, RedirectAttributes rdAttr,
			@RequestParam(value = "images", required = false) List<MultipartFile> images, HttpServletRequest request) {
		System.out.println(board);
		Member loginMember = (Member) model.getAttribute("loginMember");
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
		rdAttr.addFlashAttribute("status", status);
		rdAttr.addFlashAttribute("msg", msg);

		return path;
	}

	@ResponseBody
	@PostMapping("heart")
	public Map heart(HttpServletRequest request, Model model) {
		int heart = Integer.parseInt(request.getParameter("heart"));
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));

		int memberNo = ((Member) model.getAttribute("loginMember")).getMemberNo();

		BoardLikes boardLikes = new BoardLikes(boardNo, memberNo);

		if (heart > 0) {
			infoService.deleteLikes(boardLikes);
			heart = 0;
		} else {
			heart = infoService.insertLikes(boardLikes);
		}

		int likesCount = infoService.likesCount(boardNo);
		Map<String, Integer> map = new HashMap<>();
		map.put("isLikes", heart);
		map.put("likesCount", likesCount);

		return map;
	}

	@ResponseBody
	@PostMapping(value = "insertReply/{boardNo}", produces = "text/plain;Charset=UTF-8")
	public String insertReply(@PathVariable int boardNo, Reply reply) {
		reply.setBoardNo(boardNo);

		int result = infoService.insertReply(reply);

		String str = "댓글삽입";
		if (result == 1) {
			str += "성공";
		} else {
			str += "실패";
		}
		return str;

	}

	@ResponseBody
	@RequestMapping(method = RequestMethod.POST, value = "selectReplys/{boardNo}", produces = "text/plain;Charset=UTF-8")
	public String selectReplys(@PathVariable int boardNo) {

		List<Reply> replyList = infoService.selectReplys(boardNo);
		System.out.println(boardNo);
		replyList.stream().forEach(System.out::println);

		Gson gson = new GsonBuilder().setDateFormat("yy-MM-dd hh:mm").create();

		return gson.toJson(replyList);
	}

	@ResponseBody
	@PostMapping(value = "deleteReply/{replyNo}", produces = "text/plain;Charset=UTF-8")
	public String deleteReply(@PathVariable int replyNo) {

		int result = infoService.deleteReply(replyNo);

		String str = "댓글 삭제";
		if (result == 1) {
			str += "성공";
		} else {
			str += "실패";
		}
		return str;

	}

	@ResponseBody
	@GetMapping(value = "updateReply/{replyNo}", produces = "text/plain;Charset=UTF-8")
	public String selectReply(@PathVariable int replyNo) {

		String content = infoService.selectReply(replyNo);

		return content;
	}

	@ResponseBody
	@PostMapping(value = "updateReply")
	public int updateReply(Reply reply) {

		int result = infoService.updateReply(reply);

		return result;

	}

}
