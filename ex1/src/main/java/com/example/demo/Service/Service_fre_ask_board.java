package com.example.demo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.IDao_fre_ask_board;
import com.example.demo.dto.dto_fre_ask_board;

@Service
public class Service_fre_ask_board {

	@Autowired
	IDao_fre_ask_board dao_fre_ask;
	
	
	/*  자주하는질문  */
	/*  자주하는질문 리스트  */
	public List<dto_fre_ask_board> list_fre_ask() {
		return dao_fre_ask.listDao();
	}
	
	/*  자주하는 질문 카테고리 선택  */
	public List<dto_fre_ask_board> select_fre_ask(String categori) {
		return dao_fre_ask.select(categori);
	}

	/*  자주하는 질문 검색  */
	public List<dto_fre_ask_board> search_fre_ask(String search_text) {
		if( dao_fre_ask.searchDao1(search_text).isEmpty() ) {
			return dao_fre_ask.searchDao2(search_text);
		} else {
			return dao_fre_ask.searchDao1(search_text);
		}
	}
	
	
	
	
	
}
