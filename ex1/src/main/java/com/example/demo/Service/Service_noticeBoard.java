package com.example.demo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.IDao_noticeBoard;
import com.example.demo.dto.dto_noticeBoard;

@Service
public class Service_noticeBoard {

	@Autowired
	IDao_noticeBoard dao_noticeBoard;
	
	/*  공지사항  */
	/* 공지사항 글 리스트 */
	public List<dto_noticeBoard> list_notice() {
		return dao_noticeBoard.listDao();
	}
	
	/* 공지사항 글 갯수 카운트 */
	public int count() {
		int nTotalCount = dao_noticeBoard.articleCount();
		return nTotalCount;
	}

	/* 공지사항 글 상세보기 */
	public dto_noticeBoard view_notice(String notice_index) {
		return dao_noticeBoard.viewDao(notice_index);
	}
	/* 공지사항 글 상세보기 시 조회수 증가 */
	public void updateViewCount_notice(String notice_index) {
		dao_noticeBoard.updateViewCount(notice_index);
	}
	
	/* 공지사항 글 검색하기 */
	public List<dto_noticeBoard> search_notice(String search_filter, String search_text) {
		if( search_filter.equals("notice_index") ) {
			return dao_noticeBoard.search1(search_text);
		} else if( search_filter.equals("notice_title") ) {
			return dao_noticeBoard.search2(search_text);
		} else {
			return dao_noticeBoard.search3(search_text);
		}
	}
	
	
	
	
}
