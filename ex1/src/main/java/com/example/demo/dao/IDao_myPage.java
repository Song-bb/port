package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.dto_myPage;

@Mapper
public interface IDao_myPage {
	
	public List<dto_myPage> myOrder(String user_id);
	
	
}
