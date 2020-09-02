package com.kh.dagym.trainer.model.service;

import java.util.List;

import com.kh.dagym.trainer.model.vo.Trainer;

public interface TrainerService {

	/** 트레이너 리스트 Service
	 * @return trianerList
	 */
	List<Trainer> selectList();

	Trainer selectTrainer(int boardNo);


}