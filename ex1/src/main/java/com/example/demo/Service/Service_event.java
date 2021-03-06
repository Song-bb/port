package com.example.demo.Service;

import java.util.List;
import java.util.Map;

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
	public dto_event event_view(String event_index) {
		return dao_event.event_viewDao(event_index);
	}
	
	//이벤트 글 생성
	public int event_write(Map<String, String> map) {
		int nResult = dao_event.event_writeDao(map);
		return nResult;
	}
	
	//이벤트 글 수정
	public List<dto_event> event_update(String event_index){
		return dao_event.event_updateDao(event_index);
	}
	
	//이벤트 글 수정확인
		public int event_updateok(Map<String, String> map){
			int nResult = dao_event.event_updateokDao(map);
			return nResult;
		}
	
	//이벤트 글 삭제
	public int event_delete (String event_index) {
		int nResult = dao_event.event_deleteDao(event_index);
		return nResult;
	}
	
	
	//이벤트 글 조회수 증가
	public void event_viewCount(String event_index) {
		dao_event.event_viewCount(event_index);
	}
	
	
	
	
	
}
