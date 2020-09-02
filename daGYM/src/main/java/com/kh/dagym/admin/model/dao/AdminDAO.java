package com.kh.dagym.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dagym.admin.model.vo.Board;
import com.kh.dagym.admin.model.vo.Member;
import com.kh.dagym.admin.model.vo.Reply;
import com.kh.dagym.admin.model.vo.Trainer;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 회원 전체 조회 DAO
	public List<Member> selectMList() {
		return sqlSession.selectList("adminMapper.selectMList");
	}

	// 트레이너 전체 조회 DAO
	public List<Trainer> selectTList() {
		return sqlSession.selectList("adminMapper.selectTList");
	}

	// 1:1 문의 조회 DAO
	public List<Board> selectIList() {
		return sqlSession.selectList("adminMapper.selectIList");
	}

	// 1:1 문의 답변 DAO
	public int insertAnswer(Reply reply) {
		return sqlSession.insert("adminMapper.insertAnswer", reply);
	}

}