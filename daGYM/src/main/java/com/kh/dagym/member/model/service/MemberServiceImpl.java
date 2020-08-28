package com.kh.dagym.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.dagym.member.model.dao.MemberDAO;
import com.kh.dagym.member.model.service.MemberService;
import com.kh.dagym.member.model.vo.Member;

@Service //Service 레이어, 비지니스 로직 처리를 하는 클래스임을 명시 + Bean 등록
public class MemberServiceImpl implements MemberService{
	
	@Autowired //등록된 MemberDAO bean을 이용해 의존성 주입(DI) 진행
	private MemberDAO memberDAO;

	// 회원가입 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int signUp(Member signUpMember) {
		int result = memberDAO.signUp(signUpMember);
		return result;
	}
	
	}
