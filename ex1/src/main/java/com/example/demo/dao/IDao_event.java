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
	//글 조회수
	public int event_viewCount(int event_index);
	
}
