package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.dto_event;

@Mapper
public interface IDao_event {
	
	//이벤트 글 리스트
	public List<dto_event> event_listDao();
	//글 상세보기
	public dto_event event_viewDao(int event_index);
	// 게시물 생성
	public int evnet_writeDao(String event_title, String event_content, String event_banner);
	// 게시물 삭제
	public int event_deleteDao(int event_index);
	// 게시물 수정
	public int event_updateDao(String event_title, String event_content, String event_banner);

	//글 조회수
	public int event_viewCount(int event_index);
	
}
