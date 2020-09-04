package com.kh.dagym.serviceCenter;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dagym.admin.model.vo.Member;
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

}
