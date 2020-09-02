package com.kh.dagym.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dagym.admin.model.dao.AdminDAO;
import com.kh.dagym.admin.model.vo.Board;
import com.kh.dagym.admin.model.vo.Member;
import com.kh.dagym.admin.model.vo.Reply;
import com.kh.dagym.admin.model.vo.Trainer;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;
	
	// 회원 전체 조회 Service 구현
	@Override
	public List<Member> selectMList() {
		return adminDAO.selectMList();
	}

	// 트레이너 전체 조회 Service 구현
	@Override
	public List<Trainer> selectTList() {
		return adminDAO.selectTList();
	}

	// 1:1 문의 조회 Service 구현
	@Override
	public List<Board> selectIList() {
		return adminDAO.selectIList();
	}

	// 1:1 문의 답변 Service 구현
	@Override
	public int insertAnswer(Reply reply) {
		return adminDAO.insertAnswer(reply);
	}

}
