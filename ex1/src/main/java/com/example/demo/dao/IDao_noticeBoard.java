package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.dto_noticeBoard;

@Mapper
public interface IDao_noticeBoard {
	
	public List<dto_noticeBoard> listDao();
	public int articleCount();
	public dto_noticeBoard viewDao(String notice_index);
	public int noticeViewCount(String notice_index);
	public void updateViewCount(String notice_index);
	public List<dto_noticeBoard> search1(String search_text );
	public List<dto_noticeBoard> search2(String search_text );
	public List<dto_noticeBoard> search3(String search_text );
	public int notice_insert(Map<String, String> map);
    public int notice_update(Map<String, String> map);
	
}
