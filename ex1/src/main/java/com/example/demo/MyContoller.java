package com.example.demo;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.Service.IMyService;
import com.example.demo.dto.dto_members;

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
	public String mainPage(Model model) {
		model.addAttribute("banner_img", service.viewBanner());	
		return "main";
	}
	
	// 고객센터메인(공지사항)
	@RequestMapping("/servicePage_main")
	public String servicePage_main(Model model) {
		model.addAttribute("notice_board_list", service.list_notice());		
		int nTotalCount = service.count();	
	return "servicePage/servicePage_main";
	}
	
	// 회원가입페이지
	@RequestMapping("/joinPage_main")
	public String joinPage_main() {
		return "joinPage/joinPage_main";
	}
	
	// 회원가입 확인 페이지
	@RequestMapping("/join_ok")
	public String join_ok(@RequestParam("user_id") String user_id, @RequestParam("user_pw") String user_pw, @RequestParam("user_pw_ok") String user_pw_ok, @RequestParam("email") String user_email, @RequestParam("user_name") String user_name, @RequestParam("phone") String user_phone, @RequestParam("address") String user_address, @RequestParam("gender_select") String user_gender, @RequestParam("user_birth") String user_birth, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if( ! (user_pw.equals( user_pw_ok ) )) { // 비밀번호, 확인란 재확인
			out.println("<script>alert('비밀번호를 다시 확인해주세요'); history.go(-1);</script>");
			out.flush();
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put( "user_id", user_id );
		map.put( "user_pw", user_pw );
		map.put( "user_email", user_email );
		map.put( "user_name", user_name );
		map.put( "user_phone", user_phone ); // 휴대폰번호 숫자만
		map.put( "user_address", user_address );
		map.put( "user_gender", user_gender ); // 남자 1, 여자 2, 선택안함 3
		map.put( "user_birth", user_birth );
			
		int nResult = service.join_ok( map );
		if( nResult < 1 ) {
			out.println("<script>alert('회원가입 실패.'); location.href='/joinPage_main';</script>");
			out.flush();
			return "main";
		} else {
			out.println("<script>alert('회원가입 완료 하였습니다.'); location.href='/main';</script>");
			out.flush();
			return "main";
		}
	}
	
	// 로그인페이지
	@RequestMapping("/loginPage_main")
	public String loginPage_main() {
		return "loginPage/loginPage_main";
	}
	
	// 로그인 확인 페이지
	@RequestMapping("/login_ok")
	public String login_ok(@RequestParam("user_id") String user_id, @RequestParam("user_pw") String user_pw,  HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put( "user_id", user_id );
		map.put( "user_pw", user_pw );
		
		List<dto_members> list = service.login( map );
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if( list.isEmpty() ) { // 아이디 없음
			out.println("<script>alert('아이디를 확인해주세요.'); location.href='/loginPage_main';</script>");
			out.flush();
			return "loginPage_main";
		} else { // 아이디 있음
			if( user_pw.equals( list.get(0).getUser_pw()) ) { // 비밀번호 일치
				HttpSession session = request.getSession(); // 세션 시작
				session.setAttribute("user_id", user_id); // id 세션 저장
				session.setAttribute("user_name", list.get(0).getUser_name() ); // 이름 세션 저장
				session.setAttribute("user_grade", list.get(0).getUser_grade()); // 등급 세션 저장
				session.setAttribute("user_point", list.get(0).getUser_point()); // 적립금 세션 저장
				out.println("<script>alert('로그인 되었습니다.'); location.href='/main';</script>");
				out.flush();
				return "main";
			} else { // 비밀번호 불일치
				out.println("<script>alert('비밀번호를 확인해주세요.'); location.href='/loginPage_main';</script>");
				out.flush();
				return "loginPage_main";
			}
		}
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        session.invalidate();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('로그아웃 되었습니다.'); location.href='/main';</script>");
		out.flush();
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

	// 공지사항 글
	@RequestMapping("/notice_board")
	public String notice_board( @RequestParam("notice_index") String notice_index, @RequestParam("notice_index") int notice_index_nb, Model model ) {
		model.addAttribute("dto_notice_board", service.view_notice(notice_index));
		model.addAttribute("dto_notice_board_before", service.view_notice(String.valueOf(notice_index_nb-1))); // 이전글
		model.addAttribute("dto_notice_board_after", service.view_notice(String.valueOf(notice_index_nb+1))); // 다음글
		service.updateViewCount_notice(notice_index); // 조회수 증가
		return "servicePage/notice_board";
	}
	
	// 공지사항 글 검색하기
	@RequestMapping("/notice_board_search")
	public String notice_board_search( @RequestParam("search_text") String search_text, @RequestParam(value="search_filter", required=false, defaultValue="notice_title") String search_filter, Model model ) {
		model.addAttribute("dto_notice_board_search", service.search_notice(search_filter, search_text));
		return "servicePage/notice_board_search";
	}

	// 아이디,비밀번호찾기 페이지
	@RequestMapping("/foundId")
	public String foundId() {
		return "myPage/myFoundId";
	}

	// 자주하는질문 페이지
	@RequestMapping("/fre_ask_questions")
	public String fre_ask_questions(Model model) {
		model.addAttribute("fre_que_list", service.list_fre_ask());
		return "servicePage/fre_ask_questions";
	}

	// 자주하는질문 페이지 카테고리 선택
	@RequestMapping("/fre_que_select")
	public String fre_que_select(@RequestParam(value="select", required=false) String categori, Model model ) {
		model.addAttribute("dto_fre_ask_select", service.select_fre_ask( categori ));
		return "servicePage/fre_que_select";
	}
	
	// 자주하는페이지 검색
	@RequestMapping("/fre_ask_search")
	public String fre_ask_search(@RequestParam("search_text") String search_text, Model model ) {
		model.addAttribute("search_text", service.search_fre_ask( search_text ));
		return "servicePage/fre_ask_search";
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

	// 상품후기
	@RequestMapping("/myReview")
	public String myReview() {
		
		return "myPage/myReview";
	}
	// 상품후기작성
		@RequestMapping("/myReview_write")
		public String myReview_write() {
			
			return "myPage/myReview_write";
		}
	
	// 적립금
	@RequestMapping("/myPoint")
	public String myPoint() {
		
		return "myPage/myPoint";
	}
	
	// 개인정보수정
	@RequestMapping("/updateInform")
	public String updateInform() {
		
		return "myPage/updateInform";
	}
	
	
	
}
