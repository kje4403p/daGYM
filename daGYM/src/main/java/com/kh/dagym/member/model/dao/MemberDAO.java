package com.kh.dagym.member.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dagym.common.PageInfo;
import com.kh.dagym.member.model.vo.Member;
import com.kh.dagym.member.model.vo.MyBoard;
import com.kh.dagym.member.model.vo.MyPass;
import com.kh.dagym.member.model.vo.MyReply;
import com.kh.dagym.member.model.vo.MyStudents;
import com.kh.dagym.trainer.model.vo.Review;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 회원가입 DAO
	 * @param signUpMember
	 * @return result
	 */
	public int signUp(Member signUpMember) {

		return sqlSession.insert("memberMapper.signUp", signUpMember);
	}

	/** 로그인 DAO
	 * @param member
	 * @return loginMember
	 */
	public Member login(Member member) {
		return sqlSession.selectOne("memberMapper.loginMember", member);
	}

	/** 아이디 중복체크 DAO
	 * @param memberId
	 * @return result
	 */
	public int idDupCheck(String memberId) {
		return sqlSession.selectOne("memberMapper.idDupCheck",memberId);
	}

	/** 회원 비밀번호 확인용 DAO
	 * @param memberNo
	 * @return result
	 */
	public String checkPwd(int memberNo) {
		return sqlSession.selectOne("memberMapper.checkPwd",memberNo);
	}
	
	
	/** 회원정보 수정용 DAO
	 * @param upMember
	 * @return result
	 */
	public int updateMember(Member upMember) {
		return sqlSession.insert("memberMapper.updateMember", upMember);
	}

	/** 회원탈퇴 DAO
	 * @param memberNo
	 * @return result
	 */
	public int removeMember(int memberNo) {
		return sqlSession.insert("memberMapper.removeMember", memberNo);
	}

	/** 내 댓글 DAO
	 * @param pInfo 
	 * @param memberNo
	 * @return myReplyList
	 */
	public List<MyReply> myReplyList(int rerlyMemberNo, PageInfo pInfo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		return sqlSession.selectList("memberMapper.myReplyList", rerlyMemberNo,rowBounds);
	}

	/** 내 댓글 페이징 처리 DAO
	 * @param rerlyMemberNo
	 * @return listCount
	 */
	public int getMyReplyListCount(int rerlyMemberNo) {
		return sqlSession.selectOne("memberMapper.MyReplyListCount",rerlyMemberNo);
	}

	/** 내 게시판 페이징 처리 DAO
	 * @param rerlyMemberNo
	 * @return listCount
	 */
	public int getMyBoardListCount(int rerlyMemberNo) {
		int boardWriter = rerlyMemberNo;
		return sqlSession.selectOne("memberMapper.MyBoardListCount",boardWriter);
	}

	/** 내 게시판 DAO
	 * @param rerlyMemberNo
	 * @param pInfo
	 * @return myBoardList
	 */
	public List<MyBoard> myBoardList(int rerlyMemberNo, PageInfo pInfo) {
		int boardWriter = rerlyMemberNo;
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		return sqlSession.selectList("memberMapper.myBoardList", boardWriter,rowBounds);
	}
	
	/** 이용권 및 결제정보 페이징 처리 DAO
	 * @param rerlyMemberNo
	 * @return listCount
	 */
	public int getMyPassListCount(int memberNo) {
		return sqlSession.selectOne("memberMapper.MyPassListCount",memberNo);
	}
	
	
	/** 이용권 및 결제정보 DAO
	 * @param memberNo
	 * @param pInfo
	 * @return myPassList
	 */
	public List<MyPass> myPassList(int memberNo, PageInfo pInfo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		return sqlSession.selectList("memberMapper.myPassList", memberNo,rowBounds);
	}

	/** 아이디 찾기 DAO
	 * @param email
	 * @return id
	 */
	public String findId(String email) {
		return sqlSession.selectOne("memberMapper.findId", email);
	}

	/** 내 수강생 페이징 처리 DAO
	 * @param memberNo
	 * @return listCount
	 */
	public int getMyStudentsListCount(int memberNo) {
		return sqlSession.selectOne("memberMapper.MyStudentsListCnt",memberNo);
	}

	/** 내 수강생 조회 Service DAO
	 * @param memberNo
	 * @param pInfo
	 * @return myStudentsList
	 */
	public List<MyStudents> myStudentsList(int memberNo, PageInfo pInfo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		return sqlSession.selectList("memberMapper.myStudentsList", memberNo,rowBounds);
	}

	/** 비밀번호찾기 - 아이디 확인 DAO
	 * @param id
	 * @return checkId
	 */
	public int checkId(Member member) {
		return sqlSession.selectOne("memberMapper.checkId", member);
	}

	/** 비밀번호찾기 - 아이디 확인 DAO
	 * @param id
	 * @return checkId
	 */
	public int checkEmail(String email) {
		return sqlSession.selectOne("memberMapper.checkEmail", email);
	}

	/** 비밀번호 찾기 - 임시비밀번호 저장 DAO
	 * @param member
	 * @return result
	 */
	public int updatePw(Member member) {
		return sqlSession.update("memberMapper.updatePw",member);
	}

	/** 리뷰등록 DAO
	 * @param review
	 * @return result
	 */
	public int insertReview(Review review) {
		return sqlSession.insert("memberMapper.insertReview", review);
	}

	/** 다음 리뷰번호 받아오기
	 * @return reviewNo
	 */
	public int selectReviewNo() {
		return sqlSession.selectOne("memberMapper.selectReviewNo");
	}	
}
