package com.example.demo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.IDao_items;
import com.example.demo.dto.dto_items;

@Service
public class Service_items {
	
	@Autowired
	IDao_items dao_items;
	
	// 제철과일
	public List<dto_items> season_list(String item_category){
		return dao_items.fruitInSeason_viewDao();
	}
	public List<dto_items> season_list_down(String item_category){
		return dao_items.fruitInSeason_downDao();
	}
	public List<dto_items> season_list_up(String item_category){
		return dao_items.fruitInSeason_upDao();
	}
	public List<dto_items> season_list_new(String item_category){
		return dao_items.fruitInSeason_newviewDao();
	}
	public int season_countlist() {
		return dao_items.fruitInSeason_countDao();
	}
	
	// 수입과일
	public List<dto_items> imported_list(String item_category){
		return dao_items.importedFruit_viewDao();
	}
	public List<dto_items> imported_list_down(String item_category){
		return dao_items.importedFruit_downDao();
	}
	public List<dto_items> imported_list_up(String item_category){
		return dao_items.importedFruit_upDao();
	}
	public List<dto_items> imported_list_new(String item_category){
		return dao_items.importedFruit_newviewDao();
	}
	public int imported_countlist() {
		return dao_items.importedFruit_countDao();
	}
	
	// 낙과채널
	public List<dto_items> fallen_list(String item_category){
		return dao_items.fallenFruit_viewDao();
	}
	public List<dto_items> fallen_list_down(String item_category){
		return dao_items.fallenFruit_downDao();
	}
	public List<dto_items> fallen_list_up(String item_category){
		return dao_items.fallenFruit_upDao();
	}
	public List<dto_items> fallen_list_new(String item_category){
		return dao_items.fallenFruit_newviewDao();
	}
	public int fallen_countlist() {
		return dao_items.fallenFruit_countDao();
	}

}
