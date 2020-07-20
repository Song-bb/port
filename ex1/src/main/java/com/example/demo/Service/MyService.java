package com.example.demo.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;

import com.example.demo.dao.IDao_banner_img;
import com.example.demo.dao.IDao_fre_ask_board;
import com.example.demo.dao.IDao_members;
import com.example.demo.dao.IDao_myOrder;
import com.example.demo.dao.IDao_noticeBoard;
import com.example.demo.dao.IDao_personal_question;
import com.example.demo.dto.dto_banner_img;
import com.example.demo.dto.dto_fre_ask_board;
import com.example.demo.dto.dto_members;
import com.example.demo.dto.dto_myOrder;
import com.example.demo.dto.dto_noticeBoard;

@Service
public class MyService implements IMyService {
	
	@Autowired
	IDao_members dao_member;
	@Autowired
	IDao_noticeBoard dao_noticeBoard;
	@Autowired
	IDao_banner_img dao_banner;
	@Autowired
	IDao_fre_ask_board dao_fre_ask;
	@Autowired
	IDao_myOrder dao_myOrder;
	@Autowired
	IDao_personal_question dao_personal_que;
	
	
	@Autowired
	PlatformTransactionManager transactionManager;
	@Autowired
	TransactionDefinition definition;
	
	
	
	/*  회원관리  */
	/* 로그인 */
	@Override
	public List<dto_members> login( String user_id, String user_pw ) {
		return dao_member.login_ok( user_id, user_pw );
	}
	
	/* 회원가입 */
	@Override
	public int join_ok(Map<String, String> map) {
		int nResult = dao_member.join_ok(map);
		return nResult;
	}
	
	/* 비밀번호재확인 */
	@Override
	public List<dto_members> check_pw(String user_id, String user_pw) {
		return dao_member.check_pw( user_id, user_pw );
	}
	

	
	
	
	
	/*  공지사항  */
	/* 공지사항 글 리스트 */
	@Override
	public List<dto_noticeBoard> list_notice() {
		return dao_noticeBoard.listDao();
	}
	
	/* 공지사항 글 갯수 카운트 */
	@Override
	public int count() {
		int nTotalCount = dao_noticeBoard.articleCount();
		return nTotalCount;
	}

	/* 공지사항 글 상세보기 */
	@Override
	public dto_noticeBoard view_notice(String notice_index) {
		return dao_noticeBoard.viewDao(notice_index);
	}
	/* 공지사항 글 상세보기 시 조회수 증가 */
	public void updateViewCount_notice(String notice_index) {
		dao_noticeBoard.updateViewCount(notice_index);
	}
	
	/* 공지사항 글 검색하기 */
	@Override
	public List<dto_noticeBoard> search_notice(String search_filter, String search_text) {
		if( search_filter.equals("notice_index") ) {
			return dao_noticeBoard.search1(search_text);
		} else if( search_filter.equals("notice_title") ) {
			return dao_noticeBoard.search2(search_text);
		} else {
			return dao_noticeBoard.search3(search_text);
		}
	}

	
	
	/*  배너 이미지 관련  */
	@Override
	public dto_banner_img viewBanner() {
		return dao_banner.viewDao();
	}

	
	
	
	/*  자주하는질문  */
	/*  자주하는질문 리스트  */
	@Override
	public List<dto_fre_ask_board> list_fre_ask() {
		return dao_fre_ask.listDao();
	}
	
	/*  자주하는 질문 카테고리 선택  */
	@Override
	public List<dto_fre_ask_board> select_fre_ask(String categori) {
		return dao_fre_ask.select(categori);
	}

	/*  자주하는 질문 검색  */
	@Override
	public List<dto_fre_ask_board> search_fre_ask(String search_text) {
		if( dao_fre_ask.searchDao1(search_text).isEmpty() ) {
			return dao_fre_ask.searchDao2(search_text);
		} else {
			return dao_fre_ask.searchDao1(search_text);
		}
	}


	
	
	/*  마이페이지  */
	/* 마이오더-리스트 */
	@Override
	public List<dto_myOrder> order_list(String user_id) {
		return dao_myOrder.myOrder(user_id);
	}

	
	
	
	
	
	/*  1:1 문의  */
	/* 글쓰기 */
	@Override
	public int personal_write_ok(Map<String, String> map) {
		int nResult = dao_personal_que.personal_write_ok(map);
		return nResult;
	}




	





	


}

