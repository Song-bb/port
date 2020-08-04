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
	
	public List<dto_items> detail_idx_read(String idx){
		return dao_items.item_detail_idx_read(idx);
	}
	
	// 상품등록하기
	public int item_insert(Map<String, String> map) {
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
	
	
	

}
