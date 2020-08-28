package com.kh.dagym.community.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public int getListCount(int BOARD_TYPE) {
		return sqlSession.selectOne("communityMapper.getListCount", BOARD_TYPE);
	}

}
