package com.kh.dagym.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dagym.admin.model.vo.Attachment;
import com.kh.dagym.admin.model.vo.Board;
import com.kh.dagym.admin.model.vo.Member;
import com.kh.dagym.admin.model.vo.PT;
import com.kh.dagym.admin.model.vo.Page;
import com.kh.dagym.admin.model.vo.Reply;
import com.kh.dagym.admin.model.vo.Trainer;
import com.kh.dagym.trainer.model.vo.Payment;

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

	// 게시판 목록 조회 DAO
	public List<Board> selectList(Page pInfo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("adminMapper.selectList", pInfo.getBoardType(), rowBounds);
	}

	// 문의 내용 이미지 조회 DAO
	public List<Attachment> selectFList(int boardNo) {
		return sqlSession.selectList("adminMapper.selectFList", boardNo);
	}
	
	// 1:1 문의 답변 DAO
	public int insertAnswer(Reply reply) {
		return sqlSession.insert("adminMapper.insertAnswer", reply);
	}

	// 페이징처리 DAO
	public int getListCount(int type) {
		return sqlSession.selectOne("adminMapper.getListCount", type);
	}

	// 게시글 다음 번호 가져오는 DAO 
	public int selectNextNo() {
		return sqlSession.selectOne("adminMapper.selectNextNo");
	}

	// 이벤트 작성 DAO
	public int insertEvent(Board board) {
		return sqlSession.insert("adminMapper.insertEvent", board);
	}

	// 파일 삽입 DAO
	public int insertAttachment(Attachment at) {
		return sqlSession.insert("adminMapper.insertAttachment", at);
	}

	// 오류난 파일 삭제 DAO
	public void deleteAttachment(int boardNo) {
		sqlSession.delete("adminMapper.deleteAttachment", boardNo);
	}

	// 트레이너 매출 조회 DAO
	public List<Payment> trainerChart(String ym) {
		return sqlSession.selectList("adminMapper.trainerChart", ym);
	}
	
	// 월별 매출 조회 DAO
	public List<Payment> monthChart(String year) {
		return sqlSession.selectList("adminMapper.monthChart", year);
	}

	// 트레이너 탈퇴 DAO
	public int deleteTrainer(int trainerNo) {
		return sqlSession.update("adminMapper.deleteTrainer", trainerNo);
	}

    // 트레이너 한 명 조회 DAO
	public Trainer selectTrainer(int trainerNo) {
		return sqlSession.selectOne("adminMapper.selectTrainer", trainerNo);
	}

	// 비밀번호 확인 DAO
	public String pwdCheck(int trainerNo) {
		return sqlSession.selectOne("adminMapper.pwdCheck", trainerNo);
	}

	// 트레이너 이미지 조회 DAO
	public Attachment selectFile(int trainerNo) {
		return sqlSession.selectOne("adminMapper.selectFile", trainerNo);
	}

	// 트레이너 MEMBER 테이블 수정 DAO
	public int updateMember(Trainer trainer) {
		return sqlSession.update("adminMapper.updateMember", trainer);
	}
	
	// 트레이너 TRAINER 테이블 수정 DAO
	public int updateTrainer(Trainer trainer) {
		return sqlSession.update("adminMapper.updateTrainer", trainer);
	}

	// 트레이너 이미지 수정 DAO
	public int updateFile(Attachment at) {
		return sqlSession.update("adminMapper.updateFile", at);
	}

	// 오류 났을 시 파일 삭제 DAO
	public void deleteFile(int fileNo) {
		sqlSession.delete("adminMapper.deleteFile", fileNo);
	}

	// 스케줄 조회 DAO
	public List<PT> selectSList() {
		return sqlSession.selectList("adminMapper.selectSList");
	}

	// 스케줄 조회 시 트레이너 필터 적용 DAO
	public List<PT> scheduleFilter(List<Integer> noList) {
		return sqlSession.selectList("adminMapper.scheduleFilter", noList);
	}

	// 회원수 세기 DAO
	public Integer countMember() {
		return sqlSession.selectOne("adminMapper.countMember");
	}
	public Integer countTrainer() {
		return sqlSession.selectOne("adminMapper.countTrainer");
	}

	// 휴면계정 DAO
	public int dormantAccount() {
		return sqlSession.update("adminMapper.dormantAccount");
	}



}