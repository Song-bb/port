package com.example.demo;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.example.demo.Service.FileuploadService_personal_que;
import com.example.demo.Service.Service_banner_img;
import com.example.demo.Service.Service_event;
import com.example.demo.Service.Service_fre_ask_board;
import com.example.demo.Service.Service_items;
import com.example.demo.Service.Service_members;
import com.example.demo.Service.Service_myPage;
import com.example.demo.Service.Service_noticeBoard;
import com.example.demo.Service.Service_personal_que;
import com.example.demo.Service.Service_seceded_member;
import com.example.demo.dto.dto_members;
import com.example.demo.dto.dto_seceded_member;
import com.example.demo.Service.FileuploadService_event;
import com.example.demo.Service.FileuploadService_manager_item_update;



@Controller
public class MyContoller {
	
	@Autowired
	FileuploadService_personal_que fileUploadService;
	@Autowired
	Service_members service_members;
	@Autowired
	Service_noticeBoard service_noticeBoard;
	@Autowired
	Service_banner_img service_banner;
	@Autowired
	Service_fre_ask_board service_fre_ask;
	@Autowired
	Service_myPage service_myPage;
	@Autowired
	Service_personal_que service_personal_que;
	@Autowired
	Service_event service_event;
	@Autowired
	Service_seceded_member service_seced_member;
	@Autowired
	Service_items service_items;
	@Autowired
	FileuploadService_event fileUploadService_event;
	@Autowired
	FileuploadService_manager_item_update itemuploadService;
	
	
	
	@RequestMapping("/")
	public String root() throws Exception {
		return "redirect:main";
	}
	
	// 메인페이지
	@RequestMapping("/main")
	public String mainPage(Model model) {
		model.addAttribute("banner_img", service_banner.viewBanner());	
		return "main";
	}
	
	// 고객센터메인(공지사항)
	@RequestMapping("/servicePage_main")
	public String servicePage_main(Model model) {
		model.addAttribute("notice_board_list", service_noticeBoard.list_notice());		
	return "servicePage/servicePage_main";
	}
	
	// 회원가입페이지
	@RequestMapping("/joinPage_main")
	public String joinPage_main() {
		return "joinPage/joinPage_main";
	}
	
	// 회원가입-아이디 중복확인
	@RequestMapping("/duplication_check_id")
	@ResponseBody
	public int idCheck(@RequestParam("user_id") String user_id) {
		return service_members.checkId(user_id);
	}
	
	// 회원가입-이메일 중복확인
	@RequestMapping("/duplication_check_email")
	@ResponseBody
	public int emailCheck(@RequestParam("user_email") String user_email) {
		return service_members.checkEmail(user_email);
	}
	
	// 회원가입 확인 페이지
	@RequestMapping("/join_ok")
	public String join_ok(@RequestParam("user_id") String user_id, 
						  @RequestParam("user_pw") String user_pw, 
						  @RequestParam("user_pw_ok") String user_pw_ok, 
						  @RequestParam("email") String user_email, 
						  @RequestParam("user_name") String user_name, 
						  @RequestParam("phone") String user_phone, 
						  @RequestParam("main_address") String main_address, 
						  @RequestParam("detail_address") String detail_address,
						  @RequestParam("detail_address2") String detail_address2,
						  @RequestParam("postcode") String user_postcode,
						  @RequestParam(value="gender_select", required=false) String user_gender, 
						  @RequestParam(value="user_birth", required=false) String user_birth, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if( ! (user_pw.equals( user_pw_ok ) )) { // 비밀번호, 확인란 재확인
			out.println("<script>alert('비밀번호를 다시 확인해주세요'); history.go(-1);</script>");
			out.flush();
		}
		String address = "";
		address += main_address;
		address += " " + detail_address + " ";
		address += detail_address2;
		Map<String, String> map = new HashMap<String, String>();
		map.put( "user_id", user_id );
		map.put( "user_pw", user_pw );
		map.put( "user_email", user_email );
		map.put( "user_name", user_name );
		map.put( "user_phone", user_phone ); // 휴대폰번호 숫자만
		map.put( "user_address", address );
		map.put( "user_postcode", user_postcode );
		if( user_gender != null ) {
			map.put( "user_gender", user_gender );
		}
		if( user_birth != null  ) {
			map.put( "user_birth", user_birth );
		}
			
		int nResult = service_members.join_ok( map );
		if( nResult < 1 ) {
			return "joinPage/join_fail";
		} else {
			return "joinPage/join_success";
		}
	}
	
	// 로그인페이지
	@RequestMapping("/loginPage_main")
	public String loginPage_main() {
		return "loginPage/loginPage_main";
	}
	
	// 로그인 확인 페이지
	@RequestMapping("/login_ok")
	public String login_ok(@RequestParam("user_id") String user_id, 
						   @RequestParam("user_pw") String user_pw,  
						   HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		List<dto_members> list = service_members.login( user_id );
		if( list.isEmpty() ) { // 아이디 없음
			return "loginPage/login_fail_id";
		} else { // 아이디 있음
			if( user_pw.equals( list.get(0).getUser_pw()) ) { // 비밀번호 일치
				HttpSession session = request.getSession(); // 세션 시작
				session.setAttribute("user_id", user_id); // id 세션 저장
				session.setAttribute("user_name", list.get(0).getUser_name() ); // 이름 세션 저장
				session.setAttribute("user_grade", list.get(0).getUser_grade()); // 등급 세션 저장
				session.setAttribute("user_point", list.get(0).getUser_point()); // 적립금 세션 저장
				session.setAttribute("user_email", list.get(0).getUser_email()); // 이메일 세션 저장
				session.setAttribute("user_phone", list.get(0).getUser_phone()); // 휴대폰번호 세션 저장
				return "main";
			} else { // 비밀번호 불일치
				return "loginPage/login_fail_pw";
			}
		}
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        session.invalidate();
		return "loginPage/logout";
	}
	
	// 회원 탈퇴
	@RequestMapping("/leave_gwailJangsu")
	public String leave_gwailJangsu(@RequestParam("user_pw") String user_pw, 
									@RequestParam("reason") String reason, 
									@RequestParam("delete_content") String content, 
									HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String user_id = session.getAttribute("user_id").toString();
		List<dto_members> list = service_members.check_pw( user_id, user_pw );
		if( list.isEmpty() ) { // 아이디 없음
			return "myPage/withdraw_member_fail";
		} else { // 아이디 있음
			if( user_pw.equals( list.get(0).getUser_pw()) ) { // 비밀번호 일치
				Map<String, String> map = new HashMap<String, String>();
				map.put("user_id", user_id);
				map.put("reason", reason);
				map.put("content", content);
		        
				int nResult = service_seced_member.leave_member( map );
				if( nResult < 1 ) {
					return "myPage/withdraw_member_fail";
				}
		        session.invalidate(); // 로그아웃처리 
		        return "myPage/withdraw_member_success";
			} else { // 비밀번호 불일치
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('비밀번호를 다시 확인해주세요'); history.go(-1);</script>");
				out.flush();
			}
		}
		return "myPage/withdraw_member_fail";
	}
	
	// 정기배송메인
	@RequestMapping("/regularOrder_main")
	public String regularOrder_main() {
		
		return "regular_order/regularOrder_main";
	}
	
	// 제철과일메인
	@RequestMapping("/fruitInSeason_main")
	public String fruitInSeason_main(Model model) {
		model.addAttribute("season_count", service_items.nSeasonCount());
		model.addAttribute("season_listview", service_items.season_list());
		return "item/fruitInSeason_main";
	}
	// 제철과일정렬
	@RequestMapping("/fruitInSeason_main_new")
	public String fruitInSeason_main_new(Model model) {
		model.addAttribute("season_count", service_items.nSeasonCount());
		model.addAttribute("season_listview_new", service_items.season_list_new());
		return "item/fruitInSeason_main";
	}
	@RequestMapping("/fruitInSeason_main_down")
	public String fruitInSeason_main_down(Model model) {
		model.addAttribute("season_count", service_items.nSeasonCount());
		model.addAttribute("season_listview_down", service_items.season_list_down());
		return "item/fruitInSeason_main";
	}
	@RequestMapping("/fruitInSeason_main_high")
	public String fruitInSeason_main_high(Model model) {
		model.addAttribute("season_count", service_items.nSeasonCount());
		model.addAttribute("season_listview_high", service_items.season_list_up());
		return "item/fruitInSeason_main";
	}
	
	// 수입과일메인
	@RequestMapping("/importedFruit_main")
	public String importedFruit_main(Model model) {
		model.addAttribute("imported_count", service_items.nimportedCount());
		model.addAttribute("imported_listview", service_items.imported_list());
		return "item/importedFruit_main";
	}
	// 상품 정렬
	@RequestMapping("/importedFruit_main_new")
	public String importedFruit_main_new(Model model) {
		model.addAttribute("imported_count", service_items.nimportedCount());
		model.addAttribute("imported_listview_new", service_items.imported_list_new());
		return "item/importedFruit_main";
	}
	@RequestMapping("/importedFruit_main_down")
	public String importedFruit_main_down(Model model) {
		model.addAttribute("imported_count", service_items.nimportedCount());
		model.addAttribute("imported_listview_down", service_items.imported_list_down());
		return "item/importedFruit_main";
	}
	@RequestMapping("/importedFruit_main_high")
	public String importedFruit_main_high(Model model) {
		model.addAttribute("imported_count", service_items.nimportedCount());
		model.addAttribute("imported_listview_high", service_items.imported_list_up());
		return "item/importedFruit_main";
	}

	// 낙과채널메인
	@RequestMapping("/fallenFruit_main")
	public String fallenFruit_main( Model model ) {
		model.addAttribute("fallen_count", service_items.nFallenCount());
		model.addAttribute("fallen_listview", service_items.fallen_list());
		return "item/fallenFruit_main";
	}
	// 낙과채널정렬
	@RequestMapping("/fallenFruit_main_new")
	public String fallenFruit_main_new( Model model ) {
		model.addAttribute("fallen_count", service_items.nFallenCount());
		model.addAttribute("fallen_listview_new", service_items.fallen_list_new());
		return "item/fallenFruit_main";
	}
	@RequestMapping("/fallenFruit_main_down")
	public String fallenFruit_main_down( Model model ) {
		model.addAttribute("fallen_count", service_items.nFallenCount());
		model.addAttribute("fallen_listview_down", service_items.fallen_list_down());
		return "item/fallenFruit_main";
	}
	@RequestMapping("/fallenFruit_main_high")
	public String fallenFruit_main_high( Model model ) {
		model.addAttribute("fallen_count", service_items.nFallenCount());
		model.addAttribute("fallen_listview_high", service_items.fallen_list_up());
		return "item/fallenFruit_main";
	}
	
	/*=========== 이벤트 페이지 =============*/

	
	// 이벤트메인
	@RequestMapping("/event_main")
	public String event_main(Model model) {
		model.addAttribute("dtoE_listView", service_event.event_list());
		return "event/event_main";
	}
	
	// 이벤트서브페이지(관리자 DB)추가
	@RequestMapping("/event_sub")
	public String event_sub(HttpServletRequest request, Model model) {
		String index = request.getParameter("event_index");
		model.addAttribute("dtoE_sub", service_event.event_view(index));
		service_event.event_viewCount(index);
		return "event/event_sub";
	}
	
	/*=========== /이벤트 페이지 =============*/
	
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
	public String notice_board( @RequestParam("notice_index") String notice_index, 
								@RequestParam("notice_index") int notice_index_nb, 
								Model model ) {
		model.addAttribute("dto_notice_board", service_noticeBoard.view_notice(notice_index));
		model.addAttribute("dto_notice_board_before", service_noticeBoard.view_notice(String.valueOf(notice_index_nb-1))); // 이전글
		model.addAttribute("dto_notice_board_after", service_noticeBoard.view_notice(String.valueOf(notice_index_nb+1))); // 다음글
		service_noticeBoard.updateViewCount_notice(notice_index); // 조회수 증가
		return "servicePage/notice_board";
	}
	
	// 공지사항 글 검색하기
	@RequestMapping("/notice_board_search")
	public String notice_board_search(@RequestParam("search_text") String search_text, 
									  @RequestParam(value="search_filter", required=false, defaultValue="notice_title") String search_filter, 
									  Model model ) {
		model.addAttribute("dto_notice_board_search", service_noticeBoard.search_notice(search_filter, search_text));
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
		model.addAttribute("fre_que_list", service_fre_ask.list_fre_ask());
		return "servicePage/fre_ask_questions";
	}

	// 자주하는질문 페이지 카테고리 선택
	@RequestMapping("/fre_que_select")
	public String fre_que_select(@RequestParam(value="select", required=false) String categori, Model model ) {
		model.addAttribute("dto_fre_ask_select", service_fre_ask.select_fre_ask( categori ));
		return "servicePage/fre_que_select";
	}
	
	// 자주하는페이지 검색
	@RequestMapping("/fre_ask_search")
	public String fre_ask_search(@RequestParam("search_text") String search_text, Model model ) {
		model.addAttribute("search_text", service_fre_ask.search_fre_ask( search_text ));
		return "servicePage/fre_ask_search";
	}

	// 1:1문의 페이지
	@RequestMapping("/personal_question")
	public String personal_question( HttpServletRequest request, HttpServletResponse response, Model model ) {
		HttpSession session = request.getSession();
        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
        	return "loginPage/loginPage_main";
        } else {
        	model.addAttribute("personal_question_list", service_personal_que.list(String.valueOf(session.getAttribute("user_id"))));	
        	return "servicePage/personal_question";
        }
	}

	// 1:1문의 글쓰기 페이지
	@RequestMapping("/personal_question_write")
	public String personal_question_write(@RequestParam(value="order_number", required=false) String order_number, 
										  HttpServletRequest request, HttpServletResponse response, Model model ) {
		HttpSession session = request.getSession();
        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
        	return "loginPage/loginPage_main";
        } else {
        	String user_id = session.getAttribute("user_id").toString();
        	model.addAttribute("user_id", user_id);
        	model.addAttribute("select_order_number", order_number);
        	return "servicePage/personal_question_write";
        }
	}
	
	// 1:1 문의 글쓰기 - 주문번호 확인팝업
	@RequestMapping("/personal_que_select_order_nb")
	public String personal_que_select_order_nb( HttpServletRequest request, HttpServletResponse response, Model model ) {
		HttpSession session = request.getSession();
        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
        	return "loginPage/loginPage_main";
        } else {
        	String user_id = session.getAttribute("user_id").toString();
        	model.addAttribute("order_number", service_myPage.order_list(user_id));
        	return "servicePage/personal_que_select_order_nb";
        }
	}
	
	// 파일업로드용 bean 생성
	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setMaxUploadSize(200000000);
		multipartResolver.setMaxInMemorySize(200000000);
		multipartResolver.setDefaultEncoding("utf-8");
		return multipartResolver;
	}
	
	// 1:1 문의 글쓰기 저장
	@RequestMapping(value="/personal_que_write_ok", method = RequestMethod.POST)
	public String personal_que_write_ok(@RequestParam(value="select2", required=false) String select_categori, 
										@RequestParam("title") String title, 
										@RequestParam(value="order_num", required=false) String order_num,
										@RequestParam("email") String email,
										@RequestParam(value="check1", required=false) String reply_email, 
										@RequestParam("phone") String phone,
										@RequestParam(value="check2", required=false) String reply_sms, 
										@RequestParam("question_content") String content, 
										@RequestParam(value="upload_file1", required=false) MultipartFile file1,
										@RequestParam(value="upload_file2", required=false) MultipartFile file2,
										@RequestParam(value="upload_file3", required=false) MultipartFile file3,
										@RequestParam(value="upload_file4", required=false) MultipartFile file4,
										@RequestParam(value="upload_file5", required=false) MultipartFile file5,
										HttpServletRequest request, HttpServletResponse response, Model model ) {
		HttpSession session = request.getSession();
		String user_id = String.valueOf(session.getAttribute("user_id"));
		String count = String.valueOf((service_personal_que.countlist( user_id )) + 1);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("count", count);
		map.put( "select_categori", select_categori ); //선택x:other, 배송지연/불만:delivery, 반품:return, 환불:refund, 주문결제문의:order, 회원정보문의:member, 취소문의:cancel, 교환문의:exchange, 상품정보문의:item, 기타:other
		map.put( "title", title );
		if( order_num != null ){ map.put( "order_num", order_num ); } else { map.put( "order_num", "null" ); }
		map.put( "email", email );
		if( reply_email != null ){ map.put( "reply_email", reply_email); } else { map.put( "reply_email", "null"); } // 선택되면 agree
		map.put( "phone", phone );
		if( reply_sms != null ){ map.put( "reply_sms", reply_sms ); } else { map.put( "reply_sms", "null" ); } // 선택되면 agree
		map.put( "content", content );
		
		if( !(file1.isEmpty()) ) {
			String url1 = fileUploadService.restore(file1);
			map.put( "url1", url1 );
		} else { map.put( "url1", "null" ); }
		if( !(file2.isEmpty())  ) {
			String url2 = fileUploadService.restore(file2);
			map.put( "url2", url2 );
		} else { map.put( "url2", "null" ); }
		if( !(file3.isEmpty()) )  {
			String url3 = fileUploadService.restore(file3);
			map.put( "url3", url3 );
		} else { map.put( "url3", "null" ); }
		if( !(file4.isEmpty())  ) {
			String url4 = fileUploadService.restore(file4);
			map.put( "url4", url4 );
		} else { map.put( "url4", "null" ); }
		if( !(file5.isEmpty())  ) {
			String url5 = fileUploadService.restore(file5);
			map.put( "url5", url5 );
		} else { map.put( "url5", "null" ); }
		
		System.out.println( map );
		
		int nResult = service_personal_que.personal_write_ok( map );
		if( nResult < 1 ) {
			return "servicePage/personal_que_write_fail";
		} else {
			model.addAttribute("personal_question_list", service_personal_que.list(String.valueOf(session.getAttribute("user_id"))));
			return "servicePage/personal_que_write_ok";
		}
	}
	
	// 1:1 문의글 상세
	@RequestMapping("/personal_question_read")
	public String personal_question_read(@RequestParam("idx") String idx, 
										 HttpServletRequest request, HttpServletResponse response, Model model) {
		HttpSession session = request.getSession();
        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
        	return "loginPage/loginPage_main";
        } else {
        	model.addAttribute("personal_question_read", service_personal_que.read(idx));	
        	return "servicePage/personal_question_read";
        }
	}


	// 상품상세페이지
	@RequestMapping("/item_detail")
	public String item_detail() {
		
		return "item/item_detail";
	}
	
	// 마이페이지 메인
	@RequestMapping("/myPage_main")
	public String myPage_main( HttpServletRequest request, HttpServletResponse response, Model model ) {
        HttpSession session = request.getSession();
        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
        	return "loginPage/loginPage_main";
        } else {
        	String user_id = session.getAttribute("user_id").toString();
        	model.addAttribute("my_order", service_myPage.order_list(user_id));
    		return "myPage/myPage_main";
        }
	}
	
	// 주문상세내역
	@RequestMapping("/myOrder")
	public String myOrder(HttpServletRequest request, HttpServletResponse response, Model model ) {
        HttpSession session = request.getSession();
        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
        	return "loginPage/loginPage_main";
        } else {
        	String user_id = session.getAttribute("user_id").toString();
        	model.addAttribute("my_order", service_myPage.order_list(user_id));
        	return "myPage/myOrder";
        }
	}

	// 정기배송내역
	@RequestMapping("/myRegularorder")
	public String myRegularorder() {
		
		return "myPage/myRegularorder";
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
	
	// 개인정보수정(비밀번호 재확인)
	@RequestMapping("/check_password")
	public String check_password(HttpServletRequest request, HttpServletResponse response, Model model) {
		HttpSession session = request.getSession();
        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
        	return "loginPage/loginPage_main";
        } else {
        	String user_id = session.getAttribute("user_id").toString();
        	model.addAttribute("my_order", service_myPage.order_list(user_id));
        	return "myPage/check_password";
        }
	}
	
	// 개인정보수정(비밀번호 확인페이지 이동)
	@RequestMapping("/check_password_ok")
	public String check_password_ok(@RequestParam("user_pw") String user_pw, 
									@RequestParam("user_id") String user_id, 
									HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		List<dto_members> list = service_members.check_pw( user_id, user_pw );
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if( user_pw.equals( list.get(0).getUser_pw()) ) { // 비밀번호 일치
			return "myPage/updateInform";
		} else { // 비밀번호 불일치
			return "myPage/check_password_fail";
		}
	}
	
	// 회원탈퇴
	@RequestMapping("/withdraw_member")
	public String withdraw_member() {
		return "myPage/withdraw_member";
	}
	
	// 결제 페이지
	@RequestMapping("/payment")
	public String payment() {
		return "payment/payment";
	}
	
	// 결제 완료 페이지
	@RequestMapping("/payment_ok")
	public String payment_ok() {
		return "payment/payment_ok";
	}
	
	/*=========== 관리자 페이지 =============*/
	
	// 카페관리페이지(관리자전용)
	@RequestMapping("/management")
	public String management(HttpServletRequest request) {
		HttpSession session = request.getSession();
        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
        	return "loginPage/loginPage_main";
        } else {
        	String user_id = session.getAttribute("user_id").toString();
        	return "manager/management_main";
        }
	}
	
	// 회원관리
	@RequestMapping("/member")
	public String member(Model model) {
		List<dto_members> list_page_1 = service_members.list_page_1();
		List<dto_members> list = service_members.member_list();
		int list_count = list.size();
		int page = list_count / 10;
		int page_1 = 0;
		if( list_count % 10 != 0 ) {
			page_1 = 1;
		}
		int max_page = 5;
		int lastPage = page + page_1;
		model.addAttribute("max_page", max_page);
		model.addAttribute("current_page", 1);
		model.addAttribute("lastPage", lastPage); 
		model.addAttribute("member_list", list_page_1 );
		model.addAttribute("list_count", list_count );
		model.addAttribute("member_total_count", service_members.count_total());
		model.addAttribute("member_count_1", service_members.count_1());
		model.addAttribute("member_count_2", service_members.count_2());
		model.addAttribute("member_count_3", service_members.count_3());
		model.addAttribute("member_count_4", service_members.count_4());
		return "manager/member";
	}
	
	// 회원관리 - 다음페이지
	@RequestMapping("/member_nextPage")
	public String member_nextPage(@RequestParam("page") String page, Model model) {
		List<dto_members> list_page_2 = service_members.list_page_2( page );
		List<dto_members> list = service_members.member_list();
		int list_count = list.size();
		int page1 = list_count / 10;
		int page_1 = 0;
		if( list_count % 10 != 0 ) {
			page_1 = 1;
		}
		int lastPage = page1 + page_1;
		int max_page = 5;
		if( Integer.parseInt(page) / max_page >= 1 && Integer.parseInt(page) != 5 ) {
			int index = (Integer.parseInt(page) / max_page);
			int startPage = ( max_page * index ) + 1;
			model.addAttribute("startPage", startPage);
			if( lastPage > startPage + 4 ) {
				model.addAttribute("max_page", startPage + 4); 
			} else {
				model.addAttribute("max_page", lastPage); 
			}
		} else {
			model.addAttribute("startPage", 1); 
			model.addAttribute("max_page", max_page); 
		}
		model.addAttribute("current_page", page); 
		model.addAttribute("lastPage", lastPage); 
		model.addAttribute("member_list", list_page_2 );
		model.addAttribute("list_count", list_count );
		model.addAttribute("member_total_count", service_members.count_total());
		model.addAttribute("member_count_1", service_members.count_1());
		model.addAttribute("member_count_2", service_members.count_2());
		model.addAttribute("member_count_3", service_members.count_3());
		model.addAttribute("member_count_4", service_members.count_4());
		return "manager/member_nextPage";
	}
	
	// 회원 상세보기
	@RequestMapping("/member_detail")
	public String member_detail(@RequestParam("user_index") String user_index, Model model) {
		model.addAttribute("member_detail", service_members.member_detail( user_index ));
		return "manager/member_detail";
	}
	
	// 회원 상세검색
	@RequestMapping("/search_detail_member")
	public String search_detail_member(@RequestParam(value="date_min", required=false) String date_min,
									   @RequestParam(value="date_max", required=false) String date_max,
									   @RequestParam(value="buying_min", required=false) String buying_min,
									   @RequestParam(value="buying_max", required=false) String buying_max,
									   @RequestParam(value="grade", required=false) String grade,
									   @RequestParam(value="point_min", required=false) String point_min,
									   @RequestParam(value="point_max", required=false) String point_max,
									   @RequestParam("page") int page,
										Model model) {
		// 회원수 카운트
		model.addAttribute("member_total_count", service_members.count_total());
		model.addAttribute("member_count_1", service_members.count_1());
		model.addAttribute("member_count_2", service_members.count_2());
		model.addAttribute("member_count_3", service_members.count_3());
		model.addAttribute("member_count_4", service_members.count_4());
		
		Map <String, String> map = new HashMap<String, String>();
		if( !(date_min.isEmpty()) ) { 
			map.put("date_min", date_min);
			model.addAttribute("date_min", date_min);
		} else { 
			map.put("date_min", "1900-01-01 00:00:00");
			model.addAttribute("date_min", "1900-01-01 00:00:00");
		}
		if( !(date_max.isEmpty()) ) { 
			map.put("date_max", date_max); 
			model.addAttribute("date_max", date_max);
		} else { 
			map.put("date_max", "2300-12-31 00:00:00");
			model.addAttribute("date_max", "2300-12-31 00:00:00");
		}
		if( !(buying_min.isEmpty()) ) { 
			map.put("buying_min", buying_min);
			model.addAttribute("buying_min", buying_min);
		} else { 
			map.put("buying_min", "0"); 
			model.addAttribute("buying_min", "0");
		}
		if( !(buying_max.isEmpty()) ) { 
			map.put("buying_max", buying_max); 
			model.addAttribute("buying_max", buying_max);
		} else { 
			map.put("buying_max", "999999999"); 
			model.addAttribute("buying_max", "999999999");
		}
		if( !(grade.isEmpty()) ) { 
			map.put("grade", grade); 
			model.addAttribute("grade", grade);
		} else { 
			map.put("grade", "null"); 
			model.addAttribute("grade", "null");
		}
		if( !(point_min.isEmpty()) ) { 
			map.put("point_min", point_min); 
			model.addAttribute("point_min", point_min);
		} else { 
			map.put("point_min", "0"); 
			model.addAttribute("point_min", "0");
		}
		if( !(point_max.isEmpty()) ) { 
			map.put("point_max", point_max); 
			model.addAttribute("point_max", point_max);
		} else { 
			map.put("point_max", "999999999");
			model.addAttribute("point_max", "999999999");
		}
		model.addAttribute("page", page);
		
		List<dto_members> list = service_members.detail_search( map, page );
		int count = service_members.detail_search_count1( map );

		int page_count = count / 10; // 페이지 꽉채운 게시물
		int page_count2 = 0; // 잔여게시물
		if( page % 10 != 0 ) {
			page_count2 = 1;
		}
		int max_page = 5; // 한번에 보여지는 최대 페이지
		int lastPage = page_count + page_count2; // 총 나타낼 페이지
		model.addAttribute("max_page", max_page);
		model.addAttribute("startPage", 1); // 첫페이지
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("current_page", page);  // 현재페이지
		
		model.addAttribute("member_result_count", count );
		model.addAttribute("result_detail_search", list );
		return "manager/search_detail_member";
	}
	
	// 회원 상세검색 - 다음페이지
	@RequestMapping("/search_detail_member_nextPage")
	public String search_detail_member_nextPage(@RequestParam(value="date_min", required=false) String date_min,
									   @RequestParam(value="date_max", required=false) String date_max,
									   @RequestParam(value="buying_min", required=false) String buying_min,
									   @RequestParam(value="buying_max", required=false) String buying_max,
									   @RequestParam(value="grade", required=false) String grade,
									   @RequestParam(value="point_min", required=false) String point_min,
									   @RequestParam(value="point_max", required=false) String point_max,
									   @RequestParam("page") int page,
										Model model) {
		// 회원수 카운트
				model.addAttribute("member_total_count", service_members.count_total());
				model.addAttribute("member_count_1", service_members.count_1());
				model.addAttribute("member_count_2", service_members.count_2());
				model.addAttribute("member_count_3", service_members.count_3());
				model.addAttribute("member_count_4", service_members.count_4());
				
				Map <String, String> map = new HashMap<String, String>();
				map.put("date_min", date_min);
				model.addAttribute("date_min", date_min);
				map.put("date_max", date_max); 
				model.addAttribute("date_max", date_max);
				map.put("buying_min", buying_min);
				model.addAttribute("buying_min", buying_min);
				map.put("buying_max", buying_max); 
				model.addAttribute("buying_max", buying_max);
				map.put("grade", grade); 
				model.addAttribute("grade", grade); 
				map.put("point_min", point_min); 
				model.addAttribute("point_min", point_min);
				map.put("point_max", point_max); 
				model.addAttribute("point_max", point_max);
				model.addAttribute("page", page);
				
				List<dto_members> list = service_members.detail_search2( map, page );
				int count = service_members.detail_search_count1( map );

				int page_count = count / 10; // 페이지 꽉채운 게시물
				int page_count2 = 0; // 잔여게시물
				if( page % 10 != 0 ) {
					page_count2 = 1;
				}
				int max_page = 5; // 한번에 보여지는 최대 페이지
				int lastPage = page_count + page_count2;
				if( page / max_page >= 1 && page != 5 ) {
					int index = page / max_page;
					int startPage = ( max_page * index ) + 1;
					model.addAttribute("startPage", startPage);
					if( lastPage > startPage + 4 ) {
						model.addAttribute("max_page", startPage + 4); 
					} else {
						model.addAttribute("max_page", lastPage); 
					}
				} else {
					model.addAttribute("startPage", 1); 
					model.addAttribute("max_page", max_page); 
				} 
				model.addAttribute("lastPage", lastPage);  // 마지막페이지
				model.addAttribute("current_page", page);  // 현재페이지
				
				model.addAttribute("member_result_count", count );
				model.addAttribute("result_detail_search", list );
				return "manager/search_detail_member_nextPage";
	}
	
	// 회원 상세검색 + 검색어 추가 - 첫페이지
	@RequestMapping("/member_search")
	public String member_search(@RequestParam(value="date_min", required=false) String date_min,
									   @RequestParam(value="date_max", required=false) String date_max,
									   @RequestParam(value="buying_min", required=false) String buying_min,
									   @RequestParam(value="buying_max", required=false) String buying_max,
									   @RequestParam(value="grade", required=false) String grade,
									   @RequestParam(value="point_min", required=false) String point_min,
									   @RequestParam(value="point_max", required=false) String point_max,
									   @RequestParam(value="member_categori", required=false) String member_categori,
									   @RequestParam(value="search_text", required=false) String search_text,
									   @RequestParam("page") int page,
									   Model model) {
		// 회원수 카운트
		model.addAttribute("member_total_count", service_members.count_total());
		model.addAttribute("member_count_1", service_members.count_1());
		model.addAttribute("member_count_2", service_members.count_2());
		model.addAttribute("member_count_3", service_members.count_3());
		model.addAttribute("member_count_4", service_members.count_4());
		
		Map <String, String> map = new HashMap<String, String>();
		if( !(date_min.isEmpty()) ) { 
			map.put("date_min", date_min);
			model.addAttribute("date_min", date_min);
		} else { 
			map.put("date_min", "1900-01-01 00:00:00");
			model.addAttribute("date_min", "1900-01-01 00:00:00");
		}
		if( !(date_max.isEmpty()) ) { 
			map.put("date_max", date_max); 
			model.addAttribute("date_max", date_max);
		} else { 
			map.put("date_max", "2300-12-31 00:00:00");
			model.addAttribute("date_max", "2300-12-31 00:00:00");
		}
		if( !(buying_min.isEmpty()) ) { 
			map.put("buying_min", buying_min);
			model.addAttribute("buying_min", buying_min);
		} else { 
			map.put("buying_min", "0"); 
			model.addAttribute("buying_min", "0");
		}
		if( !(buying_max.isEmpty()) ) { 
			map.put("buying_max", buying_max); 
			model.addAttribute("buying_max", buying_max);
		} else { 
			map.put("buying_max", "999999999"); 
			model.addAttribute("buying_max", "999999999");
		}
		if( !(grade.isEmpty()) ) { 
			map.put("grade", grade); 
			model.addAttribute("grade", grade);
		} else { 
			map.put("grade", "null"); 
			model.addAttribute("grade", "null");
		}
		if( !(point_min.isEmpty()) ) { 
			map.put("point_min", point_min); 
			model.addAttribute("point_min", point_min);
		} else { 
			map.put("point_min", "0"); 
			model.addAttribute("point_min", "0");
		}
		if( !(point_max.isEmpty()) ) { 
			map.put("point_max", point_max); 
			model.addAttribute("point_max", point_max);
		} else { 
			map.put("point_max", "999999999");
			model.addAttribute("point_max", "999999999");
		}
		if( !(member_categori.isEmpty()) ) { 
			map.put("member_categori", member_categori);
			model.addAttribute("member_categori", member_categori);
		} else { 
			map.put("member_categori", "null");
			model.addAttribute("member_categori", "user_name");
		}
		if( !(search_text.isEmpty()) ) { 
			map.put("search_text", search_text);
			model.addAttribute("search_text", search_text);
		} else { 
			map.put("search_text", "null");
			model.addAttribute("search_text", "null");
		}
		model.addAttribute("page", page);
			
		List<dto_members> list = service_members.member_search( map );
		int count = service_members.detail_search_count3( map );
		
		int page_count = count / 10; // 페이지 꽉채운 게시물
		int page_count2 = 0; // 잔여게시물
		if( page % 10 != 0 ) {
			page_count2 = 1;
		}
		int max_page = 5; // 한번에 보여지는 최대 페이지
		int lastPage = page_count + page_count2; // 총 나타낼 페이지
		model.addAttribute("max_page", max_page);
		model.addAttribute("startPage", 1); // 첫페이지
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("current_page", page);  // 현재페이지
		
		model.addAttribute("member_result_count2", count );
		model.addAttribute("result_detail_search2", list );
		return "manager/search_member";
	}
	
	// 회원 상세검색 + 검색어 추가 - 다음페이지
	@RequestMapping("/member_search_next")
	public String member_search_next(@RequestParam(value="date_min", required=false) String date_min,
									   @RequestParam(value="date_max", required=false) String date_max,
									   @RequestParam(value="buying_min", required=false) String buying_min,
									   @RequestParam(value="buying_max", required=false) String buying_max,
									   @RequestParam(value="grade", required=false) String grade,
									   @RequestParam(value="point_min", required=false) String point_min,
									   @RequestParam(value="point_max", required=false) String point_max,
									   @RequestParam(value="member_categori", required=false) String member_categori,
									   @RequestParam(value="search_text", required=false) String search_text,
									   @RequestParam("page") int page,
									   Model model) {
		// 회원수 카운트
		model.addAttribute("member_total_count", service_members.count_total());
		model.addAttribute("member_count_1", service_members.count_1());
		model.addAttribute("member_count_2", service_members.count_2());
		model.addAttribute("member_count_3", service_members.count_3());
		model.addAttribute("member_count_4", service_members.count_4());
		
		Map <String, String> map = new HashMap<String, String>(); 
		map.put("date_min", date_min);
		model.addAttribute("date_min", date_min);
		map.put("date_max", date_max); 
		model.addAttribute("date_max", date_max);
		map.put("buying_min", buying_min);
		model.addAttribute("buying_min", buying_min);
		map.put("buying_max", buying_max); 
		model.addAttribute("buying_max", buying_max); 
		map.put("grade", grade); 
		model.addAttribute("grade", grade);
		map.put("point_min", point_min); 
		model.addAttribute("point_min", point_min);
		map.put("point_max", point_max); 
		model.addAttribute("point_max", point_max);
		map.put("member_categori", member_categori);
		model.addAttribute("member_categori", member_categori);
		map.put("search_text", search_text);
		model.addAttribute("search_text", search_text);
		model.addAttribute("page", page);
			
		List<dto_members> list = service_members.member_search_next( page, map );
		int count = service_members.detail_search_count3( map );
		
		int page_count = count / 10; // 페이지 꽉채운 게시물
		int page_count2 = 0; // 잔여게시물
		if( page % 10 != 0 ) {
			page_count2 = 1;
		}
		int max_page = 5; // 한번에 보여지는 최대 페이지
		int lastPage = page_count + page_count2; // 필요 페이지
		if( lastPage / max_page >= 1 && lastPage != 5 ) {
			int index = page / max_page;
			int startPage = ( max_page * index ) + 1;
			model.addAttribute("startPage", startPage);
			if( lastPage > startPage + 4 ) {
				model.addAttribute("max_page", startPage + 4); 
			} else {
				model.addAttribute("max_page", lastPage); 
			}
		} else {
			model.addAttribute("startPage", 1); 
			model.addAttribute("max_page", lastPage); 
		} 
		model.addAttribute("current_page", page);  // 현재페이지
		
		model.addAttribute("member_result_count2", count );
		model.addAttribute("result_detail_search2", list );
		return "manager/member_search_next";
	}
	
	// 회원관리-탈퇴시키기
	@RequestMapping("/withdraw_member_pop")
	public String withdraw_member_pop(@RequestParam("member") String member_index, Model model ) {
		if( member_index.isEmpty() ) {
			return "manaber/withdraw_member_fail";
		} else {
			model.addAttribute("withdraw_member_select", service_members.member_detail( member_index ));
			return "manager/withdraw_member";
		}
	}
	
	// 상품관리
	@RequestMapping("/items")
	public String items(Model model) {
		model.addAttribute("all_count", service_items.nAllCount());
		model.addAttribute("all_listview", service_items.All_viewDao());
		return "manager/items";
	}
	
	// 게시판관리_메인(공지사항)
	@RequestMapping("/notice_board_manager")
	public String notice_board() {
		return "manager/notice_board";
	}
	
	// 배너관리
	@RequestMapping("/banner_img")
	public String banner_img() {
		return "manager/banner_img";
	}
	
	// 자주하는질문 관리
	@RequestMapping("/fre_ask_board")
	public String fre_ask_board() {
		return "manager/fre_ask_board";
	}
	
	// 주문내역(회원관리)
	@RequestMapping("/order_list")
	public String order_list() {
		return "manager/order_list";
	}
	
	// 1:1 문의 관리
	@RequestMapping("/personal_question_manager")
	public String personal_question() {
		return "manager/personal_question";
	}
	
	// 1:1 문의 관리
	@RequestMapping("/review")
	public String review() {
		return "manager/review";
	}
	
	// 상품 등록
	@RequestMapping("/item_update")
	public String item_update() {
		return "manager/item_update";
	}
	
	// 상품 등록 저장
	@RequestMapping(value="/item_update_ok", method = RequestMethod.POST)
	public String item_update_ok(@RequestParam("item_name") String item_name,
								@RequestParam("item_category") String item_category,
								@RequestParam("item_real_price") String item_real_price,
								@RequestParam("item_sale_price") String item_sale_price,
								@RequestParam("item_sale_discount") String item_sale_discount,
								@RequestParam("item_description") String item_description,
								@RequestParam("item_img") MultipartFile item_img,
								HttpServletRequest request, HttpServletResponse response, Model model) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("item_name", item_name);
		map.put("item_category", item_category);
		map.put("item_real_price", item_real_price );
		map.put("item_sale_price", item_sale_price );
		map.put("item_sale_discount", item_sale_discount );
		map.put("item_description", item_description );
		if( !(item_img.isEmpty())  ) {
			String file = itemuploadService.restore(item_img);
			map.put( "file", file );
		} else { map.put( "file", "null" ); }
		
		if(item_category.equals("수입과일")) {
			int importedCount = service_items.nimportedCount() + 1 ;
			String category_index = String.valueOf(importedCount);
			map.put("category_index", category_index);
		} else if (item_category.equals("제철과일")) {
			int SeasonCount = service_items.nSeasonCount() + 1 ;
			String category_index = String.valueOf(SeasonCount);
			map.put("category_index", category_index);
		} else if (item_category.equals("낙과채널")) {
			int FallenCount = service_items.nFallenCount() + 1 ;
			String category_index = String.valueOf(FallenCount);
			map.put("category_index", category_index);
		}
			
		System.out.println( map );
		
		int nResult = service_items.item_insert(map);
		if( nResult < 1 ) {
			return "manager/item_update_fail";
		} else {
			return "manager/items";
		}
	}
	
	// 탈퇴회원 리스트
	@RequestMapping("/leave_member")
	public String leave_member(Model model) {
		List<dto_seceded_member> list = service_seced_member.list();
		int count = list.size();
		model.addAttribute("leave_member", list);
		model.addAttribute("leave_member_count", count);
		return "manager/leave_member";
	}
	
	// 상품 수정
	@RequestMapping("/item_amend")
	public String item_amend(@RequestParam("idx") String idx, 
			 				HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("idx_show_detail", service_items.detail_idx_read(idx));
		return "manager/item_amend";
	}
	
	// 상품 수정 저장
	@RequestMapping(value="/item_amend_ok", method = RequestMethod.POST)
	public String item_amend_ok(@RequestParam("item_name") String item_name,
								@RequestParam("item_category") String item_category,
								@RequestParam("item_real_price") String item_real_price,
								@RequestParam("item_sale_price") String item_sale_price,
								@RequestParam("item_sale_discount") String item_sale_discount,
								@RequestParam("item_description") String item_description,
								@RequestParam("idx") String idx,
								@RequestParam("item_img") MultipartFile item_img,
								HttpServletRequest request, HttpServletResponse response, Model model) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("item_name", item_name);
		map.put("item_category", item_category);
		map.put("item_real_price", item_real_price );
		map.put("item_sale_price", item_sale_price );
		map.put("item_sale_discount", item_sale_discount );
		map.put("item_description", item_description );
		map.put("idx", idx );
		if( !(item_img.isEmpty())  ) {
			String file = itemuploadService.restore(item_img);
			map.put( "file", file );
		} else { map.put( "file", "null" ); }
		
		System.out.println( map );
		
		int nResult = service_items.item_update(map);
		if( nResult < 1 ) {
			return "manager/item_amend_fail";
		} else {
			return "manager/items";
		}
		
	}
	
	
	/*==========이벤트관리자=========*/
	
	// 이벤트리스트_메인 관리
	@RequestMapping("/event_list")
	public String event_list(Model model) {
		model.addAttribute("dtoE_mainList", service_event.event_list());
		return "manager/event_list";
	}
	
	// 이벤트 수정
	@RequestMapping("/event_update")
	public String event_update(HttpServletRequest request, Model model) {
		String index = request.getParameter("event_index");
		model.addAttribute("dtoE_update", service_event.event_update(index));
		return "manager/event_update" ;
	}
	
	// 이벤트 수정확인
	@RequestMapping(value="/event_updateOk", method = RequestMethod.POST)
	public String event_updateOk(	@RequestParam(value="upload_banner1", required=false) MultipartFile banner1,
									@RequestParam(value="upload_banner2", required=false) MultipartFile banner2,
									HttpServletRequest request, Model model) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		String index = request.getParameter("event_index");
		map.put("event_index", index);
		
		String title = request.getParameter("event_title");
		map.put("event_title", title);
		
		String content = request.getParameter("event_content");
		content = content.replace("\r\n","<br>");
		map.put("event_content",content);
		
		if( !(banner1.isEmpty()) ) {
			String Ebanner1 = fileUploadService_event.restore(banner1);
			map.put( "event_banner1", Ebanner1 );
		} else {
			map.put( "event_banner1", "null" );
		}
		
		if( !(banner2.isEmpty()) ) {
			String Ebanner2 = fileUploadService_event.restore(banner2);
			map.put( "event_banner2", Ebanner2 );
		} else {
			map.put( "event_banner2", "null" );
		}
		
		
		
		
	

		
		int nResult = service_event.event_updateok(map);
		if( nResult < 1) {
			System.out.println("수정을 실패했습니다.");
			return "redirect:event_list";
		}else {
			System.out.println("수정을 성공했습니다.");
			return "redirect:event_list";	
		}
	}
	
	
	// 이벤트 삭제
	@RequestMapping("/event_delete")
	public String event_delete(HttpServletRequest request, Model model) {
		String index = request.getParameter("event_index");
		int nResult = service_event.event_delete(index);
		if( nResult < 1) {
			System.out.println("삭제를 실패했습니다.");
			return "redirect:event_list";
		}else {
			System.out.println("삭제를 성공했습니다.");
			return "redirect:event_list";	
		}
	}
	
	// 관리자 이벤트 작성페이지
	@RequestMapping("/event_write")
	public String manager_eventWrite() {
		return "manager/event_write";
	}
	
	//파일업로드용 bean 생성(상단에생성되어있음 name = multipartResolver)
	
	
	// 관리자 이벤트 작성확인
	@RequestMapping(value="/event_writeOk", method = RequestMethod.POST)
	public String manager_eventWriteOk( @RequestParam(value="upload_banner1", required=false) MultipartFile banner1,
										@RequestParam(value="upload_banner2", required=false) MultipartFile banner2,
										HttpServletRequest request, Model model) {
		
		Map<String, String> map = new HashMap<String, String>();
		String title = request.getParameter("event_title");
		map.put("event_title", title);
		
		String content = request.getParameter("event_content");
		content = content.replace("\r\n","<br>");
		map.put("event_content",content);
		
		String date = request.getParameter("event_date");
		map.put("event_date", date);
		
		if( !(banner1.isEmpty()) ) {
			String Ebanner1 = fileUploadService_event.restore(banner1);
			map.put( "event_banner1", Ebanner1 );
		} else {
			map.put( "event_banner1", "null" );
		}
		
		if( !(banner2.isEmpty()) ) {
			String Ebanner2 = fileUploadService_event.restore(banner2);
			map.put( "event_banner2", Ebanner2 );
		} else {
			map.put( "event_banner2", "null" );
		}
		
		int nResult = service_event.event_write(map);
		if( nResult < 1) {
			System.out.println("쓰기를 실패했습니다.");
			return "redirect:event_write";
		}else {
			System.out.println("쓰기를 성공했습니다.");
			return "redirect:event_list";	
		}
	}
	
	/*=========== /관리자 페이지 =============*/
	
	
	
}
