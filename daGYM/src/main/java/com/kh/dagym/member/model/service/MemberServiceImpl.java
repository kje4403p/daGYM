package com.kh.dagym.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.dagym.common.PageInfo;
import com.kh.dagym.member.model.dao.MemberDAO;
import com.kh.dagym.member.model.service.MemberService;
import com.kh.dagym.member.model.vo.Member;
import com.kh.dagym.member.model.vo.MyBoard;
import com.kh.dagym.member.model.vo.MyReply;

@Service //Service 레이어, 비지니스 로직 처리를 하는 클래스임을 명시 + Bean 등록
public class MemberServiceImpl implements MemberService{
	
	@Autowired //등록된 MemberDAO bean을 이용해 의존성 주입(DI) 진행
	private MemberDAO memberDAO;
	
	@Autowired
	private BCryptPasswordEncoder bcPwd;
	
	@Autowired
	private PageInfo pInfo;

	// 회원가입 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int signUp(Member signUpMember) {
		
		String encPwd = bcPwd.encode(signUpMember.getMemberPwd());
		signUpMember.setMemberPwd(encPwd);
		int result = memberDAO.signUp(signUpMember);
		return result;
	}

	// 로그인 Service구현
	@Override
	public Member login(Member member) {
		Member loginMember = memberDAO.login(member);
		if(loginMember != null) {
			if(!bcPwd.matches(member.getMemberPwd(), loginMember.getMemberPwd())) {
				loginMember = null;
			}else {
				loginMember.setMemberPwd(null);
			}
		}
		return loginMember;
	}
	// 아이디 중복체크 Service 구현
	@Override
	public int idDupCheck(String memberId) {
		return memberDAO.idDupCheck(memberId);
	}
	
	// 회원 비밀번호 확인용 Service 구현
	@Override
	public int checkPwd(String memberPwd, int memberNo) { 
		String savePwd = memberDAO.checkPwd(memberNo);
		int result = 0;
		
		if(savePwd != null) {
			// 조회한 PWD와 입력받은 PWD가 같은지 비교
			if(bcPwd.matches(memberPwd, savePwd)) {
				result= 1;
				memberPwd = null;
			}
	}
		return result;

	}

	// 마이페이지 수정 Service 구현
		@Transactional(rollbackFor = Exception.class)
		@Override
		public int updateMember(Member upMember){
			String encPwd = bcPwd.encode(upMember.getMemberPwd());
			upMember.setMemberPwd(encPwd);
			return memberDAO.updateMember(upMember);
		}

		// 회원 탈퇴용 Service 구현
		@Transactional(rollbackFor = Exception.class)
		@Override
		public int removeMember(String memberPwd, int memberNo) {
			String savePwd = memberDAO.checkPwd(memberNo);
			int result = -1;
			
			if(savePwd != null) {
				// 조회한 PWD와 입력받은 PWD가 같은지 비교
				if(bcPwd.matches(memberPwd, savePwd)) {
					result = memberDAO.removeMember(memberNo);
					memberPwd = null;
				}
		}
			return result;
	}
		
		// 내 댓글 Service 구현
		@Override
		public List<MyReply> MyReplyList(int rerlyMemberNo, PageInfo pInfo) {
			List<MyReply> myReplyList = memberDAO.myReplyList(rerlyMemberNo,pInfo);
			return myReplyList;
		}
		
		// 내 댓글 페이징처리 Service 구현
		@Override
		public PageInfo replyPagination(int type, int cp, int rerlyMemberNo) {
			// 1) 전체  댓글 수 조회
			int listCount = memberDAO.getMyReplyListCount(rerlyMemberNo);
			// 2) setPageInfo 호출
			pInfo.setLimit(10);
			pInfo.setPageInfo(cp, listCount, type);		

			return pInfo;
		}
		
		// 내 게시판 페이징 처리 Service 구현
		@Override
		public PageInfo boardPagination(int type, int cp, int rerlyMemberNo) {
			// 1) 전체  댓글 수 조회
			int listCount = memberDAO.getMyBoardListCount(rerlyMemberNo);
			// 2) setPageInfo 호출
			pInfo.setLimit(10);
			pInfo.setPageInfo(cp, listCount, type);		

			return pInfo;
		}
		
		// 내 게시글 Service 구현
		@Override
		public List<MyBoard> myBoardList(int rerlyMemberNo, PageInfo pInfo) {
			List<MyBoard> myBoardList = memberDAO.myBoardList(rerlyMemberNo,pInfo);
			return myBoardList;
		}
}
