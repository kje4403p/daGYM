package com.kh.dagym.trainer.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dagym.trainer.model.vo.Trainer;
import com.kh.dagym.trainer.model.vo.TrainerAttachment;

@Repository
public class TrainerDAO {
	
	 @Autowired 
	 private SqlSessionTemplate sqlSession;

	public List<Trainer> selectList() {
		return sqlSession.selectList("trainerMapper.selectList",null);
	}

	public Trainer selectTrainer(int trainerNo) {
		
		return sqlSession.selectOne("trainerMapper.selectTrainer",trainerNo);
	}

	public List<TrainerAttachment> selectThumbnailList(List<Trainer> trainerList) {
		return sqlSession.selectList("trainerMapper.selectThumbnailList", trainerList);
	}

	public List<TrainerAttachment> selectFiles(int trainerNo) {
		return sqlSession.selectList("trainerMapper.selectFiles", trainerNo);
	}

	public int selectNextNo() {
		return sqlSession.selectOne("trainerMapper.selectNextNo",null);
	}

	public int insertTrainer(Trainer trainer) {
		 return sqlSession.insert("trainerMapper.insertTrainer",trainer);
	}

	public int insertAttachment(TrainerAttachment at) {
		  return sqlSession.insert("trainerMapper.insertAttachment",at);
	}

	public void deleteAttachment(int trainerNo) {
		sqlSession.delete("trainerMapper.deleteAttachment", trainerNo);
	}

}