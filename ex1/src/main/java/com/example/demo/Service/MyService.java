package com.example.demo.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;

import com.example.demo.dao.IDao_banner_img;
import com.example.demo.dao.IDao_members;
import com.example.demo.dao.IDao_noticeBoard;
import com.example.demo.dto.dto_banner_img;
import com.example.demo.dto.dto_members;
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
	PlatformTransactionManager transactionManager;
	@Autowired
	TransactionDefinition definition;
	
	
	
	/*  회원관리  */
	/* 로그인 */
	@Override
	public List<dto_members> login( Map<String, String> map ) {
		return dao_member.login_ok( map );
	}
	
	/* 회원가입 */
	@Override
	public int join_ok(Map<String, String> map) {
		int nResult = dao_member.join_ok(map);
		return nResult;
	}
	
	
	
	/*  공지사항  */
	/* 공지사항 글 리스트 */
	@Override
	public List<dto_noticeBoard> list1() {
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
	public dto_noticeBoard view(String notice_index) {
		return dao_noticeBoard.viewDao(notice_index);
	}
	/* 공지사항 글 상세보기 시 조회수 증가 */
	public void updateViewCount(String notice_index) {
		dao_noticeBoard.updateViewCount(notice_index);
	}
	
	/* 공지사항 글 검색하기 */
	@Override
	public List<dto_noticeBoard> search(String search_filter, String search_text) {
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




	


}

