package com.kh.dagym.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.dagym.common.PageInfo;
import com.kh.dagym.member.model.dao.MemberDAO;
import com.kh.dagym.member.model.service.MemberService;
import com.kh.dagym.member.model.vo.Member;
import com.kh.dagym.member.model.vo.MyBoard;
import com.kh.dagym.member.model.vo.MyPass;
import com.kh.dagym.member.model.vo.MyReply;
import com.kh.dagym.member.model.vo.MyStudents;
import com.kh.dagym.member.model.vo.reservationCancel;
import com.kh.dagym.trainer.model.dao.TrainerDAO;
import com.kh.dagym.trainer.model.vo.PT;
import com.kh.dagym.trainer.model.vo.Review;
import com.kh.dagym.trainer.model.vo.Trainer;
import com.kh.dagym.trainer.model.vo.TrainerSchedule;

@Service //Service 레이어, 비지니스 로직 처리를 하는 클래스임을 명시 + Bean 등록
public class MemberServiceImpl implements MemberService{
   
   @Autowired //등록된 MemberDAO bean을 이용해 의존성 주입(DI) 진행
   private MemberDAO memberDAO;
   
   @Autowired
   private BCryptPasswordEncoder bcPwd;
   
   @Autowired
   private PageInfo pInfo;
   
   @Autowired
	private TrainerDAO trainerDAO;

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
         int listCount = memberDAO.getMyBoardListCount(rerlyMemberNo);
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
      
      // 이용권 및 결제정보 페이징 처리 Service 구현
      @Override
      public PageInfo myPassPagination(int type, int cp, int memberNo) {
         int listCount = memberDAO.getMyPassListCount(memberNo);
         pInfo.setLimit(10);
         pInfo.setPageInfo(cp, listCount, type);      

         return pInfo;
      }
      
      // 이용권 및 결제정보 Service 구현
      @Override
      public List<MyPass> MyPassList(int memberNo, PageInfo pInfo) {
         List<MyPass> myPassList = memberDAO.myPassList(memberNo,pInfo);
         return myPassList;
      }
      
      // 아이디 찾기 구현
      @Override
      public String findId(String email) {
         return memberDAO.findId(email);
      }
      
      // 내 수강생 조회 페이징 처리 Service 구현
      @Override
      public PageInfo myStudentsPagination(int type, int cp, int memberNo) {
         int listCount = memberDAO.getMyStudentsListCount(memberNo);
         pInfo.setLimit(10);
         pInfo.setPageInfo(cp, listCount, type);      

         return pInfo;
      }
      
      // 내 수강생 조회  Service 구현
      @Override
      public List<MyStudents> myStudentsList(int memberNo, PageInfo pInfo) {
         List<MyStudents> myStudentsList = memberDAO.myStudentsList(memberNo,pInfo);
         return myStudentsList;
      }

      // 비밀번호 찾기 - 아이디확인 구현
      @Override
      public int checkId(Member member) {
         return memberDAO.checkId(member);
      }

      
      // 비밀번호 찾기 - 임시비밀번호 저장
      @Transactional(rollbackFor = Exception.class)
      @Override
      public int updatePw(Member member) {
         String encPwd = bcPwd.encode(member.getMemberPwd());
         member.setMemberPwd(encPwd);
         return memberDAO.updatePw(member);
      }


      // 리뷰 등록
      @Transactional(rollbackFor = Exception.class)
      @Override
      public int insertReview(Review review) {
    	  
    	  int result = memberDAO.insertReview(review);
    	  
    	  if(result>0) {
    		  List<Trainer> tList = new ArrayList<Trainer>();
    			tList = trainerDAO.selectList();
    			if(tList != null) {
    				for(Trainer tr : tList) {
    					List<Integer> list = new ArrayList<Integer>();
    					list = trainerDAO.selectTrainerNo();
    					for(int i=0; i<list.size(); i++) {
    						System.out.println("list.get(i) : "  + list.get(i));
    						
    						if(list.get(i) == tr.getTrainerNo()) {
    							Trainer tt = trainerDAO.selectGrade(tr.getTrainerNo());
    							tr.setReviewGrade(tt.getReviewGrade());
    							Map<String, Object> map = new HashMap<String, Object>();
    							map.put("trainerNo", tr.getTrainerNo());
    							map.put("trainerGrade", tr.getReviewGrade());
    							 result = trainerDAO.updateGrade(map);
    						}
    					}
    				}
    			}
    	  }
    	  
    	  return result;
      }
      // 다음 리뷰번호 받아오기
      @Override
      public int selectReviewNo() {
         return memberDAO.selectReviewNo();
      }

      // 리뷰 작성 여부 확인 
      @Override
      public int checkReview(int mUid) {
         return memberDAO.checkReview(mUid);
      }
      
      // 마이페이지 회원 스케줄 Service 구현
      @Override
      public List<PT> myPt(int memberNo) {
         return memberDAO.myPt(memberNo);
      }

      // 마이페이지 트레이너 스케줄 Service 구현
      @Override
      public List<TrainerSchedule> myTPt(int memberNo) {
         return memberDAO.myTPt(memberNo);
      }


      @Override
      public List<reservationCancel> Cancel(int memberNo) {
         return memberDAO.Cancel(memberNo);
      }
      
      @Transactional(rollbackFor = Exception.class)
      @Override
      public int cancel(reservationCancel cancel) {
         int result =  memberDAO.cancel(cancel);
         if(result>0) {
            int result2 =  memberDAO.plusCoupon(cancel);
               if(result2>0) {
                  int result3 =  memberDAO.trainerSchedule(cancel);
               }
         }
         return result;
      }
      // 리뷰 삭제 Service 구현
      @Transactional(rollbackFor = Exception.class)
      @Override
      public int deleteReview(int reviewNo) {
         return memberDAO.deleteReview(reviewNo);

      }

      // 내 리뷰 조회 페이징 처리 Service 구현
      @Override
      public PageInfo myReviewPagination(int type, int cp, int memberNo) {
         int listCount = memberDAO.getMyReviewListCount(memberNo);
         pInfo.setLimit(10);
         pInfo.setPageInfo(cp, listCount, type);      

         return pInfo;
      }

      // 내 리뷰 조회  Service 구현
      @Override
      public List<Review> myReviewList(int memberNo, PageInfo pInfo) {
         List<Review> myReviewList = memberDAO.myReviewList(memberNo,pInfo);
         return myReviewList;
      }
      // 이메일 중복검사 Service 구현
      @Override
      public int emailDupCheck(String email) {
         return memberDAO.emailDupCheck(email);
      }

      // 휴면계정 해제 Service 구현
      @Transactional(rollbackFor = Exception.class)
      @Override
      public int changeStatus(int memberNo) {
         return memberDAO.changeStatus(memberNo);
      }

      // 리뷰 수정 구현
      @Transactional(rollbackFor = Exception.class)
      @Override
      public int updateReview(Review review) {
    	  
    	  int result = memberDAO.updateReview(review);
    			  
    			  if(result>0) {
    	    		  List<Trainer> tList = new ArrayList<Trainer>();
    	    			tList = trainerDAO.selectList();
    	    			if(tList != null) {
    	    				for(Trainer tr : tList) {
    	    					List<Integer> list = new ArrayList<Integer>();
    	    					list = trainerDAO.selectTrainerNo();
    	    					for(int i=0; i<list.size(); i++) {
    	    						if(list.get(i) == tr.getTrainerNo()) {
    	    							Trainer tt = trainerDAO.selectGrade(tr.getTrainerNo());
    	    							tr.setReviewGrade(tt.getReviewGrade());
    	    							Map<String, Object> map = new HashMap<String, Object>();
    	    							map.put("trainerNo", tr.getTrainerNo());
    	    							map.put("trainerGrade", tr.getReviewGrade());
    	    							result = trainerDAO.updateGrade(map);
    	    						}
    	    					}
    	    				}
    	    			}
    	    	  }
    	  
         return result;
      }

      
      
}