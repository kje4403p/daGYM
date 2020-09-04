package com.kh.dagym.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dagym.member.model.vo.Member;

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
}
