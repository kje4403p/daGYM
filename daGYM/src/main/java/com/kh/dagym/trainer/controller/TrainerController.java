package com.kh.dagym.trainer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.dagym.trainer.model.service.TrainerService;
import com.kh.dagym.trainer.model.vo.Trainer;

@Controller
@RequestMapping("/trainer/*")
public class TrainerController {
	 @Autowired
	 private TrainerService trainerService;
	 
	@RequestMapping("trainerView")
	public String trainerList(Model model) {
		 List<Trainer> trainerList = trainerService.selectList();
		 
		 model.addAttribute("trainerList",trainerList);
		 
		return "trainerResulvation/trainer";
	}
}