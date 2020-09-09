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
		super();
		this.sqlSession = sqlSession;
	}


	/**
	 * @param BOARD_TYPE
	 * @return listCount
	 */
	public int getListCount() {
		return sqlSession.selectOne("eventMapper.getListCount");
	}


	public List<Board> selectList(PageInfo pInfo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		return sqlSession.selectList("eventMapper.selectList", null, rowBounds);
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
		return sqlSession.insert("eventMapper.insertBoard", board);
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

}
