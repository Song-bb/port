package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.dto_noticeBoard;

@Mapper
public interface IDao_noticeBoard {
	
	public List<dto_noticeBoard> listDao();
	public int articleCount();
	
}
