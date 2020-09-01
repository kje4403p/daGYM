package com.kh.dagym.trainer.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dagym.trainer.model.vo.Trainer;

@Repository
public class TrainerDAO {
	
	 @Autowired 
	 private SqlSessionTemplate sqlSession;

	public List<Trainer> selectList() {
		return sqlSession.selectList("trainerMapper.selectList",null);
	}

}
