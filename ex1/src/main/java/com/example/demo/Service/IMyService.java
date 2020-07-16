package com.example.demo.Service;

import java.util.List;
import java.util.Map;

import com.example.demo.dto.dto_banner_img;
import com.example.demo.dto.dto_fre_ask_board;
import com.example.demo.dto.dto_members;
import com.example.demo.dto.dto_myOrder;
import com.example.demo.dto.dto_noticeBoard;

public interface IMyService {
	
	/*  배너이미지 관련  */
	public dto_banner_img viewBanner();
	
	
	
	/*  회원관리  */
	public List<dto_members> login( String user_id, String user_pw );
	public int join_ok ( Map<String, String> map );
	public List<dto_members> check_pw(String user_id, String user_pw);
	
	
	
	
	/*  공지사항  */
	public List<dto_noticeBoard> list_notice();
	public int count();
	public dto_noticeBoard view_notice(String notice_index);
	public void updateViewCount_notice(String notice_index);
	public List<dto_noticeBoard> search_notice( String search_filter, String search_text);
	
	
	
	/*  자주하는질문  */
	public List<dto_fre_ask_board> list_fre_ask();
	public List<dto_fre_ask_board> select_fre_ask(String categori);
	public List<dto_fre_ask_board> search_fre_ask( String search_text );

	
	
	/*  마이페이지  */
	public List<dto_myOrder> order_list(String user_id);
	
	
	
}

