package com.kh.dagym.community.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dagym.common.Board;
import com.kh.dagym.common.PageInfo;
import com.kh.dagym.community.model.dao.EventDAO;

@Repository
public class EventServiceImpl implements EventService{
	
	@Autowired
	private EventDAO eventDAO;
	@Autowired
	private PageInfo pInfo;
	

	/** 페이징 처리를 위한 Service
	 * @param BOARD_TYPE
	 * @param cp
	 * @return pInfo
	 */
	public PageInfo pagenation(int BOARD_TYPE, int cp) {
		// 1) 전체 게시글 수 조회
		int listCount = eventDAO.getListCount();

		// 2) setPageInfo 호출
		pInfo.setLimit(6);
		pInfo.setPageInfo(cp, listCount, BOARD_TYPE);		
		
		return pInfo;
	}


	/** 게시글 목록 조회
	 * @param pInfo
	 * @return eventList
	 */ 
	@Override
	public List<Board> selectList(PageInfo pInfo) {
		return eventDAO.selectList(pInfo);
	}
	
	

}
