package com.kh.dagym.trainer.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.dagym.member.model.vo.Member;
import com.kh.dagym.trainer.model.vo.ClassStatus;
import com.kh.dagym.trainer.model.vo.PT;
import com.kh.dagym.trainer.model.vo.Payment;
import com.kh.dagym.trainer.model.vo.Trainer;
import com.kh.dagym.trainer.model.vo.TrainerAttachment;
import com.kh.dagym.trainer.model.vo.TrainerSchedule;

public interface TrainerService {

	/** 트레이너 리스트 Service
	 * @return trianerList
	 */
	List<Trainer> selectList();

	Trainer selectTrainer(int trainerNo);

	List<TrainerAttachment> selectThumbnailList(List<Trainer> trainerList);

	List<TrainerAttachment> selectFiles(int trainerNo);

	int insertTrainer(Trainer trainer, List<MultipartFile> images, String savePath);
	
	
	/** 결제하기 Service
	 * @param payment
	 * @param member
	 * @param trainerNo
	 * @return merchantUid
	 */
	String insertOrder(Payment payment, Member member, int trainerNo);

	/** 트레이너 가격 조회 Service
	 * @param trainerNo
	 * @return price
	 */
	int selectPrice(int trainerNo);

	/** 수강권 삽입 Service
	 * @param merchantUid
	 * @return result
	 */
	int insertCoupon(Payment payment);

	
	/** 거래 고유번호(impUid) 삽입 service
	 * @param payment
	 * @return
	 */
	int insertImpUid(Payment payment);

	ClassStatus selectClassStatus(int memberNo);

	
	/** 회원수 증가 Service
	 * @param trainerNo
	 * @return result
	 */
	int updateCnt(int trainerNo);

	int insertSchedule(TrainerSchedule trainerSchedule);

	List<TrainerSchedule> selectSchedule(int trainerNo);

	int insertResulvation(PT pt);



}