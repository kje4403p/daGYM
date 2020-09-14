package com.kh.dagym.serviceCenter.service;

import java.util.List;

import com.kh.dagym.serviceCenter.vo.Sreply;

public interface ReplyService {

	/** 댓글 조회 Service
	 * @param boardNo
	 * @return rList
	 */
	List<Sreply> selectList(int boardNo);

	/** 댓글 수정 Service
	 * @param reply
	 * @return result
	 */
	int updateReply(Sreply reply);

	/** 댓글 삭제 Service
	 * @param replyNo
	 * @return result
	 */
	int deleteReply(int replyNo);

	/** 댓글 삽입 Service
	 * @param reply
	 * @return result
	 */
	int insertReply(Sreply reply);

}
