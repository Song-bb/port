package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.dto_members;

@Mapper
public interface IDao_members {
	
	public List<dto_members> login_ok( String user_id, String user_pw );
	public int join_ok( Map<String, String> map );
	public List<dto_members> check_pw(String user_id, String user_pw);
	
		
}


