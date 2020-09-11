package com.kh.dagym.serviceCenter.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dagym.serviceCenter.vo.Sreply;

@Repository
public class ReplyDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 댓글 조회 서비스 DAO
	 * @param boardNo
	 * @return rList
	 */
	public List<Sreply> selectList(int boardNo) {
		
		return sqlSession.selectList("serviceMapper.selectList2", boardNo);
	}

}
