package com.example.demo;

import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalTime;
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

import com.example.demo.Service.FileuploadService_banner;
import com.example.demo.Service.FileuploadService_event;
import com.example.demo.Service.FileuploadService_manager_item_update;
import com.example.demo.Service.FileuploadService_personal_que;
import com.example.demo.Service.Service_banner;
import com.example.demo.Service.Service_cart;
import com.example.demo.Service.Service_event;
import com.example.demo.Service.Service_fre_ask_board;
import com.example.demo.Service.Service_items;
import com.example.demo.Service.Service_members;
import com.example.demo.Service.Service_myPage;
import com.example.demo.Service.Service_noticeBoard;
import com.example.demo.Service.Service_personal_que;
import com.example.demo.Service.Service_regular_order;
import com.example.demo.Service.Service_request_item;
import com.example.demo.Service.Service_review;
import com.example.demo.Service.Service_seceded_member;
import com.example.demo.dto.dto_cart;
import com.example.demo.dto.dto_members;
import com.example.demo.dto.dto_user_point;



@Controller
public class MyContoller {
	
	@Autowired
	FileuploadService_personal_que fileUploadService;
	@Autowired
	Service_members service_members;
	@Autowired
	Service_noticeBoard service_noticeBoard;
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
	Service_banner service_banner;
	@Autowired
	Service_review service_review;
	@Autowired
	Service_request_item service_request;
	@Autowired
	Service_regular_order service_regular_order;
	@Autowired
	Service_cart service_cart;	
	
	@Autowired
	FileuploadService_event fileUploadService_event;
	@Autowired
	FileuploadService_manager_item_update itemuploadService;
	@Autowired
	FileuploadService_banner fileUploadService_banner;
	
	
	
	@RequestMapping("/")
	public String root() throws Exception {
		
		return "redirect:main";
	}
	
	// 메인페이지
	@RequestMapping("/main")
	public String mainPage(Model model) {
		model.addAttribute("dtoB_mainBanner", service_banner.banner_list());
		model.addAttribute("dtoB_mainItem0_ListAll", service_items.All_viewDao_new());
		model.addAttribute("dtoB_mainItem1_Fallen", service_items.fallen_list_new());
		model.addAttribute("dtoB_mainItem2_season", service_items.season_list_new());
		model.addAttribute("dtoB_mainItem3_Imported", service_items.imported_list_new());
		model.addAttribute("dtoB_mainEvent", service_event.event_list());
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
				session.setAttribute("user_index", list.get(0).getUser_index() ); // 이름 세션 저장
				session.setAttribute("user_name", list.get(0).getUser_name() ); // 이름 세션 저장
				session.setAttribute("user_grade", list.get(0).getUser_grade()); // 등급 세션 저장
				session.setAttribute("user_point", list.get(0).getUser_point()); // 적립금 세션 저장
				session.setAttribute("user_email", list.get(0).getUser_email()); // 이메일 세션 저장
				session.setAttribute("user_phone", list.get(0).getUser_phone()); // 휴대폰번호 세션 저장
				return "redirect:main";
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
									@RequestParam(value="reason", required=false) String reason, 
									@RequestParam(value="delete_content", required=false) String content, 
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
	
	// 메인 상품검색
	@RequestMapping("/main_searchItem")
	public String main_searchItem(@RequestParam(value="search", required=false) String search, Model model) {
		model.addAttribute("main_searchItem", service_items.mainSerch(search));
		model.addAttribute("main_searchItem_count", service_items.mainSerch_count(search));
		model.addAttribute("search_text", search);
		return "item/main_searchItem";
	}
	
	// 메인 상품검색 - 최신순
	@RequestMapping("/main_searchItem_new")
	public String main_searchItem_new(@RequestParam(value="search", required=false) String search, Model model) {
		model.addAttribute("main_searchItem", service_items.mainSerch(search));
		model.addAttribute("main_searchItem_count", service_items.mainSerch_count(search));
		model.addAttribute("search_text", search);
		return "item/main_searchItem_new";
	}
	
	// 메인 상품검색 - 낮은 가격 순
	@RequestMapping("/main_searchItem_down")
	public String main_searchItem_down(@RequestParam(value="search", required=false) String search, Model model) {
		model.addAttribute("main_searchItem", service_items.mainSerch_down(search));
		model.addAttribute("main_searchItem_count", service_items.mainSerch_count(search));
		model.addAttribute("search_text", search);
		return "item/main_searchItem_down";
	}
	
	// 메인 상품검색 - 높은 가격 순
	@RequestMapping("/main_searchItem_high")
	public String main_searchItem_high(@RequestParam(value="search", required=false) String search, Model model) {
		model.addAttribute("main_searchItem", service_items.mainSerch_high(search));
		model.addAttribute("main_searchItem_count", service_items.mainSerch_count(search));
		model.addAttribute("search_text", search);
		return "item/main_searchItem_high";
	}
	
	// 정기배송메인
	@RequestMapping("/regularOrder_main")
	public String regularOrder_main(Model model) {
		model.addAttribute("delivery_count", service_items.nDeliveryCount());
		model.addAttribute("delivery_listview", service_items.Delivery_list());
		model.addAttribute("regularItem", service_items.regularItem());
		return "regular_order/regularOrder_main";
	}
	
	@RequestMapping("/regular_item_detail")
	public String regular_item_detail(@RequestParam("idx") String idx, 
			HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("idx_show_detail", service_items.detail_idx_read(idx));
		String item_number = service_items.check_itemNumber(idx).get(0).getItem_number();
		int reviewCount = service_review.itemDetail_reviewCount(item_number);
		model.addAttribute("itemReview_count", reviewCount);
		if( reviewCount > 0 ) {
			float average = service_review.itemDetail_reviewTotal(item_number) / reviewCount;
			model.addAttribute("itemReview_score", average);
		} else {
			model.addAttribute("itemReview_score", "0");
		}
		model.addAttribute("review_item", service_review.review_item(item_number));
		return "regular_order/regular_item_detail";
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
		return "item/fruitInSeason_main_new";
	}
	@RequestMapping("/fruitInSeason_main_down")
	public String fruitInSeason_main_down(Model model) {
		model.addAttribute("season_count", service_items.nSeasonCount());
		model.addAttribute("season_listview_down", service_items.season_list_down());
		return "item/fruitInSeason_main_down";
	}
	@RequestMapping("/fruitInSeason_main_high")
	public String fruitInSeason_main_high(Model model) {
		model.addAttribute("season_count", service_items.nSeasonCount());
		model.addAttribute("season_listview_high", service_items.season_list_up());
		return "item/fruitInSeason_main_high";
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
		return "item/importedFruit_main_new";
	}
	@RequestMapping("/importedFruit_main_down")
	public String importedFruit_main_down(Model model) {
		model.addAttribute("imported_count", service_items.nimportedCount());
		model.addAttribute("imported_listview_down", service_items.imported_list_down());
		return "item/importedFruit_main_down";
	}
	@RequestMapping("/importedFruit_main_high")
	public String importedFruit_main_high(Model model) {
		model.addAttribute("imported_count", service_items.nimportedCount());
		model.addAttribute("imported_listview_high", service_items.imported_list_up());
		return "item/importedFruit_main_high";
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
		return "item/fallenFruit_main_new";
	}
	@RequestMapping("/fallenFruit_main_down")
	public String fallenFruit_main_down( Model model ) {
		model.addAttribute("fallen_count", service_items.nFallenCount());
		model.addAttribute("fallen_listview_down", service_items.fallen_list_down());
		return "item/fallenFruit_main_down";
	}
	@RequestMapping("/fallenFruit_main_high")
	public String fallenFruit_main_high( Model model ) {
		model.addAttribute("fallen_count", service_items.nFallenCount());
		model.addAttribute("fallen_listview_high", service_items.fallen_list_up());
		return "item/fallenFruit_main_high";
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
	/*=========== 장바구니 =============*/
	
	// 장바구니메인
	@RequestMapping("/myCart")
	public String myCart(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
        if( session.getAttribute("user_id") == null ) { // 로그인이 되어있지 않으면
        	
        	return "myPage/myCart";
        	
        } else {
		
		String user = (String)session.getAttribute("user_index"); 
		
		String finalPrice = service_cart.cart_item_order_finalPrice(user);
		model.addAttribute("cart_finalPrice", finalPrice);
		
		List<dto_cart> loginList = service_cart.login_cart_list(user);
		model.addAttribute("cart_list", loginList);
		
		return "myPage/myCart";
        }
	}
	
	// 장바구니 상품추가
	@RequestMapping(value="/myCart_insert", method = RequestMethod.POST)
	public String cart_insert(HttpServletRequest request) {

		HttpSession session = request.getSession();
        if( session.getAttribute("user_id") == null ) { // 로그인이 되어있지 않으면
        	
        	return "redirect:myCart";
        	
        } else {
        	Map<String, String> map = new HashMap<String, String>();
    		
    		String amount = request.getParameter("item_order_amount");
    		map.put("item_order_amount", amount);
    		
    		String user = (String) session.getAttribute("user_index");
    		map.put("user_idx", user);
    		
       		String item = request.getParameter("item_idx");
    		map.put("item_idx", item);
    		
    		int nResult = service_cart.cart_itemInsert(map);
    		
    		if( nResult < 1) {
    			System.out.println("상품추가실패");
    			return "redirect:myCart";
    		}else {
    			System.out.println("상품추가");
    			return "redirect:myCart";	
    		}
        }
		
	}
	
	// 장바구니 상품삭제
	@RequestMapping("/MyCart_delete")
	public String card_delete(HttpServletRequest request) {
		String index = request.getParameter("cart_idx");
		
		int nResult = service_cart.cart_item_delete(index);
		if(nResult < 1) {
			System.out.println("삭제를 실패했습니다.");
			return "myPage/myCart";
		} else {
			System.out.println("삭제를 성공했습니다.");
			return "myPage/myCart";
		}
	}
	
	//장바구니 전체 가격
	
	/*=========== /장바구니 =============*/
	
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
	// 아이디 찾기
	@RequestMapping("/found_id")
	public String found_id(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String user_name = request.getParameter("user_name");
		String user_email = request.getParameter("user_email");
		
		model.addAttribute("found_id_list", service_members.found_id_list(user_name, user_email));
		
		int nResult = service_members.found_id(user_name, user_email);
		if( nResult < 1 ) {
			System.out.println("아이디 찾기를 실패하였습니다.");
			return "myPage/myFoundId";
		} else {
			return "myPage/found_id";
		}
	}
	// 비밀번호 찾기
	@RequestMapping(value="/update_pw", method = RequestMethod.POST)
	public String found_pw(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String user_id = request.getParameter("user_id");
		String user_name = request.getParameter("user_name");
		String user_email = request.getParameter("user_email");
		
		int nResult = service_members.found_pw(user_id, user_name, user_email);
		if(nResult < 1) {
			System.out.println("비밀번호 찾기를 실패하였습니다.");
			return "myPage/myFoundId";
		} else {
			return "myPage/update_pw";
		}
	}
	// 비밀번호 수정
	@RequestMapping(value="/update_pw_ok", method = RequestMethod.POST)
	public void update_pw_ok(@RequestParam("user_pw") String user_pw,
							@RequestParam("user_pw_ok") String user_pw_ok,
							HttpServletResponse response, Model model) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		if( !(user_pw.isEmpty()) ) { 
			if( user_pw != null && user_pw.equals(user_pw_ok) ) 
				map.put("user_pw", user_pw);
				int nResult = service_members.updateMember(map);
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				if( nResult < 1 ) {
					out.println("<script>alert('비밀번호를 확인해주세요'); history.go(-1);</script>");
					out.flush();
				} else {
					out.println("<script>alert('비밀번호 수정 완료 되었습니다.'); window.location.href='loginPage/loginPage_main';</script>");
					out.flush();
				}
		} else { 
			map.put("user_pw", "null");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호를 입력해주세요'); history.go(-1);</script>");
		}
		
		
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
	
	// 자주하는질푼 페이지 검색
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
        	model.addAttribute("order_number", service_myPage.order_list_main(user_id));
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
	public String item_detail(@RequestParam("idx") String idx, 
				HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("idx_show_detail", service_items.detail_idx_read(idx)); // 상품 상세정보
		String item_number = service_items.check_itemNumber(idx).get(0).getItem_number(); // 상품번호 받아오기
		int reviewCount = service_review.itemDetail_reviewCount(item_number); // 리뷰 갯수 받아오기
		model.addAttribute("itemReview_count", reviewCount);
		if( reviewCount > 0 ) { // 리뷰 있으면
			float average = service_review.itemDetail_reviewTotal(item_number) / reviewCount;
			model.addAttribute("itemReview_score", average);
		} else { // 리뷰 없으면
			model.addAttribute("itemReview_score", "0");
		}
		model.addAttribute("review_item", service_review.review_item(item_number)); // 리뷰 정보 4개까지
		model.addAttribute("review_allIitem", service_review.review_allIitem(item_number)); // 리뷰정보 all
		model.addAttribute("question_item", service_request.view_question(idx));
		return "item/item_detail";
	}
	
	// 상품상세페이지 - 상품문의하기
	@RequestMapping("item_question")
	public String item_question(@RequestParam("idx") String idx, 
								HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
        	return "loginPage/loginPage_main";
        } else {
        	String user_id = session.getAttribute("user_id").toString();
        	model.addAttribute("user_id", user_id);
			model.addAttribute("item_inform", service_items.detail_idx_read(idx));
        }
		return "item/item_question";
	}
	
	// 상품상세페이지 - 상품문의 글쓰기 확인중
	@RequestMapping("item_question_ok")
	public String item_question_ok(@RequestParam("user_id") String user_id, 
									@RequestParam("item_idx") String item_idx,
									@RequestParam("content") String content,
									 Model model) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("item_idx", item_idx);
		map.put("content", content);
		int nResult = service_request.insertQuestion(map);
    	return "redirect:item_detail?idx=" + item_idx;
	}
	
	// 마이페이지 메인
	@RequestMapping("/myPage_main")
	public String myPage_main( @RequestParam(value="page", required=false) int page, 
								HttpServletRequest request, HttpServletResponse response, Model model ) {
        HttpSession session = request.getSession();
        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
        	return "loginPage/loginPage_main";
        } else {
        	String user_id = session.getAttribute("user_id").toString();
        	model.addAttribute("my_order", service_myPage.order_list_main(user_id));
    		
        	int count = service_myPage.countOrder(user_id);
    		
    		int index = 10; // 한 페이지에 나타내는 글 수
    		int page1 = count / index; // 한페이지안에 글이 꽉 찬 페이지
    		int page2 = 0; 
    		if( count % index != 0 ) { // 잔여 글이 남아있으면
    			page2 = 1; // 한페이지안에 글이 꽉차진 않지만 있는 페이지
    		}
    		int lastPage = page1 + page2; // 총 나타내야 할 페이지
    		int maxPage = 5; // 한번에 나타내는 페이지수
    		int startPage = 1;
    		if( lastPage / maxPage != 0 || lastPage != 5 ) { // 5개 이후 페이지 추가 발생하면
    			if( page % 5 == 0 ) {
    				startPage = ((page / maxPage) * 5) + 1;
    			} else {
    				startPage = page + 1;
    			}
    		}
    		if( page == 1 ) { // 1페이지
    			model.addAttribute("myOrder_page", 1);
    			model.addAttribute("startPage", 1);
    			if( lastPage > maxPage ) { // 마지막페이지가 5보다 크면
    				model.addAttribute("lastPage", 5);
    				model.addAttribute("max_page", 5);
    			}else { // 5보다 작으면
    				model.addAttribute("lastPage", lastPage);
    				model.addAttribute("max_page", lastPage);
    			}
    		} else { // 2페이지 이상
    			model.addAttribute("startPage", startPage );
    			model.addAttribute("myOrder_page", page);
    			if( page / 5 >= 1 && page != 5 ) { // 6페이지 이상
        			if( lastPage > startPage + 4 ) { // 마지막페이지가 5의 배수보다 크면
        				model.addAttribute("lastPage", startPage + 4);
        				model.addAttribute("max_page", startPage + 4);
        			}else { // 5보다 작으면
        				model.addAttribute("lastPage", lastPage);
        				model.addAttribute("max_page", lastPage);
        			}
    			} else { // 5페이지 이하
    				model.addAttribute("max_page", startPage + 4);
        			model.addAttribute("lastPage", lastPage);
        			if( lastPage > maxPage ) { // 마지막페이지가 5보다 크면
        				model.addAttribute("lastPage", 5);
        				model.addAttribute("max_page", 5);
        			}else { // 5보다 작으면
        				model.addAttribute("lastPage", lastPage);
        				model.addAttribute("max_page", lastPage);
        			}
    			}
    		}	
        	return "myPage/myPage_main";
        }
	}

	// 마이페이지 메인 - 년도별 선택
	@RequestMapping("/myPage_main_selectYear")
	public String myPage_main_selectYear( @RequestParam(value="year", required=false) int year, 
										@RequestParam(value="page", required=false) int page, 
										HttpServletRequest request, HttpServletResponse response, Model model ) {
        HttpSession session = request.getSession();
        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
        	return "loginPage/loginPage_main";
        } else {
        	String user_id = session.getAttribute("user_id").toString();
        	model.addAttribute("my_order", service_myPage.order_list(user_id, year, page));
    		
        	int count = service_myPage.countOrder(user_id);
    		
    		int index = 10; // 한 페이지에 나타내는 글 수
    		int page1 = count / index; // 한페이지안에 글이 꽉 찬 페이지
    		int page2 = 0; 
    		if( count % index != 0 ) { // 잔여 글이 남아있으면
    			page2 = 1; // 한페이지안에 글이 꽉차진 않지만 있는 페이지
    		}
    		int lastPage = page1 + page2; // 총 나타내야 할 페이지
    		int maxPage = 5; // 한번에 나타내는 페이지수
    		int startPage = 1;
    		if( lastPage / maxPage != 0 || lastPage != 5 ) { // 5개 이후 페이지 추가 발생하면
    			if( page % 5 == 0 ) {
    				startPage = ((page / maxPage) * 5) + 1;
    			} else {
    				startPage = page + 1;
    			}
    		}
    		if( page == 1 ) { // 1페이지
    			model.addAttribute("myOrder_page", 1);
    			model.addAttribute("startPage", 1);
    			if( lastPage > maxPage ) { // 마지막페이지가 5보다 크면
    				model.addAttribute("lastPage", 5);
    				model.addAttribute("max_page", 5);
    			}else { // 5보다 작으면
    				model.addAttribute("lastPage", lastPage);
    				model.addAttribute("max_page", lastPage);
    			}
    		} else { // 2페이지 이상
    			model.addAttribute("startPage", startPage );
    			model.addAttribute("myOrder_page", page);
    			if( page / 5 >= 1 && page != 5 ) { // 6페이지 이상
        			if( lastPage > startPage + 4 ) { // 마지막페이지가 5의 배수보다 크면
        				model.addAttribute("lastPage", startPage + 4);
        				model.addAttribute("max_page", startPage + 4);
        			}else { // 5보다 작으면
        				model.addAttribute("lastPage", lastPage);
        				model.addAttribute("max_page", lastPage);
        			}
    			} else { // 5페이지 이하
    				model.addAttribute("max_page", startPage + 4);
        			model.addAttribute("lastPage", lastPage);
        			if( lastPage > maxPage ) { // 마지막페이지가 5보다 크면
        				model.addAttribute("lastPage", 5);
        				model.addAttribute("max_page", 5);
        			}else { // 5보다 작으면
        				model.addAttribute("lastPage", lastPage);
        				model.addAttribute("max_page", lastPage);
        			}
    			}
    		}	
        	return "myPage/myPage_selectYear";
        }
	}
	
	// 주문상세내역
	@RequestMapping("/myOrder")
	public String myOrder(@RequestParam(value="orderNumber", required=false) String orderNumber, 
							HttpServletRequest request, HttpServletResponse response, Model model ) {
        HttpSession session = request.getSession();
        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
        	return "loginPage/loginPage_main";
        } else {
        	model.addAttribute("my_order", service_myPage.orderDetail(orderNumber));
        	return "myPage/myOrder";
        }
	}
	
	// 마이영수증
	@RequestMapping("/cashReceipt")
	public String cashReceipt(@RequestParam(value="orderNumber", required=false) String orderNumber, 
							HttpServletRequest request, HttpServletResponse response, Model model ) {
        HttpSession session = request.getSession();
        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
        	return "loginPage/loginPage_main";
        } else {
        	model.addAttribute("my_order", service_myPage.orderDetail(orderNumber));
        	return "myPage/cashReceipt";
        }
	}

	// 정기배송내역
	@RequestMapping("/myRegularorder")
	public String myRegularorder(HttpServletRequest request, HttpServletResponse response, Model model) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else {
	        	String user_id = session.getAttribute("user_id").toString();
	        	model.addAttribute("regular_order_list", service_regular_order.regular_order_list(user_id));
	        	return "myPage/myRegularorder";
	        }
	}
	
	// 상품후기
	@RequestMapping("/myReview")
	public String myReview(HttpServletRequest request, Model model) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else {
	        	String user_id = session.getAttribute("user_id").toString();
	        	model.addAttribute("myReview", service_review.viewReview(user_id));
	        	return "myPage/myReview";
	        }
	}
	
	// 상품후기작성
	@RequestMapping("/myReview_write")
	public String myReview_write(@RequestParam(value="orderNumber", required=false) String orderNumber, 
									HttpServletRequest request, Model model) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else {
	        	model.addAttribute("myOrder_review", service_myPage.myOrder_review(orderNumber));
	        	return "myPage/myReview_write";
	        }
	}
	
	// 상품후기작성중
	@RequestMapping("/myReview_write_ok")
	public String myReview_write_ok(@RequestParam(value="itemN", required=false) String item_number,
									@RequestParam(value="itemI", required=false) String item_img,
									@RequestParam(value="itemE", required=false) String item_name,
									@RequestParam(value="orderN", required=false) String order_number,
									@RequestParam(value="priceB", required=false) String Buy_price,
									@RequestParam(value="dateB", required=false) String Buy_date,
									@RequestParam(value="content", required=false) String review_content,
									@RequestParam(value="score", required=false) String review_score,
									@RequestParam(value="id", required=false) String user_id,
									 Model model) {
		Map <String, String> map = new HashMap<String, String>();
		map.put("item_number", item_number);
		map.put("item_img", item_img);
		map.put("item_name", item_name);
		map.put("order_number", order_number);
		map.put("Buy_price", Buy_price);
		map.put("Buy_date", Buy_date);
		map.put("review_content", review_content);
		map.put("review_score", review_score);
		map.put("user_id", user_id);
		service_review.addReview(map);
		return "redirect:myReview";
	}
	
	// 적립금
	@RequestMapping("/myPoint")
	public String myPoint(HttpServletRequest request, Model model) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else {
	        	String user_id = session.getAttribute("user_id").toString();
	        	List<dto_user_point> list = service_myPage.pointList(user_id);
	        	model.addAttribute("pointList", list);
	        	model.addAttribute("user_point", list.get(0).getTotal_point());
	        	return "myPage/myPoint";
	        }
	}
	
	// 개인정보수정
	@RequestMapping("/updateInform") 
	public String updateInform(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else {
	        	String user_id = session.getAttribute("user_id").toString();
	        	List<dto_members> list = service_members.memberDetail(user_id);
	        	model.addAttribute("member_detail", list);
	        	return "myPage/updateInform";
	        }
	}
	
	// 개인정보수정(비밀번호 재확인)
	@RequestMapping("/check_password")
	public String check_password(HttpServletRequest request , Model model) {
		HttpSession session = request.getSession();
        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
        	return "loginPage/loginPage_main";
        } else {
        	String user_id = session.getAttribute("user_id").toString();
        	model.addAttribute("my_order", service_myPage.order_list_main(user_id));
        	return "myPage/check_password";
        }
	}
	
	// 개인정보수정(비밀번호 확인페이지 이동)
	@RequestMapping("/check_password_ok")
	public String check_password_ok(@RequestParam("user_pw") String user_pw, 
									@RequestParam("user_id") String user_id, 
									Model model) {
		List<dto_members> list = service_members.check_pw( user_id, user_pw );
		if( user_pw.equals( list.get(0).getUser_pw()) ) { // 비밀번호 일치
			return "redirect:updateInform";
		} else { // 비밀번호 불일치
			return "myPage/check_password_fail";
		}
	}
	
	// 회원정보수정 확인
	@RequestMapping("/update_ok")
	public void update_ok(@RequestParam(value="user_id", required=false) String user_id,
							@RequestParam(value="user_pw", required=false) String user_pw,
							@RequestParam(value="user_pw_ok", required=false) String user_pw_ok,
							@RequestParam(value="user_email", required=false) String user_email,
							@RequestParam(value="user_name", required=false) String user_name,
							@RequestParam(value="phone", required=false) String phone,
							@RequestParam(value="postcode", required=false) String postcode,
							@RequestParam(value="address1", required=false) String address1,
							@RequestParam(value="address2", required=false) String address2,
							@RequestParam(value="address3", required=false) String address3,
							@RequestParam(value="gender_select", required=false) String user_gender,
							@RequestParam(value="user_birth", required=false) String user_birth,
							HttpServletResponse response, Model model) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		if( !(user_pw.isEmpty()) ) { 
			if( user_pw != null && user_pw.equals(user_pw_ok) ) 
				map.put("user_pw", user_pw);
		} else { 
			map.put("user_pw", "null");
		}
		if( !(user_email.isEmpty()) ) { 
			map.put("user_email", user_email);
		} else { 
			map.put("user_email", "null");
		}
		if( !(user_name.isEmpty()) ) { 
			map.put("user_name", user_name);
		} else { 
			map.put("user_name", "null");
		}
		if( !(phone.isEmpty()) ) { 
			map.put("phone", phone);
		} else { 
			map.put("phone", "null");
		}
		if( !(postcode.isEmpty()) ) { 
			map.put("postcode", postcode);
		} else { 
			map.put("postcode", "null");
		}
		String address = "";
		if( !(address1.isEmpty()) ) { 
			address += address1;
		}
		if( !(address2.isEmpty()) ) { 
			address += " " + address2;
		}
		if( !(address3.isEmpty()) ) { 
			address += " " + address3;
		}
		map.put("address", address);
		if( user_gender != null ) { 
			map.put("user_gender", user_gender);
		} else { 
			map.put("user_gender", "null");
		}
		if( !(user_birth.isEmpty()) ) { 
			map.put("user_birth", user_birth);
		} else { 
			map.put("user_birth", "null");
		}
		int nResult = service_members.updateMember(map);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if( nResult < 1 ) {
			out.println("<script>alert('다시 시도해주세요'); history.go(-1);</script>");
			out.flush();
		} else {
			out.println("<script>alert('회원정보 수정 완료 되었습니다.'); window.location.href='/myPage_main?page=1';</script>");
			out.flush();
		}
	}
	//
	// 회원탈퇴
	@RequestMapping("/withdraw_member")
	public String withdraw_member( HttpServletRequest request ) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else {
	        	return "myPage/withdraw_member";
	        }
	}
	
	// 결제 페이지
	@RequestMapping("/payment")
	public String payment( HttpServletRequest request ) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else {
	        	return "payment/payment";
	        }
	}
	
	// 결제 완료 페이지
	@RequestMapping("/payment_ok")
	public String payment_ok() {
		return "payment/payment_ok";
	}
	
	/*=========== 관리자 페이지 =============*/
	
	// 카페관리페이지(관리자전용)
	@RequestMapping("/management")
	public String management( HttpServletRequest request ) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
	        	return "redirect:items";
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 회원관리
	@RequestMapping("/member")
	public String member(HttpServletRequest request, Model model) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
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
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 회원관리 - 다음페이지
	@RequestMapping("/member_nextPage")
	public String member_nextPage(@RequestParam("page") String page, 
									HttpServletRequest request, Model model) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
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
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 회원 상세보기
	@RequestMapping("/member_detail")
	public String member_detail(@RequestParam("user_index") String user_index, 
								HttpServletRequest request, Model model) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
	        	model.addAttribute("member_detail", service_members.member_detail( user_index ));
	    		return "manager/member_detail";
	        } else {
	        	return "manager/notAccess";
	        }
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
									   HttpServletRequest request, Model model) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
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
	        } else {
	        	return "manager/notAccess";
	        }
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
									   HttpServletRequest request, Model model) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
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
	        } else {
	        	return "manager/notAccess";
	        }
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
									   @RequestParam(value="page", required=false) int page,
									   HttpServletRequest request, Model model) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
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
	    		return "manager/member_search";
	        } else {
	        	return "manager/notAccess";
	        }
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
									   HttpServletRequest request, Model model) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
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
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 회원관리-탈퇴시키기
	@RequestMapping("/withdraw_member_pop")
	public String withdraw_member_pop(@RequestParam("member") String member_index, 
									HttpServletRequest request, Model model ) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
	        	model.addAttribute("withdraw_member_select", service_members.member_detail( member_index ));
	    		return "manager/withdraw_member";
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 회원관리-탈퇴확인중
	@RequestMapping("/withdraw_member_ok")
	public String withdraw_member_ok(@RequestParam("user_id") String user_id, 
									 @RequestParam("reason") String reason,
									 @RequestParam("delete_content") String content,
									 Model model ) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("reason", reason);
		map.put("content", content);
        
		int nResult = service_seced_member.leave_member( map );
		if( nResult < 1 ) {
			return "manager/member_withdraw_member_fail";
		}
	return "redirect:member";
	}
	
	// 회원관리-회원 적립금 관리
	@RequestMapping("/member_point_pop")
	public String member_point_pop(@RequestParam("index") String member_index, 
									HttpServletRequest request, Model model ) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
	        	model.addAttribute("withdraw_member_select", service_members.member_detail( member_index ));
	    		return "manager/member_point";
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 회원관리-회원 적립금 추가/삭감
	@RequestMapping("/member_point_ok")
	public String member_point_ok(@RequestParam("user_index") String member_index, 
									@RequestParam("point") String point, 
									HttpServletRequest request, Model model ) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
	    		int nResult = service_members.update_point( member_index, point );
	    		if( nResult < 1 ) {
	    			return "manager/member_withdraw_member_fail";
	    		} else {
	    			return "redirect:member";
	    		}
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 회원관리-회원 등급 관리
	@RequestMapping("/member_grade_pop")
	public String member_grade_pop(@RequestParam("index") String member_index, HttpServletRequest request, Model model ) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
	        	model.addAttribute("withdraw_member_select", service_members.member_detail( member_index ));
	    		return "manager/member_grade";
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 회원관리-회원 등급 변경
	@RequestMapping("/member_grade_ok")
	public String member_grade_ok(@RequestParam("user_index") String member_index, 
									@RequestParam("grade") String grade, 
									HttpServletRequest request, Model model ) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
	    		int nResult = service_members.update_grade( member_index, grade );
	    		if( nResult < 1 ) {
	    			return "manager/member_withdraw_member_fail";
	    		} else {
	    			return "redirect:member";
	    		}
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 상품관리
	@RequestMapping("/items")
	public String items(HttpServletRequest request, Model model) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	model.addAttribute("all_count", service_items.nAllCount());
	    		model.addAttribute("all_listview", service_items.All_viewDao());
	    		return "manager/items";
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 상품관리 - 카테고리 선택
	@RequestMapping("/items_selectCategori")
	public String items(@RequestParam(value="categori", required=false) String categori, 
						HttpServletRequest request, Model model) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	model.addAttribute("all_count", service_items.nCategoriCount(categori));
	    		model.addAttribute("all_listview", service_items.categoriView(categori));
	    		return "manager/items_selectCategori";
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 게시판관리_메인(공지사항)
	@RequestMapping("/notice_board_manager")
	public String notice_board(HttpServletRequest request, Model model) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	model.addAttribute("noticeboard_list", service_noticeBoard.list_notice());
	        	return "manager/notice_board";
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 공지사항 작성
	@RequestMapping("/notice_board_write")
	public String notice_board_write() {
		return "manager/notice_board_write";
	}
	
	// 공지사항 작성확인
	@RequestMapping(value="/notice_board_write_ok", method = RequestMethod.POST)
	public String notice_board_write_ok (@RequestParam("notice_index") String notice_index,
										@RequestParam("notice_title") String notice_title,
										@RequestParam("notice_writer") String notice_writer,
										@RequestParam("notice_content") String notice_content,
										HttpServletRequest request, HttpServletResponse response, Model model) {
									
			String notice_date = "";
			LocalDate date = LocalDate.now();
			notice_date += date.getYear();
			notice_date += date.getMonth().getValue();
			notice_date += date.getDayOfMonth();
									
			Map<String, String> map = new HashMap<String, String>();
			map.put("notice_index", notice_index);
			map.put("notice_title", notice_title);
			map.put("notice_writer", notice_writer);
			map.put("notice_content", notice_content);
			map.put("notice_date", notice_date );
			
			System.out.println( map );
			
			int nResult = service_noticeBoard.notice_insert(map);
			if( nResult < 1 ) {
				return "manager/notice_board_write_fail";
			} else {
				return "manager/notice_board_manager";
			}
	}
	
	// 공지사항 작성실패
	@RequestMapping("/notice_board_write_fail")
	public String notice_board_write_fail() {
		return "manager/notice_board_write";
	}
	
	// 공지사항 수정
	@RequestMapping("/notice_board_update")
	public String notice_board_update(@RequestParam("notice_index") String notice_index, 
									HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("notice_board_list", service_noticeBoard.view_notice(notice_index));
		return "manager/notice_board_update";
	}
	
	// 공지사항 수정확인
	@RequestMapping(value="/notice_board_update_ok", method=RequestMethod.POST)
	public String notice_board_write_ok (@RequestParam("notice_index") String notice_index,
										@RequestParam("notice_title") String notice_title,
										@RequestParam("notice_content") String notice_content,
										HttpServletRequest request, HttpServletResponse response, Model model) {
									
			Map<String, String> map = new HashMap<String, String>();
			map.put("notice_index", notice_index);
			map.put("notice_title", notice_title);
			map.put("notice_content", notice_content);
			
			System.out.println( map );
			
			int nResult = service_noticeBoard.notice_update(map);
			if( nResult < 1 ) {
				return "manager/notice_board_update_fail";
			} else {
				return "manager/notice_board_manager";
			}
	}
	
	// 공지사항 작성실패
	@RequestMapping("/notice_board_update_fail")
	public String notice_board_update_fail() {
		return "manager/notice_board_update";
	}
	
	
	// 배너관리
	@RequestMapping("/banner_img")
	public String banner_img(HttpServletRequest request) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
	        	return "manager/banner_img";
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 자주하는질문 관리
	@RequestMapping("/fre_ask_board")
	public String fre_ask_board(HttpServletRequest request) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
	        	return "manager/fre_ask_board";
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 주문내역(회원관리) - 첫페이지
	@RequestMapping("/order_list")
	public String order_list(HttpServletRequest request, Model model) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
	        	model.addAttribute("order_list", service_myPage.manager_view());
	    		int count = service_myPage.manager_viewCount();
	    		int index = 10; // 한 페이지에 나타내는 글 수
	    		int page1 = count / index; // 한페이지안에 글이 꽉 찬 페이지
	    		int page2 = 0; 
	    		if( count % index != 0 ) { // 잔여 글이 남아있으면
	    			page2 = 1; // 한페이지안에 글이 꽉차진 않지만 있는 페이지
	    		}
	    		int lastPage = page1 + page2; // 총 나타내야 할 페이지
	    		
	    		model.addAttribute("orderList_page", 1);
	    		model.addAttribute("startPage", 1);
	    		model.addAttribute("max_page", lastPage);
	    		model.addAttribute("lastPage", lastPage);
	    		return "manager/order_list";
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 주문내역(회원관리) - 다음페이지
	@RequestMapping("/order_list_nextPage")
	public String order_list_nextPage( @RequestParam(value="page", required=false) int page, 
										HttpServletRequest request, Model model) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
	        	model.addAttribute("order_list", service_myPage.manager_view(page));
	    		int count = service_myPage.manager_viewCount();
	    		
	    		int index = 10; // 한 페이지에 나타내는 글 수
	    		int page1 = count / index; // 한페이지안에 글이 꽉 찬 페이지
	    		int page2 = 0; 
	    		if( count % index != 0 ) { // 잔여 글이 남아있으면
	    			page2 = 1; // 한페이지안에 글이 꽉차진 않지만 있는 페이지
	    		}
	    		int lastPage = page1 + page2; // 총 나타내야 할 페이지
	    		int maxPage = 5; // 한번에 나타내는 페이지수
	    		int startPage = 1;
	    		if( lastPage / maxPage != 0 || lastPage != 5 ) { // 5개 이후 페이지 추가 발생하면
	    			if( page % 5 == 0 ) {
	    				startPage = ((page / maxPage) * 5) + 1;
	    			} else {
	    				startPage = page + 1;
	    			}
	    		}
	    		if( page == 1 ) {
	    			model.addAttribute("orderList_page", 1);
	    			model.addAttribute("startPage", 1);
	    			model.addAttribute("max_page", lastPage);
	    			model.addAttribute("lastPage", lastPage);
	    		} else {
	    			model.addAttribute("startPage", startPage );
	    			model.addAttribute("orderList_page", page);
	    			model.addAttribute("max_page", startPage + 1);
	    			model.addAttribute("lastPage", lastPage);
	    		}	
	    		return "manager/order_list_nextPage";
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 주문내역(회원관리) - 년도선택 - 다음페이지
	@RequestMapping("/order_list_selectYear")
	public String order_list_selectYear( @RequestParam("page") int page, 
										@RequestParam("year") int year, 
										HttpServletRequest request, Model model) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
	        	model.addAttribute("order_list", service_myPage.manager_view_year(page, year));
	    		int count = service_myPage.manager_viewCount_year(year);
	    		
	    		int index = 10; // 한 페이지에 나타내는 글 수
	    		int page1 = count / index; // 한페이지안에 글이 꽉 찬 페이지
	    		int page2 = 0; 
	    		if( count % index != 0 ) { // 잔여 글이 남아있으면
	    			page2 = 1; // 한페이지안에 글이 꽉차진 않지만 있는 페이지
	    		}
	    		int lastPage = page1 + page2; // 총 나타내야 할 페이지
	    		int maxPage = 5; // 한번에 나타내는 페이지수
	    		int startPage = 1;
	    		if( lastPage / maxPage != 0 || lastPage != 5 ) { // 5개 이후 페이지 추가 발생하면
	    			if( page % 5 == 0 ) {
	    				startPage = ((page / maxPage) * 5) + 1;
	    			} else {
	    				startPage = page + 1;
	    			}
	    		}
	    		if( page == 1 ) {
	    			model.addAttribute("orderList_page", 1);
	    			model.addAttribute("startPage", 1);
	    			model.addAttribute("max_page", lastPage);
	    			model.addAttribute("lastPage", lastPage);
	    		} else {
	    			model.addAttribute("startPage", startPage );
	    			model.addAttribute("orderList_page", page);
	    			model.addAttribute("max_page", startPage + 1);
	    			model.addAttribute("lastPage", lastPage);
	    		}
	    		return "manager/order_list_selectYear";
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 1:1 문의 관리
	@RequestMapping("/personal_question_manager")
	public String personal_question( HttpServletRequest request ) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
	        	return "manager/personal_question";
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 1:1 문의 관리
	@RequestMapping("/review")
	public String review( HttpServletRequest request ) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
	        	return "manager/review";
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 상품 등록
	@RequestMapping("/item_update")
	public String item_update(HttpServletRequest request) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
	        	return "manager/item_update";
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 상품 등록 저장
	@RequestMapping(value="/item_update_ok", method = RequestMethod.POST)
	public String item_update_ok(@RequestParam("item_name") String item_name,
								@RequestParam("item_category") String item_category,
								@RequestParam("item_origin") String item_origin,
								@RequestParam("item_real_price") String item_real_price,
								@RequestParam("item_sale_price") String item_sale_price,
								@RequestParam("item_sale_discount") String item_sale_discount,
								@RequestParam("item_description") String item_description,
								@RequestParam("item_weight") String item_weight,
								@RequestParam("item_season") String item_season,
								@RequestParam("item_farm") String item_farm,
								@RequestParam("item_state") String item_state,
								@RequestParam("sale_unit") String sale_unit,
								@RequestParam("delivery_sale") String delivery_sale,
								@RequestParam("item_img") MultipartFile item_img,
								HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String item_number = "";
		LocalDate date = LocalDate.now();
		LocalTime time = LocalTime.now();
		item_number += date.getYear(); 
		item_number += date.getMonth().getValue();
		item_number += date.getDayOfMonth();
		item_number += time.getHour();
		item_number += time.getMinute();
		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("item_name", item_name);
		map.put("item_category", item_category);
		map.put("item_origin", item_origin);
		map.put("item_number", item_number);
		map.put("item_real_price", item_real_price );
		map.put("item_sale_price", item_sale_price );
		map.put("item_sale_discount", item_sale_discount );
		map.put("item_description", item_description );
		map.put("item_weight", item_weight);
		map.put("item_season", item_season);
		map.put("item_farm", item_farm );
		map.put("item_state", item_state );
		map.put("sale_unit", sale_unit );
		map.put("delivery_sale", delivery_sale );
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
		} else if (item_category.equals("정기배송")) {
			int regularCount = service_items.nFallenCount() + 1 ;
			String category_index = String.valueOf(regularCount);
			map.put("category_index", category_index);
		}
			
		System.out.println( map );
		
		int nResult = service_items.item_insert(map);
		if( nResult < 1 ) {
			return "manager/item_update_fail";
		} else {
			return "redirect:items";
		}
	}
	
	// 탈퇴회원 리스트 - 첫페이지
	@RequestMapping("/leave_member")
	public String leave_member(HttpServletRequest request, Model model) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
	        	int count = service_seced_member.count();
	    		model.addAttribute("leave_member_count", count);
	    		model.addAttribute("leave_member", service_seced_member.list());
	    		
	    		int index = 10; // 한 페이지에 나타내는 글 수
	    		int page1 = count / index; // 한페이지안에 글이 꽉 찬 페이지
	    		int page2 = 0; 
	    		if( count % index != 0 ) { // 잔여 글이 남아있으면
	    			page2 = 1; // 한페이지안에 글이 꽉차진 않지만 있는 페이지
	    		}
	    		int lastPage = page1 + page2; // 총 나타내야 할 페이지
	    		
	    		model.addAttribute("leave_member_page", 1);
	    		model.addAttribute("startPage", 1);
	    		model.addAttribute("max_page", lastPage);
	    		model.addAttribute("lastPage", lastPage);
	    		return "manager/leave_member";
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 탈퇴회원 리스트 - 다음페이지
	@RequestMapping("/leave_member_nextPage")
	public String leave_member_nextPage(@RequestParam("page") int page, HttpServletRequest request, Model model) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
	        	int count = service_seced_member.count();
	    		model.addAttribute("leave_member_count", count);
	    		
	    		int index = 10; // 한 페이지에 나타내는 글 수
	    		int page1 = count / index; // 한페이지안에 글이 꽉 찬 페이지
	    		int page2 = 0; 
	    		if( count % index != 0 ) { // 잔여 글이 남아있으면
	    			page2 = 1; // 한페이지안에 글이 꽉차진 않지만 있는 페이지
	    		}
	    		int lastPage = page1 + page2; // 총 나타내야 할 페이지
	    		int maxPage = 5; // 한번에 나타내는 페이지수
	    		int startPage = 1;
	    		if( lastPage / maxPage != 0 || lastPage != 5 ) { // 5개 이후 페이지 추가 발생하면
	    			if( page % 5 == 0 ) {
	    				startPage = ((page / maxPage) * 5) + 1;
	    			} else {
	    				startPage = page + 1;
	    			}
	    		}
	    		if( page == 1 ) {
	    			model.addAttribute("leave_member_page", 1);
	    			model.addAttribute("startPage", 1);
	    			model.addAttribute("max_page", lastPage);
	    			model.addAttribute("lastPage", lastPage);
	    		} else {
	    			model.addAttribute("startPage", startPage );
	    			model.addAttribute("leave_member_page", page);
	    			model.addAttribute("max_page", startPage + 1);
	    			model.addAttribute("lastPage", lastPage);
	    		}	
	    		
	    		model.addAttribute("leave_member", service_seced_member.list_nextPage( page ));
	    		model.addAttribute("leave_member_page", 1);
	    		return "manager/leave_member_nextPage";
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 상품 수정
	@RequestMapping("/item_amend")
	public String item_amend(@RequestParam("idx") String idx, 
			 				HttpServletRequest request, HttpServletResponse response, Model model) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
	        	model.addAttribute("idx_show_detail", service_items.detail_idx_read(idx));
	    		return "manager/item_amend";
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 상품 수정 저장
	@RequestMapping(value="/item_amend_ok", method = RequestMethod.POST)
	public String item_amend_ok(@RequestParam("item_name") String item_name,
								@RequestParam("item_category") String item_category,
								@RequestParam("item_origin") String item_origin,
								@RequestParam("item_real_price") String item_real_price,
								@RequestParam("item_sale_price") String item_sale_price,
								@RequestParam("item_sale_discount") String item_sale_discount,
								@RequestParam("item_description") String item_description,
								@RequestParam("item_weight") String item_weight,
								@RequestParam("item_season") String item_season,
								@RequestParam("item_farm") String item_farm,
								@RequestParam("item_state") String item_state,
								@RequestParam("sale_unit") String sale_unit,
								@RequestParam("delivery_sale") String delivery_sale,
								@RequestParam("idx") String idx,
								@RequestParam("item_img") MultipartFile item_img,
								HttpServletRequest request, HttpServletResponse response, Model model) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
	        	Map<String, String> map = new HashMap<String, String>();
	        	map.put("item_name", item_name);
	    		map.put("item_category", item_category);
	    		map.put("item_origin", item_origin);
	    		map.put("item_real_price", item_real_price );
	    		map.put("item_sale_price", item_sale_price );
	    		map.put("item_sale_discount", item_sale_discount );
	    		map.put("item_description", item_description );
	    		map.put("item_weight", item_weight);
	    		map.put("item_season", item_season);
	    		map.put("item_farm", item_farm );
	    		map.put("item_state", item_state );
	    		map.put("sale_unit", sale_unit );
	    		map.put("delivery_sale", delivery_sale );
	    		map.put("idx", idx);
	    		if( !(item_img.isEmpty())  ) {
	    			String file = itemuploadService.restore(item_img);
	    			map.put( "file", file );
	    		} else { map.put( "file", "null" ); }
	    		
	    		System.out.println( map );
	    		
	    		int nResult = service_items.item_update(map);
	    		if( nResult < 1 ) {
	    			return "manager/item_amend_fail";
	    		} else {
	    			return "redirect:items";
	    		}
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	
/*==========이벤트관리자=========*/
	
	// 이벤트리스트_메인 관리
	@RequestMapping("/event_list")
	public String event_list(HttpServletRequest request, Model model) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
	        	model.addAttribute("dtoE_mainList", service_event.event_list());
	    		return "manager/event_list";
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 이벤트 수정
	@RequestMapping("/event_update")
	public String event_update(HttpServletRequest request, Model model) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
	        	String index = request.getParameter("event_index");
	    		model.addAttribute("dtoE_update", service_event.event_update(index));
	    		return "manager/event_update" ;
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 이벤트 수정확인
	@RequestMapping(value="/event_updateOk", method = RequestMethod.POST)
	public String event_updateOk(	@RequestParam(value="upload_banner1", required=false) MultipartFile banner1,
									@RequestParam(value="upload_banner2", required=false) MultipartFile banner2,
									HttpServletRequest request, Model model) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
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
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	
	// 이벤트 삭제
	@RequestMapping("/event_delete")
	public String event_delete(HttpServletRequest request, Model model) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
	    		String index = request.getParameter("event_index");
	    		int nResult = service_event.event_delete(index);
	    		if( nResult < 1) {
	    			System.out.println("삭제를 실패했습니다.");
	    			return "redirect:event_list";
	    		}else {
	    			System.out.println("삭제를 성공했습니다.");
	    			return "redirect:event_list";	
	    		}
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 관리자 이벤트 작성페이지
	@RequestMapping("/event_write")
	public String manager_eventWrite(HttpServletRequest request) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
	        	return "manager/event_write";
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	//파일업로드용 bean 생성(상단에생성되어있음 name = multipartResolver)
	
	
	// 관리자 이벤트 작성확인
	@RequestMapping(value="/event_writeOk", method = RequestMethod.POST)
	public String manager_eventWriteOk( @RequestParam(value="upload_banner1", required=false) MultipartFile banner1,
										@RequestParam(value="upload_banner2", required=false) MultipartFile banner2,
										HttpServletRequest request, Model model) {
		
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
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
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
/* ============== 메인 베너 등록 관리 ===== */
	
	// 배너관리리스트
	@RequestMapping("/banner_list")
	public String manager_bannerlist(HttpServletRequest request, Model model) {		
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();

	    		model.addAttribute("dtoB_listView", service_banner.banner_list());
	    		return "manager/banner_list";
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 배너등록(작성)
	@RequestMapping("/banner_write")
	public String manager_bannerWrite( HttpServletRequest request ) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
	        	return "manager/banner_write";
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 파일업로드용 bean 생성
	
	
	// 배너등록(작성)확인
	@RequestMapping(value="/banner_writeOk", method = RequestMethod.POST)
	public String manager_bannerWriteOk( @RequestParam(value="upload_banner_img", required=false) MultipartFile banner_img,
										  HttpServletRequest request, Model model) {
		
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
	        	Map<String, String> map = new HashMap<String, String>();
	    		//제목
	    		String title = request.getParameter("banner_title");
	    		map.put("banner_title", title);
	    		
	    		//img
	    		if( !(banner_img.isEmpty()) ) {
	    			String mainBanner = fileUploadService_banner.restore(banner_img);
	    			map.put( "banner_img", mainBanner );
	    		} else {
	    			map.put( "banner_img", "null" );
	    		}
	    		
	    		//링크
	    		String href = request.getParameter("banner_href");
	    		map.put("banner_href", href);
	    		
	    		int nResult = service_banner.banner_write(map);
	    		if( nResult < 1) {
	    			System.out.println("쓰기를 실패했습니다.");
	    			return "redirect:banner_write";
	    		}else {
	    			System.out.println("쓰기를 성공했습니다.");
	    			return "redirect:banner_list";	
	    		}
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	//배너삭제
	@RequestMapping("/banner_delete")
	public String banner_delete(HttpServletRequest request, Model model) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	        	
	    		String index = request.getParameter("banner_index");
	    		
	    		int nResult = service_banner.banner_delete(index);
	    		if(nResult < 1) {
	    			System.out.println("삭제를 실패했습니다.");
	    			return "redirect:banner_list";
	    		} else {
	    			System.out.println("삭제를 성공했습니다.");
	    			return "redirect:banner_list";
	    		}
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	
	// 배너 수정
	@RequestMapping("/banner_update")
	public String banner_update(HttpServletRequest request, Model model) {
		 HttpSession session = request.getSession();
	        if( session.getAttribute("user_id") == null ) { // 로그인 안되어있으면
	        	return "loginPage/loginPage_main";
	        } else if( session.getAttribute("user_id") != null && session.getAttribute("user_grade").equals("과일매니저") ){
	        	String user_id = session.getAttribute("user_id").toString();
	    		
	        	String index = request.getParameter("banner_index");
				//update items
				model.addAttribute("dtoB_update", service_banner.banner_update(index));
				return "manager/banner_update" ;
	        } else {
	        	return "manager/notAccess";
	        }
	}
	
	// 배너 수정확인
	@RequestMapping(value="/banner_updateOk", method = RequestMethod.POST)
	public String banner_updateOk(	@RequestParam(value="upload_banner_img", required=false) MultipartFile banner_img,
									HttpServletRequest request, Model model) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		String index = request.getParameter("banner_index");
		map.put("banner_index", index);
		
		String title = request.getParameter("banner_title");
		map.put("banner_title", title);
		
		//img
		if( !(banner_img.isEmpty()) ) {
			String mainBanner = fileUploadService_banner.restore(banner_img);
			map.put( "banner_img", mainBanner );
		} else {
			map.put( "banner_img", "null" );
		}
		
		String href = request.getParameter("banner_href");
		map.put("banner_href", href);

		
		int nResult = service_banner.banner_updateok(map);
		if( nResult < 1) {
			System.out.println("수정을 실패했습니다.");
			return "redirect:banner_list";
		}else {
			System.out.println("수정을 성공했습니다.");
			return "redirect:banner_list";	
		}
	}
	
	
	
	/*=========== /관리자 페이지 =============*/
	
	
	
}
