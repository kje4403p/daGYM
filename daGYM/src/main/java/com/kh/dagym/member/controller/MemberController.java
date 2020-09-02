package com.kh.dagym.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.dagym.member.model.service.MemberService;
import com.kh.dagym.member.model.vo.Member;

@SessionAttributes({"loginMember"})
@Component
@RequestMapping("/member/*")
public class MemberController {
	@Autowired
	private MemberService memberService;
	JavaMailSender mailSender;
	
	//로그인 화면 전환 메소드
	@RequestMapping("login")
	public String loginView() {
		return "member/login";
	}
	
	// 마이페이지 화면 전환 메소드
			@RequestMapping("mypage")
			public String myPageView() {
				return "member/myPage";
		}
			
	// 내 게시글 화면 전환 메소드
			@RequestMapping("mytext")
			public String myTextView() {
				return "member/myText";
		}
			
	// 내 스케줄 화면 전환 메소드
			@RequestMapping("myschedule")
			public String myScheduleView() {
				return "member/mySchedule";
		}
			
	// 회원정보 체크 화면 전환 메소드
			@RequestMapping("memberProfileCk")
			public String memberProfileCk() {
				return "member/memberProfileCk";
		}
			
	// 회원정보 체크 화면 전환 메소드
				@RequestMapping("memberProfile")
				public String memberProfile() {
					return "member/memberProfile";
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
			
			@RequestMapping(value = "auth.do", method=RequestMethod.POST)
			public ModelAndView mailSending(HttpServletRequest request, String email, HttpServletResponse response) throws IOException {
				Random r = new Random();
				int dice=r.nextInt(4589362) + 49311;
				
				String setfrom = "kljklj28561@gmail.com";
				String tomail = request.getParameter("email");
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
				ModelAndView mv = new ModelAndView();
				mv.setViewName("/member/emailCheck");
				mv.addObject("dice", dice);
				
				System.out.println("mv : " + mv);
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out_email = response.getWriter();
				out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
				out_email.flush();
				
				return mv;
			}
			
			
}
