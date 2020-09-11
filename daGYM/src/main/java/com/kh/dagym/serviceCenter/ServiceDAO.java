package com.kh.dagym.serviceCenter;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dagym.admin.model.vo.Member;
import com.kh.dagym.common.Attachment;
import com.kh.dagym.common.Board;
import com.kh.dagym.common.PageInfo;
import com.kh.dagym.serviceCenter.vo.QnaBoard;

@Repository
public class ServiceDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount(int type) {
		return sqlSession.selectOne("serviceMapper.getListCount",type);
	}

	public List<Board> selectFaqList(PageInfo pInfo) {
		
		int offset=(pInfo.getCurrentPage()-1) *pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("serviceMapper.selectFaqList", pInfo.getBoardType(),rowBounds);
	}

	
	/** faq 게시글 상세조회 DAO
	 * @param boardNo
	 * @return board
	 */
	public Board selectFaqBoard(Map<String, Object> map) {
		return sqlSession.selectOne("serviceMapper.selectFaqBoard", map);
	}

	/** 조회수 증가 DAO
	 * @param boardNo
	 * @return result
	 */
	public int increaseCount(int boardNo) {
		return sqlSession.update("serviceMapper.increaseCount",boardNo);
	}

	
	/** 검색 조건이 추가된 faq 페이징 처리 DAO
	 * @param map
	 * @return
	 */
	public int getSearchListCount(Map<String, Object> map) {
		
		return sqlSession.selectOne("serviceMapper.getSearchListCount", map);
	}

	/** faq보드넘버 조회 DAO
	 * @param pInfo
	 * @return nList
	 */
	public List<Board> selectFaqBoardNo(PageInfo pInfo) {
		int offset=(pInfo.getCurrentPage()-1) *pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("serviceMapper.selectFaqBoardNo", pInfo.getBoardType(),rowBounds);
		
	}

	
	/** faq 멤버ID 리스트 조회 DAO
	 * @param pInfo
	 * @return mList
	 */
	public List<Member> selectFaqMemberIdList(PageInfo pInfo) {
		int offset=(pInfo.getCurrentPage()-1) *pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("serviceMapper.selectFaqmemberIdList", pInfo.getBoardType(),rowBounds);
	}

	/** faq 검색 목록 조회 DAO
	 * @param pInfo
	 * @param map
	 * @return boardList
	 */
	public List<Board> selectSearchList(PageInfo pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage()-1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset,pInfo.getLimit());
		return sqlSession.selectList("serviceMapper.selectSearchList",map,rowBounds);
	}

	/** faq 게시글 등록 시퀀스 조회
	 * @param boardType
	 * @return result
	 */
	public int selectNextNo(int boardType) {
		
		return sqlSession.selectOne("serviceMapper.selectSeq");
	}

	/** faq 게시글 등록 DAO
	 * @param board
	 * @return result
	 */
	public int insertFaq(Board board) {
		System.out.println(board.getQnaCode()+"pp");
		return sqlSession.insert("serviceMapper.insertFaq",board);
	}

	/** faq파일 삽입 DAO
	 * @param at
	 * @return result
	 */
	public int insertFaqAttachment(Attachment at) {

		return sqlSession.insert("serviceMapper.insertFaqAttachment", at);
	}

	/** 파일 저장 오류시 db에 저장된 내용 삭제 faq
	 * @param boardNo
	 */
	public void deleteFaqAttachment(int boardNo) {
		sqlSession.delete("serviceMapper.deleteFaqAttachment",boardNo);
		
	}

	/** faq 게시글 이미지 조회 DAO
	 * @param boardNo
	 * @return result
	 */
	public List<Attachment> selectFaqFiles(int boardNo) {
		return sqlSession.selectList("serviceMapper.selectFaqFiles",boardNo);
	}

	/** faq게시글 업데이트 DAO
	 * @param upBoard
	 * @return result
	 */
	public int updateFaqBoard(Board upBoard) {
		
		return sqlSession.update("serviceMapper.updateFaqBoard", upBoard);
	}

	/** faq 파일 정보 수정 DAO
	 * @param at
	 * @return result
	 */
	public int updateFaqAttachment(Attachment at) {
		return sqlSession.update("serviceMapper.updateFaqAttachment",at);
	}

	/** faq 파일 1개 정보 삭제 DAO
	 * @param fileNo
	 * @return result
	 */
	public int deleteFaqAttachment2(int fileNo) {
		
		return sqlSession.delete("serviceMapper.deleteAttachment2",fileNo);
	}

	
	/** 게시글 삭제 DAO
	 * @param boardNo
	 * @return
	 */
	public int deleteFaqBoard(int boardNo) {
		
		return sqlSession.update("serviceMapper.deleteFaqBoard",boardNo);
	}
	
	
	/** Qa 전체 게시글 수 조회
	 * @param type
	 * @return listCount
	 */
	public int getQaListCount(int type,int loginMemberNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type",type);
		map.put("loginMemberNo", loginMemberNo);
			
		return sqlSession.selectOne("serviceMapper.getQaListCount", map);
	}

	/** Qs 리스트 조회 DAO
	 * @param pInfo
	 * @return bList
	 */
	public List<Board> selectQaList(com.kh.dagym.serviceCenter.vo.PageInfoSv pInfo) {
		
		int offset = (pInfo.getCurrentPage()-1) *pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", pInfo.getBoardType());
		map.put("memberNo", pInfo.getMemberNo());
		
		return sqlSession.selectList("serviceMapper.selectQaList", map,rowBounds);
		
	}

	/** qna 게시글 상세조회 DAO
	 * @param boardNo
	 * @return board
	 */
	public Board selectQnaBoard(int boardNo) {
		return sqlSession.selectOne("serviceMapper.selectQnaBoard", boardNo);
	}

	/** qna 조회수 증가 DAO
	 * @param boardNo
	 * @return result
	 */
	public int increaseCount2(int boardNo) {
		
		return sqlSession.update("serviceMapper.increaseCount2", boardNo);
	}

	/** queset 상세조회 아이디 조회 
	 * @param boardWriter
	 * @return
	 */
	public String selectMemberId(String boardWriter) {
		return sqlSession.selectOne("serviceMapper.selectMemberId", boardWriter);
	}

	

	

}
