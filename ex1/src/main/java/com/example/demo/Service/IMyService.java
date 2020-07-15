package com.example.demo.Service;

import java.util.List;
import java.util.Map;

import com.example.demo.dto.dto_banner_img;
import com.example.demo.dto.dto_members;
import com.example.demo.dto.dto_noticeBoard;

public interface IMyService {
	
	/*  배너이미지 관련  */
	public dto_banner_img viewBanner();
	
	
	
	/*  회원관리  */
	public List<dto_members> login( Map<String, String> map );
	public int join_ok ( Map<String, String> map );
	
	
	
	/*  공지사항  */
	public List<dto_noticeBoard> list1();
	public int count();
	public dto_noticeBoard view(String notice_index);
	public void updateViewCount(String notice_index);
	public List<dto_noticeBoard> search( String search_filter, String search_text);
	
}

