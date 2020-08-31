package com.kh.dagym.trainer.model.controller;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

@Component
@RequestMapping("/trainer/*")
public class TrainerController {
	@RequestMapping("trainerView")
	public String loginView() {
		return "trainerResulvation/trainer";
	}
}
