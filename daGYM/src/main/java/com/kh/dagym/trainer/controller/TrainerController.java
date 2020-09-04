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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.dagym.trainer.model.service.TrainerService;
import com.kh.dagym.trainer.model.vo.Trainer;
import com.kh.dagym.trainer.model.vo.TrainerAttachment;


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

		Trainer trainer = trainerService.selectTrainer(trainerNo);
		String url = null;

		if(trainer!=null) {
			  List<TrainerAttachment> files = trainerService.selectFiles(trainerNo);
		         
		         if(!files.isEmpty()) {
		            model.addAttribute("files",files);
		         }
		model.addAttribute("trainer",trainer);
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
	            
	
	      int result = trainerService.insertBoard(trainer, images, savePath);
	      
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
	      
	      return "redirect:/";
	   }
}