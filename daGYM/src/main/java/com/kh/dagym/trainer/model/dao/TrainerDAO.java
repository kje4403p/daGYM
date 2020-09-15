package com.kh.dagym.trainer.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dagym.trainer.model.vo.ClassStatus;
import com.kh.dagym.trainer.model.vo.PT;
import com.kh.dagym.trainer.model.vo.Payment;
import com.kh.dagym.trainer.model.vo.Trainer;
import com.kh.dagym.trainer.model.vo.TrainerAttachment;
import com.kh.dagym.trainer.model.vo.TrainerSchedule;

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
	public int createMerchantUid() {
		return sqlSession.selectOne("trainerMapper.createMerchantUid", null);
		
	}

	/** 결제하기 DAO
	 * @param map
	 * @return result
	 */
	public int insertOrder(Map<String, Object> map) {
		return sqlSession.insert("trainerMapper.insertOrder",map);
		
	}
	
	
	/** 가겨조회 DAO
	 * @param trainerNo
	 * @return price
	 */
	public int selectPrice(int trainerNo) {
		
		return sqlSession.selectOne("trainerMapper.selectPrice", trainerNo);
	}

	/** 수강권 삽입 DAO
	 * @param merchantUid
	 * @return result
	 */
	public int insertCoupon(Payment payment) {
		return sqlSession.insert("trainerMapper.insertCoupon", payment);
	}

	/** 거래 고유번호 (impUid)삽입 DAO
	 * @param payment
	 * @return result
	 */
	public int insertImpUid(Payment payment) {
		return sqlSession.update("trainerMapper.updateImpUid", payment);
	}

	public ClassStatus selectClassStatus(int memberNo) {
	
		return sqlSession.selectOne("trainerMapper.selectClassStatus", memberNo);
	}

	/** 회원수 증가 DAO
	 * @param trainerNo
	 * @return result
	 */
	public int updateCnt(int trainerNo) {
		return sqlSession.update("trainerMapper.updateCnt",trainerNo);
	}


	public int insertSchedule(TrainerSchedule trainerSchedule) {
		return sqlSession.insert("trainerMapper.insertSchedule",trainerSchedule);
	}

	public List<TrainerSchedule> selectSchedule(int trainerNo) {
		return sqlSession.selectList("trainerMapper.selectSchedule",trainerNo);
	}

	public int insertResulvation(PT pt) {
		return sqlSession.insert("trainerMapper.insertResulvation",pt);
	}

	public int updateClassCnt(int memberNo) {
		return sqlSession.update("trainerMapper.updateClassCnt",memberNo);
	}

	public int updateTrainerSchedule(PT pt) {
		return sqlSession.update("trainerMapper.updateTrainerSchedule",pt);
	}

	public int compareSchedule(TrainerSchedule trainerSchedule) {
		int result=sqlSession.selectOne("trainerMapper.compareSchedule",trainerSchedule);
		return result;
	}


}