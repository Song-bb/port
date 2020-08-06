package com.example.demo.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.IDao_items;
import com.example.demo.dto.dto_items;

@Service
public class Service_items {
	
	@Autowired
	IDao_items dao_items;
	
	// 제철과일
	public List<dto_items> season_list(){
		return dao_items.fruitInSeason_viewDao();
	}
	public List<dto_items> season_list_down(){
		return dao_items.fruitInSeason_downDao();
	}
	public List<dto_items> season_list_up(){
		return dao_items.fruitInSeason_upDao();
	}
	public List<dto_items> season_list_new(){
		return dao_items.fruitInSeason_newviewDao();
	}
	public int nSeasonCount() {
		int nSeasonCount = dao_items.fruitInSeason_countDao();
		return nSeasonCount;
	}
	
	// 수입과일
	public List<dto_items> imported_list(){
		return dao_items.importedFruit_viewDao();
	}
	public List<dto_items> imported_list_down(){
		return dao_items.importedFruit_downDao();
	}
	public List<dto_items> imported_list_up(){
		return dao_items.importedFruit_upDao();
	}
	public List<dto_items> imported_list_new(){
		return dao_items.importedFruit_newviewDao();
	}
	public int nimportedCount() {
		int nimportedCount = dao_items.importedFruit_countDao();
		return nimportedCount;
	}
	
	// 낙과채널
	public List<dto_items> fallen_list(){
		return dao_items.fallenFruit_viewDao();
	}
	public List<dto_items> fallen_list_down(){
		return dao_items.fallenFruit_downDao();
	}
	public List<dto_items> fallen_list_up(){
		return dao_items.fallenFruit_upDao();
	}
	public List<dto_items> fallen_list_new(){
		return dao_items.fallenFruit_newviewDao();
	}
	public int nFallenCount() {
		int nFallenCount = dao_items.fallenFruit_countDao();
		return nFallenCount;
	}
	
	// 정기배송
	public List<dto_items> Delivery_list(){
		return dao_items.Delivery_viewDao();
	};
	public List<dto_items> Delivery_list_down(){
		return dao_items.Delivery_downDao();
	};
	public List<dto_items> Delivery_list_up(){
		return dao_items.Delivery_upDao();
	};
	public List<dto_items> Delivery_list_new(){
		return dao_items.Delivery_newDao();
	};
	public int nDeliveryCount(){
		int nDeliveryCount = dao_items.Delivery_countDao();
		return nDeliveryCount;
	};
	
	public List<dto_items> detail_idx_read(String idx){
		return dao_items.item_detail_idx_read(idx);
	}
	
	
	// 상품등록하기
	public int item_insert(Map<String, String> map) {
		String item_category = map.get("item_category").toString();
		String categori_idx = String.valueOf((dao_items.categori_count(item_category)) + 1);
		map.put("categori_idx", categori_idx);
		int nInsertCount = dao_items.item_insert(map);
		return nInsertCount;
	}
	
	// 상품수정하기
	public int item_update(Map<String, String> map) {
		int nUpdateCount = dao_items.item_update(map);
		return nUpdateCount;
	}
	
	// 상품삭제하기
	
	
	// 전체상품보기
	public List<dto_items> All_viewDao(){
		return dao_items.All_viewDao();
	}
	// 전체상품보기(최신순)
	public List<dto_items> All_viewDao_new(){
		return dao_items.All_viewDao_new();
	}
	public int nAllCount() {
		int nAllCount = dao_items.all_countDao();
		return nAllCount;
	}
	
	// 메인 상품 검색
	public List<dto_items> mainSerch(String search){
		return dao_items.mainSerch(search);
	}
	public int mainSerch_count(String search) {
		return dao_items.mainSerch_count(search);
	}
	public List<dto_items> mainSerch_down(String search){
		return dao_items.mainSerch_down(search);
	}
	public List<dto_items> mainSerch_high(String search){
		return dao_items.mainSerch_high(search);
	}
	
	// 관리자페이지-상품관리 // 카테고리별 선택
	public List<dto_items> categoriView (String categori){
		if( categori.equals("모든상품") ) {
			return dao_items.All_viewDao();
		} else {
			return dao_items.season_categoriView(categori);
		}
	}
	// 관리자페이지-상품관리 // 카테고리별 선택 카운트
	public int nCategoriCount(String categori) {
		if( categori.equals("모든상품") ) {
			return dao_items.all_countDao();
		} else {
			return dao_items.season_categoriCount(categori);
		}
	}
	
	// 정기배송 아이템
	public List<dto_items> regularItem(){
		return dao_items.regularItem();
	}
	
	
	
	

}
