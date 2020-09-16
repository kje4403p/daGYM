package com.kh.dagym.admin.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.dagym.admin.model.vo.Attachment;
import com.kh.dagym.admin.model.vo.Board;
import com.kh.dagym.admin.model.vo.Member;
import com.kh.dagym.admin.model.vo.PT;
import com.kh.dagym.admin.model.vo.Page;
import com.kh.dagym.admin.model.vo.Reply;
import com.kh.dagym.admin.model.vo.Trainer;
import com.kh.dagym.trainer.model.vo.Payment;

public interface AdminService {

	/** 회원 전체 조회 Service
	 * @return mList
	 */
	public abstract List<Member> selectMList();

	/** 트레이너 전체 조회 Service
	 * @return tList
	 */
	public abstract List<Trainer> selectTList();

	/** 게시판 목록 조회 Service
	 * @return iList
	 */
	public abstract List<Board> selectList(Page pInfo);

	/** 문의 내용 이미지 조회 Service
	 * @param boardNo
	 * @return fList
	 */
	public abstract List<Attachment> selectFList(int boardNo);
	
	/** 1:1 문의 답변 Service
	 * @param reply
	 * @return result
	 */
	public abstract int insertAnswer(Reply reply);

	/** 페이징처리 Service
	 * @param cp
	 * @return pInfo
	 */
	public abstract Page pagination(int type, int cp);

	/** 이벤트 작성 Service
	 * @param board
	 * @param savePath 
	 * @param images 
	 * @return result
	 */
	public abstract int insertEvent(Board board, List<MultipartFile> images, String savePath);

	/** 트레이너 매출 조회 Service
	 * @param ym 
	 * @return list
	 */
	public abstract List<Payment> trainerChart(String ym);

	/** 월별 매출 조회 Service
	 * @param year 
	 * @return list
	 */
	public abstract List<Payment> monthChartView(String year);

	/** 트레이너 탈퇴 Service
	 * @param trainerNo
	 * @return result
	 */
	public abstract int deleteTrainer(int trainerNo);

	/** 트레이너 한 명 조회 Service
	 * @param trainerNo
	 * @return trainer
	 */
	public abstract Trainer selectTrainer(int trainerNo);

	/** 비밀번호 확인 Service
	 * @param trainer
	 * @return result
	 */
	public abstract int pwdCheck(Trainer trainer);
	
	/** 트레이너 이미지 조회 Service
	 * @param trainerNo
	 * @return file
	 */
	public abstract Attachment selectFile(int trainerNo);

	/** 트레이너 수정 Service
	 * @param trainer
	 * @param image 
	 * @param savePath 
	 * @return result
	 */
	public abstract int updateTrainer(Trainer trainer, String savePath, MultipartFile image);

	/** 스케줄 조회 Service
	 * @return sList
	 */
	public abstract List<PT> selectSList();

	/** 스케줄 조회 시 트레이너 필터 적용 Service
	 * @param noList
	 * @return sList
	 */
	public abstract List<PT> scheduleFilter(List<Integer> noList);

	/** 회원수 세기 Service
	 * @return count
	 */
	public abstract List<Integer> count();


}