package com.kh.dagym.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.dagym.member.model.service.MemberService;
import com.kh.dagym.member.model.vo.Member;

@SessionAttributes({"loginMember"})
@Component
@RequestMapping("/member/*")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
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
			
			
}
