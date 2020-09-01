package com.kh.dagym.serviceCenter;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ServiceDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount(int type) {
		return sqlSession.selectOne("serviceMapper.getListCount",type);
	}

}
