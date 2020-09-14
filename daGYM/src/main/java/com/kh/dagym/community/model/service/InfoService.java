package com.kh.dagym.community.model.service;

import java.util.List;

import com.kh.dagym.common.Board;
import com.kh.dagym.common.PageInfo;

public interface InfoService {

	PageInfo pagenation(int cp,int BOARD_TYPE);

	List<Board> selectList(PageInfo pInfo);

	Board selectInfo(int boardNo);

}
