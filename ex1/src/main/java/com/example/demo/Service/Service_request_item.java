package com.example.demo.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.IDao_request_item;
import com.example.demo.dto.dto_request_item;

@Service
public class Service_request_item {
	
	@Autowired
	IDao_request_item dao_request_item;
	
	public int insertQuestion(Map<String, String> map) {
		return dao_request_item.insertQuestion(map);
	}
	
	public List<dto_request_item> view_question(String idx){
		return dao_request_item.view_question(idx);
	}
	

}
