package com.kh.dagym.community.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dagym.common.Board;
import com.kh.dagym.common.PageInfo;

@Repository
public class InfoDAO {
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public InfoDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}


	/** 게시글 수 가져오기
	 * @return
	 */
	public int getListCount() {
		return sqlSession.selectOne("eventMapper.getInfoListCount");
	}


	public List<Board> selectList(PageInfo pInfo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("eventMapper.selectInfoList", null, rowBounds);

	}


	public Board selectBoard(int boardNo) {
		return sqlSession.selectOne("eventMapper.selectInfo", boardNo);
	}


	public int increaseCount(int boardNo) {
		return sqlSession.update("eventMapper.increaseCount", boardNo);
	}

}
