package com.kh.dagym.community.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.dagym.common.Attachment;
import com.kh.dagym.common.Board;
import com.kh.dagym.common.PageInfo;

public interface EventService {
	PageInfo pagenation(int BOARD_TYPE, int cp, int status);

	/** 이벤트 목록 조회
	 * @param pInfo
	 * @return
	 */
	List<Board> selectList(PageInfo pInfo, int LIST);

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

	/** 게시글 삭제
	 * @param boardNo
	 * @return int
	 */
	int deleteEvent(int boardNo, String savePath);

	/** 목록에서 썸네일 불러오기
	 * @param eventList
	 * @return List
	 */
	List<Attachment> selectThumbnailList(List<Board> eventList);
 
	/** 이벤트 게시글 수정
	 * @param upBoard
	 * @param savePath
	 * @param images
	 * @param deleteImages
	 * @return int
	 */
	int updateEvent(Board upBoard, String savePath, List<MultipartFile> images, boolean[] deleteImages);
	

}
