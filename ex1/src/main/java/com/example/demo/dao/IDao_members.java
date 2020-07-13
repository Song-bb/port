package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IDao_members {
	
	public Map<String, String> login_ok( Map<String, String> map );
	
	public int join_ok( Map<String, String> map );
		
}


