package com.kh.dagym.serviceCenter.service;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dagym.common.Board;
import com.kh.dagym.common.PageInfo;
import com.kh.dagym.serviceCenter.Search;
import com.kh.dagym.serviceCenter.ServiceDAO;



@Service
public class ServiceBoardImpl implements ServiceBoard{

	@Autowired
	private ServiceDAO serviceDAO;
	
	@Autowired //의존성 주입(DI)
	private PageInfo pInfo;

	@Override
	public PageInfo pagination(int type, int cp) {
		
		//전체 게시글 수 조회
		int listCount = serviceDAO.getListCount(type);
				
		pInfo.setPageInfo(cp, listCount, type);
	
		return pInfo;
	}

	//faq 리스트 조회 service구현
	@Override
	public List<Board> selectFaqList(PageInfo pInfo) {
		
		return serviceDAO.selectFaqList(pInfo);
	}

	//faq 게시글 상세조회 Service구현
	
	@Override
	public Board selectFaqBoard(int boardNo) {
		Board board = serviceDAO.selectFaqBoard(boardNo);
		
		if(board != null) {
			int result = serviceDAO.increaseCount(boardNo);
			
			if(result>0) {
				board.setViews(board.getViews()+1);
			}
		}
		
		
		return board;
	}

	// 검색 조건이 추가된 faq페이징 처리 구현
	@Override
	public PageInfo pagination(int type, int cp, Search search) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("type",type);
		
		int searchListCount = serviceDAO.getSearchListCount(map);
		
		return null;
	}
	
	
	
	

}
