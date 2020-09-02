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
	@RequestMapping("trainerList")
	public String trainerList(Model model) {
		List<Trainer> trainerList = trainerService.selectList();

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
		model.addAttribute("trainer",trainer);
		url="trainerResulvation/trainerView";
	}else {
		rdAttr.addFlashAttribute("status","error");
		rdAttr.addFlashAttribute("msg","해당 트레이너가 존재하지 않습니다..");
		url="redirect:/trainer/trainerList";
	}
	return url;
}
}