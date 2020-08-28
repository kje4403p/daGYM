package com.kh.dagym.member.model.service;

import com.kh.dagym.member.model.vo.Member;

public interface MemberService {

	/** 회원가입 Service
	 * @param signUpMember
	 * @return
	 */
	int signUp(Member signUpMember);

}
