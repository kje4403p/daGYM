package com.kh.dagym.serviceCenter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dagym.serviceCenter.dao.ReplyDAO;
import com.kh.dagym.serviceCenter.vo.Sreply;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyDAO replyDAO;
	
	
	//댓글 조회 Service구현
	@Override
	public List<Sreply> selectList(int boardNo) {
		return replyDAO.selectList(boardNo);
	}

}
