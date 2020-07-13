package com.example.demo;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.Service.IMyService;

@Controller
public class MyContoller {
	
	@Autowired
	IMyService service;
	
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
	
	// 회원가입 확인 페이지
	@RequestMapping("/join_ok")
	public String join_ok(HttpServletRequest request) {
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_pw_ok = request.getParameter("user_pw_ok");
		String user_email = request.getParameter("email");
		String user_name = request.getParameter("user_name");
		String user_phone = request.getParameter("phone");
		String user_address = request.getParameter("address");
		String user_gender = request.getParameter("gender_select");
		String user_birth = request.getParameter("user_birth");
		String user_service = request.getParameter("service");
		
		if( user_pw == user_pw_ok ) { // 비밀번호, 비밀번호 확인 란 동일하면
			Map<String, String> map = new HashMap<String, String>();
			map.put( "user_id", user_id );
			map.put( "user_pw", user_pw );
			map.put( "user_email", user_email );
			map.put( "user_name", user_name );
			map.put( "user_phone", user_phone );
			map.put( "user_address", user_address );
			map.put( "user_gender", user_gender );
			map.put( "user_birth", user_birth );
			map.put( "user_service", user_service );
			
			int nResult = service.join_ok( map );
			
				if( nResult < 1 ) {
					System.out.println("회원가입 실패");
					return "main";
				} else {
					System.out.println("회원가입 성공");
					return "main";
				}
		}
		return "main";
	}
	
	// 로그인페이지
	@RequestMapping("/loginPage_main")
	public String loginPage_main() {
		return "loginPage/loginPage_main";
	}
	
	// 로그인 확인 페이지
	@RequestMapping("/login_ok")
	public String login_ok(HttpServletRequest request, Model model) {
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put( "user_id", user_id );
		map.put( "user_pw", user_pw );
		
		Map<String, String> list = service.login( map );

		if( list.isEmpty() ) { // 아이디 없음
			System.out.println("아이디를 확인하세요");
			return "loginPage/loginPage_main";
		} else { // 아이디 있음
			if( user_pw.equals( list.get("user_pw")) ) { // 비밀번호 일치
				HttpSession session = request.getSession(); // 세션 시작
				session.setAttribute("user_id", user_id); // id 세션 저장
				session.setAttribute("user_name", list.get("user_name") ); // 이름 세션 저장
				session.setAttribute("user_grade", list.get("user_grade")); // 등급 세션 저장
				session.setAttribute("user_point", list.get("user_point")); // 적립금 세션 저장
				
				return "main";
			} else { // 비밀번호 불일치
				System.out.println("비밀번호를 확인하세요.");
				return "loginPage/loginPage_main";
			}

		}
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();

		return "main";
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
	
	// 이벤트서브페이지(관리자 DB)추가
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

	// 아이디,비밀번호찾기 페이지
	@RequestMapping("/foundId")
	public String foundId() {
		
		return "myPage/myFoundId";
	}

	// 자주하는질문 페이지
	@RequestMapping("/fre_ask_questions")
	public String fre_ask_questions() {
		
		return "servicePage/fre_ask_questions";
	}

	// 1:1문의 페이지
	@RequestMapping("/personal_question")
	public String personal_question() {
		
		return "servicePage/personal_question";
	}

	// 1:1문의 글쓰기 페이지
	@RequestMapping("/personal_question_write")
	public String personal_question_write() {
		
		return "servicePage/personal_question_write";
	}

	// 상품상세페이지
	@RequestMapping("/item_detail")
	public String item_detail() {
		
		return "item/item_detail";
	}
	
	// 마이페이지 메인
	@RequestMapping("/myPage_main")
	public String myPage_main() {
		
		return "myPage/myPage_main";
	}
	
	// 주문상세내역
	@RequestMapping("/myOrder")
	public String myOrder() {
		
		return "myPage/myOrder";
	}
	
	
	
	
}
