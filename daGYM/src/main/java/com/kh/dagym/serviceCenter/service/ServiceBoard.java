package com.kh.dagym.serviceCenter.service;

import java.util.List;

import com.kh.dagym.common.Board;
import com.kh.dagym.common.PageInfo;
import com.kh.dagym.serviceCenter.Search;

public interface ServiceBoard {


	PageInfo pagination(int type, int cp);

	/** faq 리스트 조회 service
	 * @param pInfo
	 * @return bList
	 */
	List<Board> selectFaqList(PageInfo pInfo);

	/** faq 게시글 상세 조회 Service
	 * @param boardNo
	 * @return
	 */
	Board selectFaqBoard(int boardNo);

	/** 검색 조건이 추가된 페이징 처리 Service
	 * @param type
	 * @param cp
	 * @param search
	 * @return pInfo
	 */
	PageInfo pagination(int type, int cp, Search search);

	
}
