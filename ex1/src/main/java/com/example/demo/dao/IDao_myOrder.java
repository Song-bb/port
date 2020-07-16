package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.dto_myOrder;

@Mapper
public interface IDao_myOrder {
	
	public List<dto_myOrder> myOrder(String user_id);
	
	
}
