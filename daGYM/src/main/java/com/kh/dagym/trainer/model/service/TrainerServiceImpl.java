package com.kh.dagym.trainer.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dagym.trainer.model.dao.TrainerDAO;
import com.kh.dagym.trainer.model.vo.Trainer;


@Service
public class TrainerServiceImpl implements TrainerService{
	
	@Autowired
	private TrainerDAO trainerDAO;
	
	@Override
	public List<Trainer> selectList() {
		
		return trainerDAO.selectList();
	}

	@Override
	public Trainer selectTrainer(int boardNo) {
		
		return trainerDAO.selectTrainer(boardNo);
	}

}