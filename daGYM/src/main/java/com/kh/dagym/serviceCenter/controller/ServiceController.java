package com.kh.dagym.serviceCenter.controller;

import java.util.ArrayList;
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
import com.kh.dagym.serviceCenter.service.ReplyService;
import com.kh.dagym.serviceCenter.service.ServiceBoard;
import com.kh.dagym.serviceCenter.vo.QnaBoard;
import com.kh.dagym.serviceCenter.vo.Search;
import com.kh.dagym.serviceCenter.vo.Sreply;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/service/*")
public class ServiceController {
	    
	@Autowired
	private ServiceBoard serviceBoard;
	
	@Autowired
	private ReplyService rService;
	
	@RequestMapping("question/{type}")
	public String questionList(@PathVariable int type,@RequestParam(value="cp",required=false, defaultValue="1") int cp,Model model) {
		
		int loginMemberNo=((Member) model.getAttribute("loginMember")).getMemberNo();
		
		com.kh.dagym.serviceCenter.vo.PageInfoSv pInfo = serviceBoard.paginationQa(type,cp,loginMemberNo);
		
		List<QnaBoard> bList = serviceBoard.selectQaList(pInfo);
		
		
		if(!bList.isEmpty()) {
			
			List<Attachment> thList = serviceBoard.selectImgList(bList.get(0).getBoardWriter());
				for(Attachment at : thList) {
					System.out.println(at.getFileNo());
				}
			model.addAttribute("thList", thList);
		}
		
		model.addAttribute("bList", bList);
		model.addAttribute("pInfo", pInfo);
		
		
		return "serviceCenter/question";
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
		Board board = serviceBoard.selectFaqBoard(boardNo,type);
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
			
			Member loginMember=(Member) model.getAttribute("loginMember");
			search.setMemberId(loginMember.getMemberId());
		
			PageInfo pInfo = serviceBoard.pagination(type, cp,search);
			Map<String, Object> map  = new HashMap<String, Object>();
			map = serviceBoard.selectSearchList(pInfo,search);
			
			
			
			String url=null;
			if(type ==3) {
				model.addAttribute("bList",map.get("qList"));
				model.addAttribute("pInfo", pInfo);
				url="serviceCenter/question";
				
			}else {
				List<Board> nList = serviceBoard.selectBoardNo(pInfo);
				List<com.kh.dagym.admin.model.vo.Member> mList = serviceBoard.selectMemberId(pInfo);
				model.addAttribute("bList",map.get("bList"));
				model.addAttribute("pInfo", pInfo);
				model.addAttribute("nList", nList);
				model.addAttribute("mList", mList);
				boolean flag = false;
				model.addAttribute("flag", flag);
				boolean flag2=true;
				model.addAttribute("flag2", flag2);
				url="serviceCenter/faq";
			}
	
		return url;
	}
	
	@RequestMapping("{type}/insert")
	public String insertView(@PathVariable int type,Model model) {
		System.out.println(type+"aa");
		model.addAttribute("type", type);
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
		
		
		 //-----------------------------------------Summernote-----------------------------------------
		// name속성 값이 "images"인 파라미터 자체가 전달되지 않아 images 리스트가 생성되지 않아
				// images.add(0, thumbnail); 코드 진행 시 NullPointerException이 발생함.
		if(images.isEmpty()) { 
			images = new ArrayList<>();
		}
		//--------------------------------------------------------------------------------------------
		
		
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
			if(type!=3) {
				url="../faq/"+board.getBoardType()+"?cp=1";
			}else {
				url="../question/"+type;
			}
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
	public ModelAndView faqUpdate(@PathVariable int boardNo,ModelAndView mv,
								  @PathVariable int type) {
		
		Board board = serviceBoard.selectFaqBoard(boardNo,type);
		
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
		upBoard.setBoardType(type);
		
		images.add(0, thumbnail);
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/uploadImages");
		System.out.println(upBoard.getBoardType()+"123gg");
		int result = serviceBoard.updateFaqBoard(upBoard,savePath,images,deleteImages);
		
		String status=null;
		String text=null;
		String msg=null;
		String url=null;
		if(result>0) {
			status="success";
			msg="게시글 수정성공";
			if(type ==3) {
				url= "../../../question/"+type;
			}else {
				url = "../../"+type+"?cp="+cp;
			}
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
			
			if(type ==3) {
				url= "../../../question/"+type;
			}else {
				url = "../../"+type;
			}
			
		}else {
			status="error";
			msg="삭제실패";
			url = request.getHeader("referer");
		}
		rdAttr.addFlashAttribute("status", status);
		rdAttr.addFlashAttribute("msg", msg);
		return "redirect:"+url; 
	}
	
	// qa게시글 상세보기 
	@RequestMapping("question/{type}/{boardNo}")
	public String questView(@PathVariable int type,@PathVariable int boardNo,
							Model model,RedirectAttributes rdAttr,HttpServletRequest request ) {
		System.out.println("ㄱㄷㄷㄱㄴ");
		Board board = serviceBoard.selectQnaBoard(boardNo);
		
		String url = "serviceCenter/questionView";
		if(board != null) {
			
			List<Attachment> files = serviceBoard.selectFaqFiles(boardNo);
			
			if(!files.isEmpty()) {
				model.addAttribute("files", files);
			}
		}
		model.addAttribute("board", board);
		return url;
	}
	
	//-----------------------------------------Summernote-----------------------------------------
		// Summernote 이미지 업로드
		@ResponseBody
		@RequestMapping("{type}/insertImage")
		public String insertImage(@PathVariable int type,  HttpServletRequest request,
				@RequestParam(value="uploadFile", required=false) MultipartFile uploadFile) {
			
			String savePath =  request.getSession().getServletContext().getRealPath("resources/infoImages/");
			
			Map<String, String> result = serviceBoard.insertImage(uploadFile, savePath);
			return new Gson().toJson(result);
		}
		//--------------------------------------------------------------------------------------------
		
	
	//queset게시글 등록
	
//	@RequestMapping("{type}/questionInsert")
//	public String questInsert() {
//		return "serviceCenter/faqInsert";
//	}
//	
//	@RequestMapping(value="{type}/qaInsertAction",method=RequestMethod.POST)
//	public String qaInsertAction(@PathVariable int type,Board board,
//			Model model,HttpServletRequest request,RedirectAttributes rdAttr,
//			@RequestParam(value="thumbnail", required=false)MultipartFile thumbnail,
//			@RequestParam(value="images", required=false)List<MultipartFile> images) {
//		
//	
//		Member loginMember=	(Member)model.getAttribute("loginMember");
//		board.setBoardType(type);
//		board.setBoardWriter(loginMember.getMemberNo()+""); 
//		images.add(0, thumbnail);
//		String savePath = request.getSession().getServletContext().getRealPath("resources/uploadImages");
//		
//		int result = serviceBoard.insertQaBoard(board,images,savePath);
//		
//		
//		
//		return null;
//	}
	
}
