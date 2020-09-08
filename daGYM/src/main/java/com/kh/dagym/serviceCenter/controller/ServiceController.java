package com.kh.dagym.serviceCenter.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
import com.kh.dagym.member.model.vo.Member;
import com.kh.dagym.serviceCenter.service.ServiceBoard;
import com.kh.dagym.serviceCenter.vo.Search;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/service/*")
public class ServiceController {
	    
	@Autowired
	private ServiceBoard serviceBoard;
	
	@RequestMapping("questionList/{type}")
	public String questionList(@PathVariable int type,@RequestParam(value="cp",required=false, defaultValue="1") int cp,Model model) {
		
		
		
		PageInfo pInfo = serviceBoard.pagination(type,cp);
		
		
		return "serviceCenter/questionList";
	}
	
	//faq 리스트 조회
	@RequestMapping("faq/{type}")
	public String faq(@PathVariable int type,@RequestParam(value="cp",required=false, defaultValue="1") int cp,
			Model model) {
		
		PageInfo pInfo = serviceBoard.pagination(type, cp);
		
		List<Board> bList = serviceBoard.selectFaqList(pInfo);
		List<Board> nList = serviceBoard.selectBoardNo(pInfo);
		List<com.kh.dagym.admin.model.vo.Member> mList = serviceBoard.selectMemberId(pInfo);
		
		model.addAttribute("bList", bList);
		model.addAttribute("pInfo", pInfo);
		model.addAttribute("nList", nList);
		model.addAttribute("mList", mList);
		boolean flag = true;
		model.addAttribute("flag", flag);
		return "serviceCenter/faq";
	}
	
	//faq 게시글 상세조회
	@ResponseBody
	@RequestMapping(value="{type}/{boardNo}",method=RequestMethod.POST)
	public String faqView(@PathVariable int type,
						  @PathVariable int boardNo,Model model,
						   RedirectAttributes rdAttr,HttpServletRequest request) {
		System.out.println("확인");
		Board board = serviceBoard.selectFaqBoard(boardNo);
		Map<String,Object > map = new HashMap<String, Object>();
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		String url = null;
		if(board != null) {
			
			List<Attachment> files = serviceBoard.selectFaqFiles(boardNo);
			
			
			if(!files.isEmpty()) {
//				int i=0;
//				for(Attachment at : files) {
//					if(at != null) {
//						map.put("file"+i+"", at);
//						System.out.println(at.getFileLevel());
//						i++;
//					}
//					
//				}
			map.put("board", board);
			map.put("files", files);
//			map.put("file1", files.get(1));
//			map.put("file2", files.get(2));
//			map.put("file3", files.get(3));
			
		}else {
			map.put("board", board);
			
		}
	}
		
		return gson.toJson(map);
		
	}
	
	//게시글 검색
	@RequestMapping("search/{type}")
	public String search(@PathVariable int type,
			@RequestParam(value="cp",required=false,defaultValue="1")int cp,
			Search search, Model model){
	
		
		PageInfo pInfo = serviceBoard.pagination(type, cp,search);
		
		List<Board> boardList = serviceBoard.selectSearchList(pInfo,search);
		for(Board b:boardList) {
			System.out.println(b);
		}
		List<Board> nList = serviceBoard.selectBoardNo(pInfo);
		List<com.kh.dagym.admin.model.vo.Member> mList = serviceBoard.selectMemberId(pInfo);
		model.addAttribute("bList",boardList);
		model.addAttribute("pInfo", pInfo);
		model.addAttribute("nList", nList);
		model.addAttribute("mList", mList);
		boolean flag = false;
		model.addAttribute("flag", flag);
		boolean flag2=true;
		model.addAttribute("flag2", flag2);
		
	
		return "serviceCenter/faq";
	}
	
	@RequestMapping("{type}/insert")
	public String insertView() {
		return "serviceCenter/faqInsert";
	}
	
	//게시글 등록
	@Transactional(rollbackFor = Exception.class)
	@RequestMapping(value="{type}/insertAction",method=RequestMethod.POST)
	public String insertAction(@PathVariable int type, Board board,
			Model model,HttpServletRequest request, RedirectAttributes rdAttr,
			@RequestParam(value="thumbnail",required = false) MultipartFile thumbnail,
			@RequestParam(value="images", required=false)List<MultipartFile>images) {
		
		Member loginMember=(Member) model.getAttribute("loginMember");
		
		board.setBoardType(type);
		board.setBoardWriter(loginMember.getMemberNo()+"");
		
		images.add(0, thumbnail);
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/uploadImages");
		
		
		int result = serviceBoard.insertFaq(board,images,savePath);
		String status=null;
		String text=null;
		String msg=null;
		String url=null;
		
		if(result>0) {
			status="success";
			text="게시글 삽입성공";
			msg="게시글 등록 성공";
			//url="board/"+type+"/"+board.getBoardNo()+"?cp=1";
			url="../faq/"+board.getBoardType()+"?cp=1";
		} else {
			status="error";
			text="게시글 등록 실패";
			url="faqInsert";
		}
		rdAttr.addFlashAttribute("status", status);
		rdAttr.addFlashAttribute("msg", msg);
		
		return "redirect:"+url;
	}
	
	//faq게시글 수정
	@RequestMapping("faq/{type}/{boardNo}/update")
	public ModelAndView faqUpdate(@PathVariable int boardNo,ModelAndView mv) {
		
		Board board = serviceBoard.selectFaqBoard(boardNo);
		
		if(board != null) {
			List<Attachment> files = serviceBoard.selectFaqFiles(boardNo);
			
			for(Attachment at : files) {
				System.out.println(at);
			}
			mv.addObject("files", files);
		}
		
		mv.addObject("board", board);
		mv.setViewName("serviceCenter/faqUpdate");
	return mv;	
	}
	
	//faq게시글 수정
	@RequestMapping("faq/{type}/{boardNo}/updateAction")
	public String faqUpdateAction(@PathVariable int type,
										@PathVariable int boardNo,
										ModelAndView mv,
										Board upBoard, int cp,
										 RedirectAttributes rdAttr,
										 HttpServletRequest request,
										 @RequestParam (value="thumbnail", required=false)MultipartFile thumbnail,
										 @RequestParam (value="images", required=false)List<MultipartFile> images,
										 boolean[] deleteImages) {
		
		upBoard.setBoardNo(boardNo);
		
		images.add(0, thumbnail);
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/uploadImages");
		
		int result = serviceBoard.updateFaqBoard(upBoard,savePath,images,deleteImages);
		
		String status=null;
		String text=null;
		String msg=null;
		String url=null;
		if(result>0) {
			status="success";
			msg="게시글 수정성공";
			url = "../../"+type+"?cp="+cp;
			rdAttr.addFlashAttribute("status",status);
			rdAttr.addFlashAttribute("msg",msg);
			
		}else {
			status="error";
			msg="게시글 수정 실패";
			url=request.getHeader("referer");
		}
		
		return "redirect:"+url;
	}
	
	@RequestMapping("faq/{type}/{boardNo}/delete")
	public String delectFaqBoard(@PathVariable int type,
			  					@PathVariable int boardNo,
			  					RedirectAttributes rdAttr,
								 HttpServletRequest request) {
		int result = serviceBoard.deleteFaqBoard(boardNo);
		
		String status=null;
		String text=null;
		String msg=null;
		String url=null;
		
		if(result>0) {
			status="success";
			msg="삭제성공";   
			url = "../../"+type;
			
		}else {
			status="error";
			msg="삭제실패";
			url = request.getHeader("referer");
		}
		rdAttr.addFlashAttribute("status", status);
		rdAttr.addFlashAttribute("msg", msg);
		return "redirect:"+url; 
	}
	
	
}
