package com.kh.dagym.community.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.dagym.common.Attachment;
import com.kh.dagym.common.Board;
import com.kh.dagym.common.PageInfo;

public interface EventService {
	PageInfo pagenation(int BOARD_TYPE, int cp);

	/** 이벤트 목록 조회
	 * @param pInfo
	 * @return
	 */
	List<Board> selectList(PageInfo pInfo);

	/** 커뮤니티 게시판 삽입
	 * @param board
	 * @param images
	 * @param savePath
	 * @return int
	 */
	int insertBoard(Board board, List<MultipartFile> images, String savePath);

	/** 게시글 상세 조회
	 * @param boardNo
	 * @return Board
	 */
	Board selectBoard(int boardNo);

	/** 파일 불러오기
	 * @param boardNo
	 * @return
	 */
	List<Attachment> selectFiles(int boardNo);
	

}
