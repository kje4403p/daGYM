package com.kh.dagym;


import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller // 프레젠테이션 레이어, 웹 앱 View에서 전달받은 요청, 전달할 응답을 처리하는 클래스 라는 걸 명시 + Bean 등록
public class HomeController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		System.out.println("main 요청"); // 메인controller거치는지 확인.
		// .. : 상위
		// . : 현재
		// xxx/ : 하위
		return "../../main";
	}
	@RequestMapping("/intro")
	public String intro() {
		return "intro/main";
	}
	
}
