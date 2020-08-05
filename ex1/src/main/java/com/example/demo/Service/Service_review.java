package com.example.demo.Service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.IDao_review;

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
	
}
