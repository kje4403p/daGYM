package com.kh.dagym.trainer.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.dagym.trainer.model.service.TrainerService;
import com.kh.dagym.trainer.model.vo.Trainer;


@Controller
@RequestMapping("/trainer/*")
public class TrainerController {
	@Autowired
	private TrainerService trainerService;

	//트레이너 예약 화면 이동
	@RequestMapping("trainer")
	public String trainerList(Model model) {
		List<Trainer> trainerList = trainerService.selectList();

		model.addAttribute("trainerList",trainerList);

		return "trainerResulvation/trainer";
	}
	
	//트레이너 상세 조회
	@RequestMapping("trainerList/{trainerNo}")
	public String selectTrainer(@PathVariable int type, @PathVariable int boardNo, Model model, 
			RedirectAttributes rdAttr, HttpServletRequest request) {

		Trainer Trainer = trainerService.selectTrainer(boardNo);
		String url = null;

		if(Trainer!=null) {
		model.addAttribute("Trainer",Trainer);
		url="trainerResulvation/trainerView";
	}else {
		rdAttr.addFlashAttribute("status","error");
		rdAttr.addFlashAttribute("msg","해당 트레이너가 존재하지 않습니다..");
		url="redirect:/trainer/trainer";
	}
	return url;
}
}