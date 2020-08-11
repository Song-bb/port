package com.example.demo.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IDao_payment {

	public int dao_payment(Map<String, String> map);
	
}
