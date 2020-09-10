package com.kh.dagym.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dagym.admin.model.vo.Attachment;
import com.kh.dagym.admin.model.vo.Board;
import com.kh.dagym.admin.model.vo.Member;
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

}