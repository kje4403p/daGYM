package com.kh.dagym.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dagym.admin.model.vo.Board;
import com.kh.dagym.common.Attachment;
import com.kh.dagym.main.model.dao.HomeDAO;
import com.kh.dagym.trainer.model.vo.TrainerAttachment;

@Service
public class HomeServiceImpl implements HomeService{
	@Autowired
	private HomeDAO homeDAO;

	@Override
	public List<Attachment> eventViews() {
		return homeDAO.eventViews();
	}

	@Override
	public List<Board> eventTitle() {
		// TODO Auto-generated method stub
		return homeDAO.eventTitle();
	}


	
}
