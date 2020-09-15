package com.kh.dagym.community.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.dagym.common.Board;
import com.kh.dagym.common.PageInfo;
import com.kh.dagym.community.model.vo.BoardLikes;

public interface InfoService {

	PageInfo pagenation(int cp,int BOARD_TYPE);

	List<Board> selectList(PageInfo pInfo);

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

}
