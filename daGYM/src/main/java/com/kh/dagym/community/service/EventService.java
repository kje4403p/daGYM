package com.kh.dagym.community.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dagym.common.PageInfo;
import com.kh.dagym.community.model.dao.EventDAO;

//@Repository
public class EventService {
	
	private EventDAO eventDAO;
	private PageInfo pInfo;
	
	public EventService(EventDAO eventDAO, PageInfo pInfo) {
		super();
		this.eventDAO = eventDAO;
		this.pInfo = pInfo;
	}


	/** 페이징 처리를 위한 Service
	 * @param BOARD_TYPE
	 * @param cp
	 * @return pInfo
	 */
	public PageInfo pagenation(int BOARD_TYPE, int cp) {
		// 1) 전체 게시글 수 조회
		int listCount = eventDAO.getListCount(BOARD_TYPE);

		// 2) setPageInfo 호출
		pInfo.setLimit(6);
		pInfo.setPageInfo(cp, listCount, BOARD_TYPE);		
		
		return pInfo;
	}

}
