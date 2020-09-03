package com.kh.dagym.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.dagym.admin.model.dao.AdminDAO;
import com.kh.dagym.admin.model.vo.Board;
import com.kh.dagym.admin.model.vo.Member;
import com.kh.dagym.admin.model.vo.Page;
import com.kh.dagym.admin.model.vo.Reply;
import com.kh.dagym.admin.model.vo.Trainer;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;
	
	@Autowired
	private Page pInfo;
	
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
	public List<Board> selectIList(Page pInfo) {
		return adminDAO.selectIList(pInfo);
	}

	// 1:1 문의 답변 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertAnswer(Reply reply) {
		return adminDAO.insertAnswer(reply);
	}

	// 페이징처리 Service 구현
	@Override
	public Page pagination(int type, int cp) {
		int listCount = adminDAO.getListCount(type);
		pInfo.setPageInfo(cp, listCount, type);
		
		return pInfo;
	}

}
