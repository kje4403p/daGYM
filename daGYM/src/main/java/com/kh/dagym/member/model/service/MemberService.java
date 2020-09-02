package com.kh.dagym.member.model.service;

import com.kh.dagym.member.model.vo.Member;

public interface MemberService {

	/** 회원가입 Service
	 * @param signUpMember
	 * @return result
	 */
	int signUp(Member signUpMember);

	/** 로그인 Service
	 * @param member
	 * @return loginMember
	 */
	Member login(Member member);

	
	/** 아이디 중복체크 Service
	 * @param memberId
	 * @return result
	 */
	int idDupCheck(String memberId);

}
