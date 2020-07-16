package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.dto_fre_ask_board;

@Mapper
public interface IDao_fre_ask_board {

	public List<dto_fre_ask_board> listDao();
	public List<dto_fre_ask_board> select(String categori);
	public List<dto_fre_ask_board> searchDao1(String search_text);
	public List<dto_fre_ask_board> searchDao2(String search_text);
	
}
