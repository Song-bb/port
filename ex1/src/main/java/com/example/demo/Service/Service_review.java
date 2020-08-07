package com.example.demo.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.IDao_review;
import com.example.demo.dto.dto_review;

@Service
public class Service_review {

	@Autowired
	IDao_review dao_review;
	
	public int addReview( Map<String, String> map ) {
		String user_id = map.get("user_id").toString();
		String user_index = String.valueOf(dao_review.count_user(user_id) + 1);
		map.put("user_index", user_index);
		return dao_review.addReview(map);
	}
	
	public List<dto_review> viewReview(String user_id){
		return dao_review.viewReview(user_id);
	}
	
	public int itemDetail_reviewCount(String item_idx){
		String item_number = dao_review.check_itemNumber(item_idx).get(0).getItem_number();
		return dao_review.itemDetail_reviewCount(item_number);
	}
	
	public int itemDetail_reviewTotal(String item_idx, int reviewCount) {
		String item_number = dao_review.check_itemNumber(item_idx).get(0).getItem_number();
		List<dto_review> item_points = dao_review.itemReview_point(item_number);
		int totalPoint = 0;
		for( int i=0; i<item_points.size(); i++ ) {
			totalPoint += Integer.parseInt(item_points.get(i).getReview_score());
		}
		return totalPoint;
	}
	
	
	
}
