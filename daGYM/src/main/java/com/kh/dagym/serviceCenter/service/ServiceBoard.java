package com.kh.dagym.serviceCenter.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.dagym.admin.model.vo.Member;
import com.kh.dagym.common.Attachment;
import com.kh.dagym.common.Board;
import com.kh.dagym.common.PageInfo;
import com.kh.dagym.serviceCenter.vo.Search;

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

	
	/** faq보드 넘버 조회 service
	 * @param pInfo
	 * @return nList
	 */
	List<Board> selectBoardNo(PageInfo pInfo);

	/** faq 멤버 id 리스트 조회 service
	 * @param pInfo
	 * @return mList
	 */
	List<Member> selectMemberId(PageInfo pInfo);

	/** faq검색 목록 조회 Service
	 * @param pInfo
	 * @param search
	 * @return boardList
	 */
	List<Board> selectSearchList(PageInfo pInfo, Search search);

	/** 게시글 등록 Service
	 * @param board
	 * @param images
	 * @param savePath
	 * @return result
	 */
	int insertFaq(Board board, List<MultipartFile> images, String savePath);

	/** faq 게시글 이미지 조회 service
	 * @param boardNo
	 * @return files
	 */
	List<Attachment> selectFaqFiles(int boardNo);

	/** faq 업데이트 service
	 * @param upBoard
	 * @param savePath
	 * @param images
	 * @param deleteImages
	 * @return result
	 */
	int updateFaqBoard(Board upBoard, String savePath, List<MultipartFile> images, boolean[] deleteImages);

	/**faq 게시글 삭제 service
	 * @param boardNo
	 * @return result
	 */
	int deleteFaqBoard(int boardNo);

	
}
