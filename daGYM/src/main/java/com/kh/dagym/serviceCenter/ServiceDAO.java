package com.kh.dagym.serviceCenter;

import java.util.List;

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
	
	/**전체 게시글 수 조회
	 * @param type
	 * @return listCount
	 */
	public int getListCount(int type) {
		return sqlSession.selectOne("serviceMapper.getListCount",type);
	}

	/** 게시글 목록 조회 DAO
	 * @param pInfo
	 * @return
	 */
	public List<Board> selectList(PageInfo pInfo) {
	
		int offset =(pInfo.getCurrentPage()-1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset,pInfo.getLimit());
		
		return sqlSession.selectList("serviceMapper.selectList",pInfo.getBoardType(),rowBounds);
	}

}
