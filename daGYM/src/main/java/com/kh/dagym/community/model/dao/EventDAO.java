package com.kh.dagym.community.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dagym.common.Attachment;
import com.kh.dagym.common.Board;
import com.kh.dagym.common.PageInfo;

@Repository
public class EventDAO {
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public EventDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}


	/**
	 * @param BOARD_TYPE
	 * @return listCount
	 */
	public int getListCount(int status) {
		if (status == 0) {
			return sqlSession.selectOne("eventMapper.getListCount");
		} else {
			return sqlSession.selectOne("eventMapper.getEndListCount");

		}
	}


	public List<Board> selectList(PageInfo pInfo, int status) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		if (status == 0) {
			return sqlSession.selectList("eventMapper.selectList", null, rowBounds);
		} else {
			return sqlSession.selectList("eventMapper.selectEndList", null, rowBounds);
		}
	}


	/** 게시글 삽입시 필요한 보드넘버 가져오기
	 * @return
	 */
	public int selectNextNo() {
		return sqlSession.selectOne("eventMapper.selectNextNo");
	}


	/** 게시글 삽입
	 * @param board
	 * @return int
	 */
	public int insertBoard(Board board) {
		if (board.getBoardType() == 1)
			return sqlSession.insert("eventMapper.insertBoard", board);
		else 
			return sqlSession.insert("eventMapper.insertInfo", board);
	}


	/** 파일정보 삽입 DAO
	 * @param at
	 * @return int
	 */
	public int insertAttachment(Attachment at) {
		return sqlSession.insert("eventMapper.insertAttachment", at);
	}

	// 파일 저장 오류시 삭제 DAO
	public void deleteAttachment(int boardNo) {
		sqlSession.delete("eventMapper.deleteAttachment", boardNo);
	}


	public Board selectBoard(int boardNo) {
		return sqlSession.selectOne("eventMapper.selectBoard", boardNo);
	}


	/** 조회수 증가
	 * @param boardNo
	 * @return int
	 */
	public int increaseCount(int boardNo) {
		return sqlSession.update("eventMapper.increaseCount", boardNo);
	}


	/** 파일 불러오기
	 * @param boardNo
	 * @return Attachment
	 */
	public List<Attachment> selectFiles(int boardNo) {
		return sqlSession.selectList("eventMapper.selectFiles", boardNo);
	}


	/** 이벤트 삭제
	 * @param boardNo
	 * @return int
	 */
	public int deleteEvent(int boardNo) {
		return sqlSession.update("eventMapper.deleteEvent", boardNo);
	}


	/** 썸네일 목록 가져오기
	 * @param eventList
	 * @return List<Attachment>
	 */
	public List<Attachment> selectThumbnailList(List<Board> eventList) {
		return sqlSession.selectList("eventMapper.selectThumbnailList", eventList);

	}


	/** 이벤트 게시글 수정
	 * @param upBoard
	 * @return int
	 */
	public int updateEvent(Board upBoard) {
		return sqlSession.update("eventMapper.updateEvent", upBoard);
	}


	/** 첨부 파일 수정
	 * @param at 
	 * @return int
	 */
	public int updateAttachment(Attachment at) {
		return sqlSession.update("eventMapper.updateAttachment", at);
	}


	/** 파일 한 개 삭제
	 * @param fileNo
	 * @return int
	 */
	public int deleteAttachmentOne(int fileNo) {
		return sqlSession.delete("eventMapper.deleteAttachmentOne", fileNo);
	}




}
