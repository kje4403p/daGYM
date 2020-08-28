package com.kh.dagym.trainer.controller;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

@Component
@RequestMapping("/trainer/*")
public class TrainerController {
	
	
	//트레이너화면
	@RequestMapping("trainerView")
	public String loginView() {
		return "trainerResulvation/trainer";
	}
	
}
