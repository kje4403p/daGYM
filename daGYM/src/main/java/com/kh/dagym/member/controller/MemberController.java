package com.kh.dagym.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.dagym.member.model.service.MemberService;
import com.kh.dagym.member.model.vo.Member;
import com.kh.dagym.member.model.vo.MyBoard;
import com.kh.dagym.member.model.vo.MyReply;

@SessionAttributes({"loginMember"})
@Component
@RequestMapping("/member/*")
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	JavaMailSender mailSender;
	
	//로그인 화면 전환 메소드
	@RequestMapping("login")
	public String loginView() {
		return "member/login";
	}
	
	//로그아웃 메소드
	@RequestMapping("logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
		
	}
	// 마이페이지 화면 전환 메소드
			@RequestMapping("myPage")
			public String myPageView() {
				return "member/myPage";
		}
			
	// 내 게시글 화면 전환 메소드
			@RequestMapping("myBoardList/{type}")
			public String myBoardView(@PathVariable int type, @RequestParam(value="cp", required = false, defaultValue = "1") int cp, Model model) {
				int rerlyMemberNo =  ((Member)model.getAttribute("loginMember")).getMemberNo();
				// 전체 게시글 수 조회 + 현재페이즈 확인
				com.kh.dagym.common.PageInfo pInfo = memberService.boardPagination(type, cp, rerlyMemberNo);
				// 게시글 목록 조회 
				List<MyBoard> myBoardList = memberService.myBoardList(rerlyMemberNo,pInfo);
				model.addAttribute("myBoardList", myBoardList);
				model.addAttribute("pInfo",pInfo);
				return "member/myBoard";
		}
	
	// 내 댓글 화면 전환 메소드
			@RequestMapping("myReplyList/{type}")
			public String myReplyView(@PathVariable int type, @RequestParam(value="cp", required = false, defaultValue = "1") int cp, Model model) {
				int rerlyMemberNo =  ((Member)model.getAttribute("loginMember")).getMemberNo();
				// 전체 댓글 수 조회 + 현재페이즈 확인 (페이징은 common에서 가져옴)
				com.kh.dagym.common.PageInfo pInfo = memberService.replyPagination(type, cp, rerlyMemberNo);
				// 댓글 목록 조회
				List<MyReply> myReplyList = memberService.MyReplyList(rerlyMemberNo,pInfo);
				
				model.addAttribute("myReplyList", myReplyList);
				model.addAttribute("pInfo",pInfo);
				return "member/myReply";
			}
			
	// 내 스케줄 화면 전환 메소드
			@RequestMapping("mySchedule")
			public String myScheduleView() {
				return "member/mySchedule";
		}
			
	// 회원정보 체크 화면 전환 메소드
			@RequestMapping("memberProfileCk")
			public String memberProfileCk() {
				return "member/memberProfileCk";
		}
	// 회원정보  화면 전환 메소드
			@RequestMapping("memberProfile")
			public String memberProfile() {
				return "member/memberProfile";
		}
			
	
			
	// 패스워드 확인 후 회원정보 화면 전환 메소드
			@RequestMapping("checkPwd")
			public String memberProfileAction(String memberPwd, Model model, RedirectAttributes rdAttr, HttpServletResponse response) {
				int memberNo =  ((Member)model.getAttribute("loginMember")).getMemberNo();
				int result = memberService.checkPwd(memberPwd,memberNo);
				String status = null;
				String msg = null;
				String text = null;
				String link = null;
				if(result > 0) {
					link = "member/memberProfile";
				} else {
					status = "error";
					msg = "오류 발생";
					text = "현재 비밀번호를 확인해 주세요";	
					link = "member/memberProfileCk";
				}
				
				rdAttr.addFlashAttribute("msg", msg);
				rdAttr.addFlashAttribute("status", status);
				rdAttr.addFlashAttribute("text", text);
				return "redirect:/" + link;
		}
			
	// 회원정보 변경 메소드
			@RequestMapping("updateAction")
			public String updateAction(Member upMember, Model model, RedirectAttributes rdAttr, HttpServletRequest request) {
			
				Member loginMember = (Member)model.getAttribute("loginMember");
				
				upMember.setMemberNo(loginMember.getMemberNo());

				int result = memberService.updateMember(upMember);
				String msg = null;
				String status = null;
				if (result > 0) {
					model.addAttribute("loginMember", upMember);
					status="success";
					msg = "회원정보가 수정 되었습니다.";
				} else {
					status="error";
					msg = "회원정보 수정에 실패 했습니다. 지속적인 오류 발생 시 관리자에게 문의주세요.";
				}
				rdAttr.addFlashAttribute("status", status);
				rdAttr.addFlashAttribute("msg", msg);
				return "redirect:/member/mypage";
			
	}
	
	// PT이용권/결제정보 화면 전환 메소드
			@RequestMapping("memberPass")
			public String memberPass() {
				return "member/memberPass";
		}
			
	// 회원탈퇴 화면 전환 메소드
				@RequestMapping("memberRemove")
				public String memberRemove() {
					return "member/memberRemove";
			}
	// 회원탈퇴 메소드
				@RequestMapping("memberRemoveAction")
				public String removeMember(String memberPwd, Model model, RedirectAttributes rdAttr, HttpServletRequest request, SessionStatus status1) {
					int memberNo =  ((Member)model.getAttribute("loginMember")).getMemberNo();
					
					int result = memberService.removeMember(memberPwd,memberNo);
					
					String msg = null;
					String status = null;
					String text = null;
					String link = null;
					if(result > 0) {
						msg="회원 탈퇴 성공";
						status = "success";
						link ="";
						status1.setComplete();
					}else if(result == 0){
						msg="회원 탈퇴 실패";
						status = "error";
						link = "member/memberRemove";
					}else if(result == -1){
						msg="패스워드가 일치하지 않습니다.";
						status = "error";
						link = "member/memberRemove";
					}
					rdAttr.addFlashAttribute("msg", msg);
					rdAttr.addFlashAttribute("status", status);
					return "redirect:/" +link;
				}	
				
			// 회원가입 화면 전환 메소드
			@RequestMapping(value="signUp", method=RequestMethod.GET)
			public String signUpView() {
				return "member/signUpView";
			}
			
			// 회원가입
			@RequestMapping(value = "signUpAction", method=RequestMethod.POST)
			public String signUpAction(Member signUpMember, RedirectAttributes rdAttr) {
				
				System.out.println(signUpMember);
				
				
				int result = memberService.signUp(signUpMember);
				
				String msg = null;
				String status = null;
				String text = null;
				if(result >0) {
					msg="회원 가입 성공";
					status = "success";
					
				}else {
					msg="회원 가입 실패";
					status = "error";
				}
				rdAttr.addFlashAttribute("msg", msg);
				rdAttr.addFlashAttribute("status", status);
				return "redirect:/";
				
			}
			@RequestMapping("emailCheck")
			public String emailCheckView() {
				return "member/emailCheck";
			}
			
			// 아이디 중복체크
			@ResponseBody
			@RequestMapping(value = "idDupCheck", method=RequestMethod.GET)
			public String idDupCheck(String memberId) {
				int result = memberService.idDupCheck(memberId);
				return result +"";
			}
			
			// 로그인
			@RequestMapping("loginAction")
			public String loginAction(Member member, Model model, RedirectAttributes rdAttr,
										String saveId, HttpServletResponse response) {
				
				Member loginMember = memberService.login(member);
				
				String msg = null;
				String status = null;
				String text = null;
				
				if(loginMember!= null) {
					model.addAttribute("loginMember", loginMember);
					
					Cookie cookie = new Cookie("saveId", member.getMemberId());
					
					if(saveId != null) {
						
						cookie.setMaxAge(60*60*24*7);
					}else {
						cookie.setMaxAge(0);
					}
					
					response.addCookie(cookie);
				}else {
					status = "error";
					msg = "로그인 실패";
					text = "아이디 또는 비밀번호를 확인해주세요.";
				}
				rdAttr.addFlashAttribute("msg", msg);
				rdAttr.addFlashAttribute("status", status);
				rdAttr.addFlashAttribute("text", text);
				
				return "redirect:/";
			}
			@ResponseBody
			@RequestMapping(value = "sendEmail", method=RequestMethod.GET)
			public String mailSending(HttpServletRequest request, String email, HttpServletResponse response) throws IOException {
				Random r = new Random();
				int dice=r.nextInt(4589362) + 49311;
				System.out.println("랜덤 : "+ r);
				String setfrom = "kljklj28561@gmail.com";
				String tomail = request.getParameter("memberEmail");
				String title = "회원가입 인증 이메일 입니다.";
				String content = 
						System.getProperty("line.separator")+
						System.getProperty("line.separator")+
						"안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다."
						+ System.getProperty("line.separator")
						+ System.getProperty("line.separator")+
						"인증번호는 " + dice + " 입니다." 
						+ System.getProperty("line.separator")
						+ System.getProperty("line.separator")
						+ "받으신 인증번호를 홈페이지에 입력해주시면 다음으로 넘어갑니다.";
				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
					messageHelper.setFrom(setfrom);
					messageHelper.setTo(tomail);
					messageHelper.setSubject(title);
					messageHelper.setText(content);
					mailSender.send(message);
				}catch (Exception e) {
					e.printStackTrace();
				}
				
				System.out.println(dice);
				String code = dice+"";
				
				return code;
			}
			
			
			
			
			
			
			
}
