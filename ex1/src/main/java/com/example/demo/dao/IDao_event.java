package com.example.demo.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.dto_event;

@Mapper
public interface IDao_event {
	
	//이벤트 글 리스트
	public List<dto_event> event_listDao();
	//글 상세보기
	public dto_event event_viewDao(String event_index);
	// 게시물 생성
	public int event_writeDao(Map<String, String> map);
	// 게시물 삭제
	public int event_deleteDao(String event_index);
	// 게시물 수정
	public List<dto_event> event_updateDao(String event_index);

	//글 조회수
	public void event_viewCount(String event_index);
	
}
