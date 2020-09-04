package com.kh.dagym.serviceCenter;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dagym.common.Board;
import com.kh.dagym.common.PageInfo;

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
	public Board selectFaqBoard(int boardNo) {
		return sqlSession.selectOne("serviceMapper.selectFaqBoard", boardNo);
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

}
