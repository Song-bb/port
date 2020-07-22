package com.example.demo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.IDao_event;
import com.example.demo.dto.dto_event;

@Service
public class Service_event {

	@Autowired
	IDao_event dao_event;
	
	//이벤트 글 리스트
	public List<dto_event> event_list(){
		return dao_event.event_listDao();
	}
	
	//이벤트 글 상세페이지
	public dto_event event_view(int event_index) {
		return dao_event.event_viewDao(event_index);
	}
	
	//이벤트 글 조회수 증가
	public void event_viewCount(int event_index) {
		dao_event.event_viewCount(event_index);
	}
	
	
	
	
	
}
