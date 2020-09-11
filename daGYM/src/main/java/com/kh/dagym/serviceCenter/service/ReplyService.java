package com.kh.dagym.serviceCenter.service;

import java.util.List;

import com.kh.dagym.serviceCenter.vo.Sreply;

public interface ReplyService {

	/** 댓글 조회 Service
	 * @param boardNo
	 * @return rList
	 */
	List<Sreply> selectList(int boardNo);

}
