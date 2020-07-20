package com.example.demo.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IDao_personal_question {

	public int personal_write_ok( Map<String, String> map );
	
}
