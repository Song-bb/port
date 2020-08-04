package com.example.demo.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IDao_review {

	public int addReview(Map<String, String> map);
	public int count_user()
	
	
}
