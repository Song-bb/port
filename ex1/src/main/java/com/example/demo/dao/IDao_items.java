package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.dto_items;

@Mapper
public interface IDao_items {
	
	// 제철과일
	public List<dto_items> fruitInSeason_viewDao();
	public List<dto_items> fruitInSeason_downDao();
	public List<dto_items> fruitInSeason_upDao();
	public List<dto_items> fruitInSeason_newviewDao();
	
	// 수입과일
	public List<dto_items> importedFruit_viewDao();
	public List<dto_items> importedFruit_downDao();
	public List<dto_items> importedFruit_upDao();
	public List<dto_items> importedFruit_newviewDao();
	
	// 낙과채널
	public List<dto_items> fallenFruit_viewDao();
	public List<dto_items> fallenFruit_downDao();
	public List<dto_items> fallenFruit_upDao();
	public List<dto_items> fallenFruit_newviewDao();
	
	// 상품 카운트 세기
	public int fruitInSeason_countDao();
	public int importedFruit_countDao();
	public int fallenFruit_countDao();
	
	
}