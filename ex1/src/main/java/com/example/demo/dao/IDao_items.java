package com.example.demo.dao;

import java.util.List;
import java.util.Map;

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
	
	// 정기배송
	public List<dto_items> Delivery_viewDao();
	public List<dto_items> Delivery_downDao();
	public List<dto_items> Delivery_upDao();
	public List<dto_items> Delivery_newDao();
	
	// 상품 카운트 세기
	public int fruitInSeason_countDao();
	public int importedFruit_countDao();
	public int fallenFruit_countDao();
	public int Delivery_countDao();
	
	// 상품보기
	public List<dto_items> item_detail_idx_read(String idx);
	
	// 상품등록하기
	public int item_insert(Map<String, String> map);
	public int categori_count(String item_category);
	
	// 상품수정하기
	public int item_update(Map<String, String> map);
	
	// 상품삭제하기
	
	// 전체상품보기
	public List<dto_items> All_viewDao();
	public List<dto_items> All_viewDao_new();
	public int all_countDao();
	
	// 메인 상품검색
	public List<dto_items> mainSerch(String search);
	public int mainSerch_count(String search);
	public List<dto_items> mainSerch_down(String search);
	public List<dto_items> mainSerch_high(String search);
	
	
	// 관리자페이지 - 상품보기(카테고리 선택)
	public List<dto_items> season_categoriView(String categori);
	public int season_categoriCount(String categori);
	
	// 정기배송 아이템
	public List<dto_items> regularItem();
	
	public List<dto_items> check_itemNumber(String item_idx);
	
	
}
