package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.dto_personal_question;

@Mapper
public interface IDao_personal_question {
	
	public int personal_write_ok( Map<String, String> map );
	public List<dto_personal_question> listDao(String user_id);
	public int countDao (String user_id);
	public List<dto_personal_question> readDao(String idx);
	
}
