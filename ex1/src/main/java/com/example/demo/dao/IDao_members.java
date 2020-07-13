package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.dto_members;

@Mapper
public interface IDao_members {
	
	public List<dto_members> listDao_member();
	public List<dto_members> login(String user_id, String user_pw);
		
	
}


