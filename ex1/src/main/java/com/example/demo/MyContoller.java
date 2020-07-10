package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyContoller {

	@RequestMapping("/")
	public String root() throws Exception {
		return "redirect:main";
	}
	
	// 메인페이지
	@RequestMapping("/main")
	public String mainPage() {

		return "main";
	}
	
	// 고객센터메인
	@RequestMapping("/servicePage_main")
	public String servicePage_main() {
		
		return "servicePage/servicePage_main";
	}
	
	// 회원가입페이지
	@RequestMapping("/joinPage_main")
	public String joinPage_main() {
		
		return "joinPage/joinPage_main";
	}
	
	// 로그인페이지
	@RequestMapping("/loginPage_main")
	public String loginPage_main() {
		
		return "loginPage/loginPage_main";
	}
	
	// 정기배송메인
	@RequestMapping("/regularOrder_main")
	public String regularOrder_main() {
		
		return "regular_order/regularOrder_main";
	}
	
	// 제철과일메인
	@RequestMapping("/fruitInSeason_main")
	public String fruitInSeason_main() {
		
		return "item/fruitInSeason_main";
	}
	
	// 수입과일메인
	@RequestMapping("/importedFruit_main")
	public String importedFruit_main() {
		
		return "item/importedFruit_main";
	}

	// 낙과채널메인
	@RequestMapping("/fallenFruit_main")
	public String fallenFruit_main() {
		
		return "item/fallenFruit_main";
	}
	
	// 이벤트메인
	@RequestMapping("/event_main")
	public String event_main() {
		
		return "event/event_main";
	}
	
	// 이벤트메인(관리자 DB)추가
		@RequestMapping("/event_sub")
		public String event_sub() {
			
			return "event/event_sub";
		}
	
	// 장바구니메인
	@RequestMapping("/myCart")
	public String myCart() {
		
		return "myPage/myCart";
	}
	
	// 과일장수소개페이지
	@RequestMapping("/about")
	public String about() {
		
		return "servicePage/about";
	}

	// 이용약관페이지
	@RequestMapping("/agreement")
	public String agreement() {
		
		return "servicePage/agreement";
	}

	// 개인정보처리방침페이지
	@RequestMapping("/policyInform")
	public String policyInform() {
		
		return "servicePage/policyInform";
	}

	// 공지사항 글 (db 추가 필요)
	@RequestMapping("/notice_board")
	public String notice_board() {
		
		return "servicePage/notice_board";
	}	
	
	
	
	
}
