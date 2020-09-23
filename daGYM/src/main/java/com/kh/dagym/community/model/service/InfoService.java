package com.kh.dagym.community.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.dagym.common.Board;
import com.kh.dagym.common.PageInfo;
import com.kh.dagym.common.Reply;
import com.kh.dagym.community.model.vo.BoardLikes;

public interface InfoService {

	PageInfo pagenation(int cp, Map<String, String> map,int BOARD_TYPE);

	List<Board> selectList(PageInfo pInfo, Map<String, String> map);

	Board selectInfo(int boardNo);

	int getBoardLike(BoardLikes boardLikes);

	/** 좋아요 취소
	 * @param boardLikes
	 */
	void deleteLikes(BoardLikes boardLikes);

	/** 좋아요 등록
	 * @param boardLikes
	 * @return int
	 */
	int insertLikes(BoardLikes boardLikes);

	/** 해당 게시글의 좋아요 개수 불러오기
	 * @param boardNo
	 * @return int
	 */
	int likesCount(int boardNo);

	/** 리플 등록
	 * @param reply
	 * @return int
	 */
	int insertReply(Reply reply);

	/** 댓글 목록 조회
	 * @param boardNo
	 * @return List<Reply>
	 */
	List<Reply> selectReplys(int boardNo);

	/** 댓글 삭제
	 * @param replyNo
	 * @return int
	 */
	int deleteReply(int replyNo);

	/** 베스트 게시글
	 * @param BOARD_TYPE
	 * @return
	 */
	List<Board> selectBest(int BOARD_TYPE);

	/** 선택한 댓글 불러오기
	 * @param replyNo
	 * @return String
	 */
	String selectReply(int replyNo);

	/** 댓글 수정하기
	 * @param reply
	 * @return int
	 */
	int updateReply(Reply reply);

}
