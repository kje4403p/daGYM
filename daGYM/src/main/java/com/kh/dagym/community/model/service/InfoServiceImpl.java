package com.kh.dagym.community.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dagym.common.Board;
import com.kh.dagym.common.PageInfo;
import com.kh.dagym.community.model.dao.InfoDAO;

@Service
public class InfoServiceImpl implements InfoService{
	
	@Autowired
	private InfoDAO infoDAO;
	
	@Autowired
	private PageInfo pInfo;
	

	@Override
	public PageInfo pagenation(int cp,int BOARD_TYPE) {
		// 1) 전체 게시글 수 조회
		int listCount = infoDAO.getListCount();
		pInfo.setLimit(10);
		pInfo.setPageInfo(cp, listCount, BOARD_TYPE);


		return pInfo;
	}


	@Override
	public List<Board> selectList(PageInfo pInfo) {
		return infoDAO.selectList(pInfo);
	}


	@Override
	public Board selectInfo(int boardNo) {
		Board board = infoDAO.selectBoard(boardNo);
		
		if (board != null) {
			int result = infoDAO.increaseCount(boardNo);

			// 조회된 게시글(board)의 조회 수를 1증가 시킴
			if (result > 0) 
				board.setViews(board.getViews()+ 1);
		}

		// 조회 성공 시 조회수 증가
		return board;
	}
	
	

}
