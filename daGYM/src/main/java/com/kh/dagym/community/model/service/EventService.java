package com.kh.dagym.community.model.service;

import java.util.List;

import com.kh.dagym.common.Board;
import com.kh.dagym.common.PageInfo;

public interface EventService {
	PageInfo pagenation(int BOARD_TYPE, int cp);

	List<Board> selectList(PageInfo pInfo);
	

}
