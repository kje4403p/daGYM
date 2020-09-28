package com.kh.dagym.trainer.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.dagym.member.model.vo.Member;
import com.kh.dagym.trainer.model.service.TrainerService;
import com.kh.dagym.trainer.model.vo.ClassStatus;
import com.kh.dagym.trainer.model.vo.PT;
import com.kh.dagym.trainer.model.vo.Payment;
import com.kh.dagym.trainer.model.vo.Review;
import com.kh.dagym.trainer.model.vo.Trainer;
import com.kh.dagym.trainer.model.vo.TrainerAttachment;
import com.kh.dagym.trainer.model.vo.TrainerSchedule;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/trainer/*")
public class TrainerController {
	@Autowired
	private TrainerService trainerService;

	//트레이너 예약 화면 이동
	@RequestMapping("trainerList")
	public String trainerList(Model model) {
		List<Trainer> trainerList = trainerService.selectList();
		
		if(!trainerList.isEmpty()) {
	         List<TrainerAttachment> thList = trainerService.selectThumbnailList(trainerList);
	         model.addAttribute("thList",thList);
	      }
		
		model.addAttribute("trainerList",trainerList);

		return "trainerResulvation/trainerList";
	}
	


	//트레이너 상세 조회

	@RequestMapping("trainerView/{trainerNo}")
	public String selectTrainer(@PathVariable int trainerNo, Model model, 
			RedirectAttributes rdAttr, HttpServletRequest request) {
		Member loginMember = (Member)model.getAttribute("loginMember");
		Trainer trainer = trainerService.selectTrainer(trainerNo);
		int memberNo = loginMember.getMemberNo();
		ClassStatus classStatus =  trainerService.selectClassStatus(memberNo);
		String url = null;

		if(trainer!=null) {
			  List<TrainerAttachment> files = trainerService.selectFiles(trainerNo);
			  List<Review> reviews = trainerService.selectReviews(trainerNo);
			  System.out.println(reviews);
		         if(!files.isEmpty()) {
		            model.addAttribute("files",files);
		         }
		         if(!reviews.isEmpty()) {
		        	 model.addAttribute("reviews", reviews);
		         }
		       
		model.addAttribute("trainer",trainer);
		model.addAttribute("loginMember",loginMember);
		model.addAttribute("classStatus",classStatus);
		url="trainerResulvation/trainerView";
	}else {
		rdAttr.addFlashAttribute("status","error");
		rdAttr.addFlashAttribute("msg","해당 트레이너가 존재하지 않습니다..");
		url="redirect:/trainer/trainerList";
	}
	return url;
}
	
	
	@RequestMapping("signUp")
	public String signUp() {
		
		return "trainerResulvation/signUpView";
	}
	
	
	 @RequestMapping(value="insertAction", method=RequestMethod.POST)
	   public String insertAction(Trainer trainer, 
	                         RedirectAttributes rdAttr,
	                        @RequestParam(value="thumbnail", required=false) List<MultipartFile> images,
	                        HttpServletRequest request) {

	      String savePath = request.getSession().getServletContext().getRealPath("resources/uploadImages");
	            
	
	      int result = trainerService.insertTrainer(trainer, images, savePath);
	      
	      String status = null;
	      String msg = null;
	      
	      if(result>0) {
	         status = "success";
	         msg = "트레이너 등록 성공!";
	      }else {
	         status= "error";
	         msg = "트레이너 등록 실패";
	      }
	      
	      rdAttr.addFlashAttribute("status", status);
	      rdAttr.addFlashAttribute("msg", msg);
	      
	      return "redirect:/admin/trainerList";
	   }
	 
	 // 결제 창으로 이동
	 @RequestMapping("paymentView/{trainerNo}")
	 public String paymentView(@PathVariable int trainerNo, @RequestParam("classNm") int classNm,
				Model model	) {
		// 트레이너 가격, 이름 조회
		 Member loginMember = (Member)model.getAttribute("loginMember");
		 int memberNo= loginMember.getMemberNo();
		int result = trainerService.deleteCoupon(memberNo);
		   
	      String status = null;
	      String msg = null;
	      
			
		
		Trainer trainer = trainerService.selectTrainer(trainerNo);
		int price = trainer.getTrainerPrice();
		
		trainer.setTrainerPrice(price*classNm);
		
		model.addAttribute("trainer",trainer);
		model.addAttribute("classNm",classNm);
		model.addAttribute("price", trainer.getTrainerPrice());
		
		return "trainerResulvation/payView";
		}
	 
	 @RequestMapping("paymentView2/{trainerNo}")
	 public String paymentView2(@PathVariable int trainerNo, @RequestParam("classNm") int classNm,
				Model model	) {
		// 트레이너 가격, 이름 조회
		 Member loginMember = (Member)model.getAttribute("loginMember");
		 int memberNo= loginMember.getMemberNo();
		int result = trainerService.deleteCoupon(memberNo);
		   
	      String status = null;
	      String msg = null;
	      
		if(result>0) {
			
		
		Trainer trainer = trainerService.selectTrainer(trainerNo);
		int price = trainer.getTrainerPrice();
		
		trainer.setTrainerPrice(price*classNm);
		
		model.addAttribute("trainer",trainer);
		model.addAttribute("classNm",classNm);
		model.addAttribute("price", trainer.getTrainerPrice());
		}else {
			  status= "error";
		        msg = "트레이너 등록 실패";
		}
		return "trainerResulvation/payView";
		}
	 
	 
	 // 결제하기
	 @ResponseBody
	 @RequestMapping("payment")
	 public String paymentAction(Payment payment, Member member, int trainerNo, Model model) {
		 Member loginMember = (Member)model.getAttribute("loginMember");
		 payment.setMemberNo(loginMember.getMemberNo());
		 
		 payment.setTrainerNo(trainerNo);
		 String merchantUid = trainerService.insertOrder(payment, member, trainerNo);
		 if(merchantUid!=null) {
			 int result = trainerService.updateCnt(trainerNo);
		 }
		 return merchantUid;
		 
	 }
	 
	 // 결제번호 삭제
	 
	 @ResponseBody
	 @RequestMapping("deleteMerchantUid")
	 public String deleteMerchantUid(int merchantUid) {
		 int result = trainerService.deleteMerchantUid(merchantUid);
		 
		 return result+"";
		 
	 }
	 
	 // 수강권 삽입
	 @ResponseBody
	 @RequestMapping("insertImpUid")
	 public String insertImpUid(Payment payment, String impUid, String merchantUid, int trainerNo, Model model) {
		 Member loginMember = (Member)model.getAttribute("loginMember");
		 payment.setMemberNo(loginMember.getMemberNo());
		 payment.setTrainerNo(trainerNo);
		 String result = trainerService.insertCoupon(payment)+"";
		 int resultImp = trainerService.insertImpUid(payment);
		 
		 
		 return result;
	 }
	 
	 @RequestMapping("orderSuccess/{trainerNo}")
	 public String successMsg(@PathVariable int trainerNo, Model model) {
		 	model.addAttribute("trainerNo",trainerNo);
		 return "trainerResulvation/msg";
	 }
	 
	 
	 
	 @RequestMapping("schedule/{trainerNo}")
		public String schedule(@PathVariable int trainerNo, Model model) {
		 	model.addAttribute("trainerNo",trainerNo);
			List<TrainerSchedule> schedule = trainerService.selectSchedule(trainerNo);
			List<PT> pt2 = trainerService.selectSchedule();
			model.addAttribute("pt2",pt2);
	 		model.addAttribute("schedule",schedule);
			return "trainerResulvation/schedule";
		}
		
	 
	 
	 @ResponseBody
	 @RequestMapping(value="trainerSchedule/{trainerNo}",
		produces="application/text; charset=utf-8;")
	 public String trainerSchedule(@PathVariable int trainerNo, Model model,TrainerSchedule trainerSchedule,RedirectAttributes rdAttr) {	
		 	System.out.println(trainerSchedule.getScheduleTime());
		 	
		 		int result = trainerService.insertSchedule(trainerSchedule);
			 	
		 return result+"";
	 }
	 
	 
	 @RequestMapping("trainerResulvation/{trainerNo}")
		public String trainerResulvation(@PathVariable int trainerNo, Model model,ClassStatus classStatus) {
			List<TrainerSchedule> schedule = trainerService.selectSchedule(trainerNo);
			 Member loginMember = (Member)model.getAttribute("loginMember");
	 		model.addAttribute("schedule",schedule);
			List<PT> pt2 = trainerService.selectSchedule();
	 		classStatus= trainerService.selectClassStatus(loginMember.getMemberNo());
	 		model.addAttribute("pt2",pt2);
			model.addAttribute("classStatus",classStatus);
	 		return "trainerResulvation/resulvation";
		}
	 
	 @ResponseBody
	 @RequestMapping(value="resulvation/{trainerNo}",
		produces="application/text; charset=utf-8;")
		public String resulvation(@PathVariable int trainerNo, Model model,PT pt ,ClassStatus classStatus) {
		 Member loginMember = (Member)model.getAttribute("loginMember");
		 pt.setMemberNo(loginMember.getMemberNo());
		 System.out.println(pt);

		int result = trainerService.insertResulvation(pt);
	
	      return result+"";
}
	 
	 @ResponseBody
	 @RequestMapping(value="scheduleCancel/{trainerNo}",
		produces="application/text; charset=utf-8;")
		public String scheduleCancel(@PathVariable int trainerNo, Model model,TrainerSchedule trainerSchedule ,ClassStatus classStatus) {
		 Member loginMember = (Member)model.getAttribute("loginMember");
		 trainerSchedule.setTrainerNo(loginMember.getMemberNo());
		int result = trainerService.scheduleCancel(trainerSchedule);
	
	      return result+"";
}
}