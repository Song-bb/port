package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.dto_items;
import com.example.demo.dto.dto_review;

@Mapper
public interface IDao_review {

	public int addReview(Map<String, String> map);
	public int count_user(String user_id);
	public List<dto_review> viewReview(String user_id);
	public int itemDetail_reviewCount(String item_number);
	public List<dto_review> itemReview_point(String item_number);
	public List<dto_review> review_item(String item_number);
	public List<dto_review> review_allIitem(String item_number);
	
	
	
}
