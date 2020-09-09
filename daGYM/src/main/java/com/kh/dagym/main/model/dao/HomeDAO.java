package com.kh.dagym.main.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dagym.common.Attachment;
@Repository
public class HomeDAO {
	@Autowired
	private SqlSession sqlSession;

	public List<Attachment> eventViews() {
		return sqlSession.selectList("homeMapper.eventViews",null);
	}
}
