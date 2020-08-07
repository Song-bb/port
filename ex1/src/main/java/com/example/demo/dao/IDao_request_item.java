package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.dto_request_item;

@Mapper
public interface IDao_request_item {
	
	public int insertQuestion(Map<String, String> map);
	public List<dto_request_item> view_question(String idx);
	
}
